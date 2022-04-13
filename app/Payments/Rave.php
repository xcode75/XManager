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


class Rave extends BaseController
{
	public function _curlPost($amount,$type,$order_id,$notify_url,$pname){
		$Config = new Config();
		$user = Auth::getUser();
		if($type == "card"){
			$currency = $Config->getConfig('rave_currency_code') ? $Config->getConfig('rave_currency_code') : "USD";
		}else{
			$currency = $Config->getConfig('rave_mobile_currency_code') ? $Config->getConfig('rave_mobile_currency_code') : "GHS";
		}
		$params = [
		    'amount' => $amount, 
			'currency' => $currency, 
			'payment_options'  => $type, 
			'redirect_url' => $notify_url, 
			'tx_ref' => $order_id, 
			'customer' => [
				"email" => $user->email,
				"fullname" => $user->user_name,
			],
			'customizations' => [
				'title' => $Config->getConfig('appName'),
				'description' => $Config->getConfig('appName').' - '.$pname,
				'logo' => $Config->getConfig('baseUrl').$Config->getConfig('logo_path')
			]
		];
		
		$curl = curl_init();
		curl_setopt_array($curl, array(
			CURLOPT_URL => "https://api.flutterwave.com/v3/payments",
			CURLOPT_RETURNTRANSFER => true,
			CURLOPT_ENCODING => "",
			CURLOPT_MAXREDIRS => 10,
			CURLOPT_TIMEOUT => 0,
			CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
			CURLOPT_CUSTOMREQUEST => "POST",
			CURLOPT_POSTFIELDS => json_encode($params),
			CURLOPT_HTTPHEADER => array(
			  "Authorization: Bearer ".$Config->getConfig('rave_secret'),
			  "Cache-Control: no-cache",
			  "Content-Type: application/json",
			),
		));
	  
		$response = curl_exec($curl);
		curl_close($curl);
		return $response;
	}
	
    public function rave($request, $response, $args)
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
		

		if($type == "card"){
			$currency = $Config->getConfig('rave_currency_code') ? $Config->getConfig('rave_currency_code') : "USD";
		}else{
			$currency = $Config->getConfig('rave_mobile_currency_code') ? $Config->getConfig('rave_mobile_currency_code') : "GHS";
		}
		
		$rate = $Currency->getRate($currency);
		
		$item->status 		= 0;
		$item->create_date 	= time();
		$item->expdate 		= (time() + 600);
		$item->exrate		= bcmul($price,$rate, 2);
        $item->notify_url 	= (new Checkout())->Callback()."/notify/rave";
        $item->type		    = 18;
		$item->save();
		
		$ret = json_decode($this->_curlPost($rave->exrate, $content['type'], $rave->order_id, $rave->notify_url, $package->name),true);
		
		if (isset($ret['status']) && $ret['status'] == "success") {
			$item = TempOrder::where("id", '=', $item->id)->where('status', 0)->first();
			$item->pay_url 	= $ret['data']['link'];
			$item->save();	
				
			$res['ret'] 	= 1;
			$res['url'] 	= $ret['data']['link'];			
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
			CURLOPT_URL => "https://api.flutterwave.com/v3/transactions/".$order_id."/verify",
			CURLOPT_RETURNTRANSFER => true,
			CURLOPT_ENCODING => "",
			CURLOPT_MAXREDIRS => 10,
			CURLOPT_TIMEOUT => 0,
			CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
			CURLOPT_CUSTOMREQUEST => "GET",
			CURLOPT_HTTPHEADER => array(
			  "Authorization: Bearer ".$Config->getConfig('rave_secret'),
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
		$content = $request->getQueryParams();
		$ret = json_decode($this->Verify($content['transaction_id']),true);
		$order = TempOrder::where("order_id", '=', $content['tx_ref'])->first();
		if (isset($ret['status']) && $ret['status'] == "success") {
		  if($order){
			(new Purchase())->update($content['tx_ref']);
			return $response->withStatus(302)->withHeader('Location', (new Checkout())->Url().'/portal/success?orderid='.$content['tx_ref']);
		  } else {
			    $orders = Order::where("order_id", '=', $content['tx_ref'])->first();
				if($orders->state == 1 || $orders->state == "1"){
					return $response->withStatus(302)->withHeader('Location', (new Checkout())->Url().'/portal/success?orderid='.$content['tx_ref']);
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