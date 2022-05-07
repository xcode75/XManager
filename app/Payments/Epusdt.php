<?php

namespace App\Payments;
 
use Exception;
use App\Helpers\i18n; 
use App\Handlers\Config;
use App\Helpers\Helpers;
use App\Template as View;
use App\Http\Models\Order;
use App\Http\Models\User;
use App\Http\Models\Package;
use App\Http\Models\Coupon;
use App\Http\Models\Currency;
use App\Http\Models\TempOrder;
use App\Http\Controllers\BaseController;
use App\Handlers\AuthHandler\Auth;
use App\Helpers\QrcodeGen;

class Epusdt extends BaseController
{
	public function _curlPost($p){
		$Config = new Config();
		$curl = curl_init();
		curl_setopt_array($curl, array(
			CURLOPT_URL => $Config->getConfig('epusdt_api'),
			CURLOPT_RETURNTRANSFER => true,
			CURLOPT_ENCODING => '',
			CURLOPT_MAXREDIRS => 10,
			CURLOPT_TIMEOUT => 0,
			CURLOPT_FOLLOWLOCATION => true,
			CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
			CURLOPT_CUSTOMREQUEST => 'POST',
			CURLOPT_POSTFIELDS => json_encode($p),
			CURLOPT_HTTPHEADER => array(
			  "Content-Type: application/json",
			),
		));

		$response = curl_exec($curl);
		curl_close($curl);
		return $response;
	}

    public function Sign(array $parameter, string $signKey)
    {
        ksort($parameter);
        reset($parameter); 
        $sign = '';
        $urls = '';
        foreach ($parameter as $key => $val) {
            if ($val == '') continue;
            if ($key != 'signature') {
                if ($sign != '') {
                    $sign .= "&";
                    $urls .= "&";
                }
                $sign .= "$key=$val"; 
                $urls .= "$key=" . urlencode($val); 
            }
        }
        $sign = md5($sign . $signKey);
        return $sign;
    }
	
    public function epusdt($request, $response, $args)
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
		
		if($item->pay_qrcode != "" || $item->pay_qrcode != null){
			$res['ret'] 		= 1;
			$res['url'] 	    = (new Checkout())->Url().'/portal/pay?orderid='.$item->order_id;
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
		
		$rate = $Currency->getRate($Config->getConfig('epusdt_currency_code'));
		
		$item->status 		= 0;
		$item->create_date 	= time();
		$item->exrate		= bcmul($price,$rate, 2);
        $item->notify_url 	= (new Checkout())->Callback()."/notify/epusdt";
        $item->type		    = 21;
		$item->save();
		
		
		$parameter = [
			'order_id' 		=> (string)$item->order_id,
			'amount'    	=> (float)$item->exrate,
			'notify_url' 	=> rtrim($item->notify_url),
			'redirect_url'	=> rtrim($item->notify_url),
		];		
		
		$parameter['signature'] = self::Sign($parameter, $Config->getConfig('epusdt_token'));
		
		$ret = json_decode($this->_curlPost($parameter),true);
		
		if (isset($ret['status_code']) && $ret['status_code'] == 200 && $ret['message'] == "success") {
			$item = TempOrder::where("id", '=', $item->id)->where('status', 0)->first();
			$item->pay_url 	    = $ret['data']['payment_url'];
			$item->pay_qrcode 	= (new QrcodeGen())->Generate2($ret['data']['token'], LOGO_PATH.($Config->getConfig('template') ? $Config->getConfig('template') : "default")."/img/pay/4.png");
			$item->wallet 		= $ret['data']['token'];
			$item->expdate 		= $ret['data']['expiration_time'];
			$item->amount       = $ret['data']['actual_amount'];
			$item->save();	
				
			$res['ret'] 		= 1;
			$res['url'] 		= (new Checkout())->Url().'/portal/pay?orderid='.$item->order_id;
			$response->getBody()->write(json_encode($res));
			return $response;
		}else {
			$res['ret'] 	= 0;
			$res['msg'] 	= $ret['status_code']." - ".$ret['message'];
			$response->getBody()->write(json_encode($res));
			return $response;
        }
    }

    public function checkorder($request, $response, $args)
    {
		$content = $request->getParsedBody();
		$Config = new Config();
        $res = Order::where("order_id", $content['order_id'])->first();
        if (!$res){
			$rs['result']   = 0;
			$response->getBody()->write(json_encode($rs));
		    return $response;						
        }else{
			$rs['result']   = 1;
			$rs['url']   = (new Checkout())->Url().'/portal/success?orderid='.$res->order_id;
			$response->getBody()->write(json_encode($rs));
		    return $response;	
		}
    }
	
	
    public function callback($request, $response, $args)
    {
		$Config = new Config();
		$content = $request->getParsedBody();
		$order = TempOrder::where("order_id", '=', $content['order_id'])->first();
		$parameters = [
			"order_id " 	=> $content['order_id'],
			"amount " 		=> $order->exrate,
			"notify_url"	=> $$order->notify_url,
			"redirect_url "	=> $order->notify_url,
		];
		$signature = self::Sign($parameters, $Config->getConfig('epusdt_token'));		
		if($content['signature'] == $signature){
			if ($order && $order->exrate == $content['amount'] && $content['status'] == 1){
					(new Purchase())->update($content['order_id']);
					return $response->withStatus(302)->withHeader('Location', (new Checkout())->Url().'/portal/success?orderid='.$content['order_id']);
					exit;
			} else {
				$orders = Order::where("order_id", '=', $content['order_id'])->first();
				if($orders->state == 1 || $orders->state == "1"){
					return $response->withStatus(302)->withHeader('Location', (new Checkout())->Url().'/portal/success?orderid='.$content['order_id']);
				}else{
					return $response->withStatus(302)->withHeader('Location', (new Checkout())->Url().'/portal/orders');
				}
			}
		}else{
			$response->getBody()->write("invalid signtaure");
			return $response;
		}
	}	
}	
