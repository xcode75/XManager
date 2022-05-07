<?php

namespace App\Payments;
 
use App\Http\Models\Order;
use App\Http\Models\User;
use App\Http\Models\Package;
use App\Http\Models\Coupon;
use App\Handlers\Config;
use App\Helpers\Helpers;
use App\Helpers\i18n;
use App\Http\Controllers\BaseController;
use App\Http\Models\Currency;
use App\Handlers\AuthHandler\Auth;
use App\Http\Models\TempOrder;

class EasyPay extends BaseController
{
    public function easypay($request, $response, $args)
    {
		ini_set('memory_limit', '-1');
		$user = Auth::getUser();
		if (!$user->isLogin) {
            return $response->withStatus(302)->withHeader('Location', '/login');
        }
		
		$Currency = new Currency();
		$Config = new Config();
		$lang = new i18n();
		$content = $request->getParsedBody();
		$order_id  = $content['order_id'];
		$item = TempOrder::where('userid', $user->id)->where("order_id", $order_id)->first();
		
		if(!$item){	
			$res['ret'] = 0;			
			$res['msg'] = $lang->get('pack_not_found');
			$res['url'] = (new Checkout())->Url().'/portal/packages';
			$response->getBody()->write(json_encode($res));
			return  $response;
		}
		if($item->pay_url != "" || $item->pay_url != null){
			$res['ret'] 		= 1;
			$res['url'] 	    = $item->pay_url;
			$response->getBody()->write(json_encode($res));
			return $response;
		}
		$amount    = $item->total;
        $packageid = $item->packageid;		
		$package = Package::where('id', $packageid)->where('status', 1)->first();
		if (!$package) {
			$res['ret'] 		= 0;
			$res['msg'] 		= $lang->get('off_shelves');
			$response->getBody()->write(json_encode($res));
			return $response;
		}
		
        $price = bcadd($amount,0,2);
		
		$rate = $Currency->getRate($Config->getConfig('easypay_currency_code'));
		
		$item->status 		= 0;
		$item->create_date 	= time();
		$item->expdate 		= time() + 7200;
		$item->exrate		= bcmul($price,$rate, 2);
        $item->notify_url 	= (new Checkout())->Callback()."/notify/epay";
        $item->type		    = 9;
		$item->save();
		
		$parameter = [
			"pid" 			=> trim($Config->getConfig('easypay_app_id')),
			"type" 			=> $content['type'],
			"notify_url"	=> $item->notify_url,
			"return_url"	=> $item->notify_url,
			"out_trade_no"	=> $item->order_id,
			"name"			=> $user->lang == "en" ? $package->name : $package->cn_name,
			"money"			=> $item->exrate,
			"sitename"		=> $Config->getConfig('appName')
		];
		$parameter['sign'] = self::sign($parameter, 'MD5', $Config->getConfig('easypay_secret'));
		$parameter['sign_type'] = strtoupper(trim('MD5'));
		
		$url = $Config->getConfig('easypay_apiurl')."/submit.php?".http_build_query($parameter);
		
        $item = TempOrder::where("id", '=', $item->id)->where('status', 0)->first();
		$item->pay_url 	= $url;				
		$item->save();
			
		$res['ret'] 	= 1;
		$res['url'] 	= $url;
		$response->getBody()->write(json_encode($res));
		return $response;
    }
	
	public static function sign($data, $signType = 'MD5', $privateKey)
    {
        if (isset($data['sign'])) unset($data['sign']);
        ksort($data);
        $signSrc = "";
        foreach ($data as $k => $v) {
            if (empty($v) || $v === "")
                unset($data[$k]);
            else
                $signSrc .= $k . '=' . $v . '&';
        }
        $signSrc = trim($signSrc, '&') . $privateKey;
        return md5($signSrc);
    }



	public static function signVeryfy($data, $sign)
    {
		$Config = new Config();
        if (isset($data['sign'])) unset($data['sign']);
		if (isset($data['sign_type'])) unset($data['sign_type']);
        ksort($data);
        $signSrc = "";
        foreach ($data as $k => $v) {
            if (empty($v) || $v === "")
                unset($data[$k]);
            else
                $signSrc .= $k . '=' . $v . '&';
        }
        $signSrc = trim($signSrc, '&') . $Config->getConfig('easypay_secret');
        $mysgin =  md5($signSrc);
		if($mysgin == $sign) {
			return true;
		}
		else {
			return false;
		}
    }
	
	
	public function verifyNotify(){
		if(empty($_GET)) {
			return false;
		}
		else {
			$isSign = self::signVeryfy($_GET, $_GET["sign"]);
			$responseTxt = 'true';
			if (preg_match("/true$/i",$responseTxt) && $isSign) {
				return true;
			} else {
				return false;
			}
		}
	}
	
    public function query($out_trade_no) {
		$Config = new Config();		
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL, $Config->getConfig('easypay_apiurl').
			'/api.php?act=order&pid='.$Config->getConfig('easypay_app_id').
			'&key='.$Config->getConfig('easypay_secret').
			'&out_trade_no='.$out_trade_no
		);
        curl_setopt($curl, CURLOPT_POST, 1);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, false);
        $res = curl_exec($curl);
        curl_close($curl);		
		return $res;
    }
	
    public function callback($request, $response, $args)
    {		
		ini_set('memory_limit', '-1');
		$Config = new Config();
		$content = $request->getQueryParams();
		if ($this->verifyNotify()) {
			$Config = new Config();
			$result   = json_decode(self::query($content['out_trade_no']), true);
			if($result['status'] == 1 || $result['status'] == "1"){
				$order = TempOrder::where("order_id", '=', $content['out_trade_no'])->first();
				if($order){
					(new Purchase())->update($content['out_trade_no']);
					return $response->withStatus(302)->withHeader('Location', (new Checkout())->Url().'/portal/success?orderid='.$content['out_trade_no']);
				}else{
					$orders = Order::where("order_id", '=', $content['out_trade_no'])->first();
					if($orders->state == 1 || $orders->state == "1"){
						return $response->withStatus(302)->withHeader('Location', (new Checkout())->Url().'/portal/success?orderid='.$content['out_trade_no']);
					}else{
						return $response->withStatus(302)->withHeader('Location', (new Checkout())->Url().'/portal/orders');
					}
				}
			}else{
				$response->getBody()->write($result['msg']);
				return $response;
			}	
		}else{
			return $response->withStatus(302)->withHeader('Location', (new Checkout())->Url().'/portal/orders');
		}
	}
}	