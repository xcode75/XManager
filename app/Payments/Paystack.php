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
use Exception;


class Paystack extends BaseController
{
	public function _curlPost($amount,$type,$order_id,$notify_url){
		$Config = new Config();
		$user = Auth::getUser();
		
		if($type == "card"){
			$currency = $Config->getConfig('paystack_currency_code') ? $Config->getConfig('paystack_currency_code') : "USD";
		}else{
			$currency = $Config->getConfig('paystack_mobile_currency_code') ? $Config->getConfig('paystack_mobile_currency_code') : "GHS";
		}
		
		$params = [
			'amount' => $amount * 100, 
			'currency' => $currency, 
			'channels'  => array($type), 
			'callback_url' => $notify_url, 
			'reference' => $order_id, 
			'email' => $user->email
		];
		$curl = curl_init();
		curl_setopt_array($curl, array(
			CURLOPT_URL => "https://api.paystack.co/transaction/initialize",
			CURLOPT_RETURNTRANSFER => true,
			CURLOPT_ENCODING => "",
			CURLOPT_MAXREDIRS => 10,
			CURLOPT_TIMEOUT => 0,
			CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
			CURLOPT_CUSTOMREQUEST => "POST",
			CURLOPT_POSTFIELDS => json_encode($params),
			CURLOPT_HTTPHEADER => array(
			  "Authorization: Bearer ".$Config->getConfig('paystack_secret'),
			  "Cache-Control: no-cache",
			  "Content-Type: application/json",
			),
		));
	  
		$response = curl_exec($curl);
		curl_close($curl);
		return $response;
	}
	
    public function paystack($request, $response, $args)
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
		

		if($type == "card"){
			$currency = $Config->getConfig('paystack_currency_code') ? $Config->getConfig('paystack_currency_code') : "USD";
		}else{
			$currency = $Config->getConfig('paystack_mobile_currency_code') ? $Config->getConfig('paystack_mobile_currency_code') : "GHS";
		}
		
		$rate = $Currency->getRate($currency);
		
		$item->status 		= 0;
		$item->create_date 	= time();
		$item->expdate 		= (time() + 600);
		$item->exrate		= bcmul($price,$rate, 2);
        $item->notify_url 	= (new Checkout())->Callback()."/notify/paystack";
        $item->type		    = 19;
		$item->save();

		$ret = json_decode($this->_curlPost($item->exrate, $content['type'], $item->order_id, $item->notify_url),true);
		
		if (isset($ret['status']) && $ret['status'] == true) {
			$item = TempOrder::where("id", '=', $item->id)->where('status', 0)->first();
			$item->pay_url 	= $ret['data']['authorization_url'];
			$item->save();	
				
			$res['ret'] 	= 1;
			$res['url'] 	= $item->pay_url;			
			$response->getBody()->write(json_encode($res));
			return $response;
		}else {
			$res['ret'] 	= 0;
			$res['msg'] 	= $ret['message'];
			$response->getBody()->write(json_encode($res));
			return $response;
        }
    }
	
	public function Verify($order_id){
		$Config = new Config();

		$curl = curl_init();
		curl_setopt_array($curl, array(
			CURLOPT_URL => "https://api.paystack.co/transaction/verify/".$order_id,
			CURLOPT_RETURNTRANSFER => true,
			CURLOPT_ENCODING => "",
			CURLOPT_MAXREDIRS => 10,
			CURLOPT_TIMEOUT => 0,
			CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
			CURLOPT_CUSTOMREQUEST => "GET",
			CURLOPT_HTTPHEADER => array(
			  "Authorization: Bearer ".$Config->getConfig('paystack_secret'),
			  "Cache-Control: no-cache",
			  "Content-Type: application/json",
			),
		));
	  
		$response = curl_exec($curl);
		curl_close($curl);
		return $response;
	}
	
    public function callback($request, $response, $args)
    {		
		$Config = new Config();
		$user = Auth::getUser();
		$content = $request->getQueryParams();
		$ret = json_decode($this->Verify($content['trxref']),true);
		$order = TempOrder::where("order_id", '=', $content['trxref'])->where('userid', $user->id)->first();
		if (isset($ret['status']) && $ret['status'] == true) {
		  if($order){
			(new Purchase())->update($content['trxref']);
			return $response->withStatus(302)->withHeader('Location', (new Checkout())->Url().'/portal/success?orderid='.$content['trxref']);
		  } else {
			    $orders = Order::where("order_id", '=', $content['trxref'])->where('userid', $user->id)->first();
				if($orders->state == 1 || $orders->state == "1"){
					return $response->withStatus(302)->withHeader('Location', (new Checkout())->Url().'/portal/success?orderid='.$content['trxref']);
				}else{
					return $response->withStatus(302)->withHeader('Location', (new Checkout())->Url().'/portal/orders');
				}
		  }
		} else {
		    return $response->withStatus(302)->withHeader('Location', (new Checkout())->Url().'/portal/orders');
		}
		$response->getBody()->write("");
		return $response;
	}
}	