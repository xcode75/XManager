<?php

namespace App\Payments;

use App\Http\Models\Order;
use App\Http\Models\User;
use App\Http\Models\Package;
use App\Http\Models\Coupon;
use App\Handlers\Config;
use App\Helpers\i18n;
use App\Helpers\Helpers;
use Exception;
use Omnipay\Omnipay;
use App\Http\Controllers\BaseController;
use App\Components\QrCode\QrcodeGenerator;
use App\Http\Models\Currency;
use App\Handlers\AuthHandler\Auth;
use App\Http\Models\TempOrder;

class THeadPay extends BaseController
{

	
    public function theadpay($request, $response, $args)
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
		$item = TempOrder::where("order_id", $order_id)->where('userid', $user->id)->first();
		
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
		
		$rate = $Currency->getRate($Config->getConfig('theadpay_currency_code'));
		
		$item->status 		= 0;
		$item->create_date 	= time();
		$item->expdate 		= (time() + 600)*1000;
		$item->exrate		= bcmul($price,$rate, 2);
        $item->notify_url 	= (new Checkout())->Callback()."/notify/callback";
        $item->type		    = 6;
		$item->save();
		
		$rate = $Currency->getRate($Config->getConfig('theadpay_currency_code'));
	
		$order = [
            'trade_no'      => $item->order_id,
            'total_fee'     => (float)($item->exrate * 100),
            'notify_url'    => rtrim($item->notify_url),
            'return_url'    => rtrim($item->notify_url),
        ];
		$result = self::pay($order);
		
		if(isset($result["status"]) && $result["status"] == "success"){
			$item = TempOrder::where("id", '=', $item->id)->where('status', 0)->first();
			$item->pay_url 	= $result["code_url"];
			$item->save();	

			$res['ret'] 		= 1;
			$res['url'] 		= $result["code_url"];
			$response->getBody()->write(json_encode($res));
		    return $response;
        } else{
			$res['ret'] 	= 0;
			$res['msg'] 	= $lang->get('order-create-error').' '.$result["message"];
			$response->getBody()->write(json_encode($res));
		    return $response;
        }	  
    }



    public function verify($params) {
        return $params['sign'] === $this->sign($params);
    }

    protected function sign($params) {
		$Config = new Config();
        unset($params['sign']);
        ksort($params);
        reset($params);
        $data = http_build_query($params) . "&key=" . $Config->getConfig('theadpay_key');
        return strtoupper(md5($data));
    }

    public function pay($order) {
		
		$Config = new Config();
		$params = [
            'mchid' => $Config->getConfig('theadpay_mchid'),
            'out_trade_no' => $order['trade_no'],
            'total_fee' => (string)$order['total_fee'], // in cents
            'notify_url' => $order['notify_url'],
            'return_url' => $order['return_url'],
        ];
        $params['sign'] = $this->sign($params);
		
        $data = json_encode($params);

        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL, $Config->getConfig('theadpay_url').'/'.$Config->getConfig('theadpay_mchid'));
        curl_setopt($curl, CURLOPT_POST, 1);
        curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
        curl_setopt($curl, CURLOPT_HTTPHEADER, ['Content-Type: application/json']);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, false);
        $data = curl_exec($curl);
        curl_close($curl);
		
		$result = json_decode($data, true);
		
		return $result;		 
    }
	
	
	public function callback($request, $response, $args)
    {
		$Config = new Config();
		$user = Auth::getUser();
		ini_set('memory_limit', '-1');
        $inputString = file_get_contents('php://input', 'r');
        $inputStripped = str_replace(array("\r", "\n", "\t", "\v"), '', $inputString);
        $params = json_decode($inputStripped, true); //convert JSON into array
		$pid = $params['out_trade_no'];	
		$order = TempOrder::where("order_id", '=', $pid)->where('userid', $user->id)->first();
		if ($this->verify($params)) {
			if ($pid) {
				if($order){
					(new Purchase())->update($pid);
					return $response->withStatus(302)->withHeader('Location', (new Checkout())->Url().'/portal/success?orderid='.$pid);
				}else{
					$orders = Order::where("order_id", '=', $pid)->where('userid', $user->id)->first();
					if($orders->state == 1 || $orders->state == "1"){
						return $response->withStatus(302)->withHeader('Location', (new Checkout())->Url().'/portal/success?orderid='.$pid);
					}else{
						return $response->withStatus(302)->withHeader('Location', (new Checkout())->Url().'/portal/orders');
					}
				}
			}
		}else{
			return $response->withStatus(302)->withHeader('Location', (new Checkout())->Url().'/portal/orders');
		}
		$response->getBody()->write("");
		return $response;
	}
}	