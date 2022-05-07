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

class Binancepay extends BaseController
{
	public function _curlPost($amount,$order_id,$notify_url,$cancel_url,$pname,$exptime){
		$Config = new Config();
		$body = [
			"env" => [
				"terminalType" => "WEB",
			],
		    "orderAmount" => $amount, 
			"currency" => "USDT", 
			"merchantTradeNo" => $order_id, 
			"goods" => [
				"goodsType" => "02",
				"goodsCategory"  => "Z000",
				"referenceGoodsId" => $order_id,
				"goodsName" => $Config->getConfig('appName').' - '.$pname,
			],
			"returnUrl" => $notify_url,
			"cancelUrl" => $cancel_url,
			"orderExpireTime" => $exptime,
		];
		$time = time()*1000;
		
		$payload = $time . "\n" . $Config->getConfig('binancepay_nonce') . "\n" . json_encode($body) . "\n";
		$signature =  strtoupper(hash_hmac("sha512", $payload, $Config->getConfig('binancepay_secretKey')));
		
		$curl = curl_init();
		curl_setopt_array($curl, array(
			CURLOPT_URL => "https://bpay.binanceapi.com/binancepay/openapi/v2/order",
			CURLOPT_RETURNTRANSFER => true,
			CURLOPT_ENCODING => "",
			CURLOPT_MAXREDIRS => 10,
			CURLOPT_TIMEOUT => 0,
			CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
			CURLOPT_CUSTOMREQUEST => "POST",
			CURLOPT_POSTFIELDS => json_encode($body),
			CURLOPT_HTTPHEADER => array(
			  "BinancePay-Timestamp: ".$time,
			  "BinancePay-Nonce: ".$Config->getConfig('binancepay_nonce'),
			  "BinancePay-Certificate-SN: ".$Config->getConfig('binancepay_apikey'),
			  "BinancePay-Signature: ".$signature,
			  "Cache-Control: no-cache",
			  "Content-Type: application/json",
			),
		));
	  
		$response = curl_exec($curl);
		curl_close($curl);
		return $response;
	}
	
    public function binancepay($request, $response, $args)
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
		
		$rate = $Currency->getRate($Config->getConfig('binancepay_currency_code'));
		
		$item->status 		= 0;
		$item->create_date 	= time();
		$item->expdate 		= (time() + ($Config->getConfig('binancepay_order_exp') *60));
		$item->exrate		= bcmul($price,$rate, 2);
        $item->notify_url 	= (new Checkout())->Callback()."/notify/binancepay";
        $item->type		    = 20;
		$item->save();
		
		$cancel_url = $item->notify_url."?merchantTradeNo=".$item->order_id;
		
		$ret = json_decode($this->_curlPost($item->exrate, $item->order_id, $item->notify_url, $cancel_url, $package->name,$item->expdate*1000),true);
		
		if (isset($ret['status']) && $ret['status'] == "SUCCESS") {
			$item = TempOrder::where("id", '=', $item->id)->where('status', 0)->first();
			$item->pay_url 	    = $ret['data']['checkoutUrl'];
			$item->pay_qrcode 	= (new QrcodeGen)->Generate2($ret['data']['qrContent'], LOGO_PATH.($Config->getConfig('template') ? $Config->getConfig('template') : "default")."/img/pay/3.png");
			$item->deeplink 	= $ret['data']['deeplink'];
			$item->save();	
				
			$res['ret'] 		= 1;
			$res['url'] 		= (new Checkout())->Url().'/portal/pay?orderid='.$item->order_id;
			$response->getBody()->write(json_encode($res));
			return $response;
		}else {
			$res['ret'] 	= 0;
			$res['msg'] 	= $ret['code']." - ".$ret['errorMessage'];
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
	
	public function verify($order_id)
	{
		$Config = new Config();
		$params = [
			"merchantTradeNo" => $order_id
		];
		$time = time()*1000;
		$payload  = $time. "\n" . $Config->getConfig('binancepay_nonce'). "\n" . json_encode($params). "\n";
		$signature =  strtoupper(hash_hmac("sha512", $payload, $Config->getConfig('binancepay_secretKey')));
		
		$curl = curl_init();
		curl_setopt_array($curl, array(
			CURLOPT_URL => "https://bpay.binanceapi.com/binancepay/openapi/v2/order/query",
			CURLOPT_RETURNTRANSFER => true,
			CURLOPT_ENCODING => "",
			CURLOPT_MAXREDIRS => 10,
			CURLOPT_TIMEOUT => 0,
			CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
			CURLOPT_CUSTOMREQUEST => "POST",
			CURLOPT_POSTFIELDS => json_encode($params),
			CURLOPT_HTTPHEADER => array(
			  "BinancePay-Timestamp: ".$time,
			  "BinancePay-Nonce: ".$Config->getConfig('binancepay_nonce'),
			  "BinancePay-Certificate-SN: ".$Config->getConfig('binancepay_apikey'),
			  "BinancePay-Signature: ".$signature,
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
	    ini_set('memory_limit', '-1');
		$Config = new Config();
		$content = $request->getParsedBody();
		if(isset($ret['bizStatus']) && $content["bizStatus"] == "PAY_SUCCESS"){
			$ret = json_decode($this->verify($content["data"]['merchantTradeNo']),true);
			if (isset($ret['status']) && $ret['status'] == "SUCCESS") {
			  $order = TempOrder::where("order_id", '=', $content["data"]['merchantTradeNo'])->first();
			  if($order->exrate == $content["data"]['totalFee']){
				(new Purchase())->update($content["data"]['merchantTradeNo']);
				return $response->withStatus(302)->withHeader('Location', (new Checkout())->Url().'/portal/success?orderid='.$content["data"]['merchantTradeNo']);
			  } else {
				$orders = Order::where("order_id", '=', $content["data"]['merchantTradeNo'])->first();
				if($orders->state == 1 || $orders->state == "1"){
					return $response->withStatus(302)->withHeader('Location', (new Checkout())->Url().'/portal/success?orderid='.$content["data"]['merchantTradeNo']);
				}else{
					return $response->withStatus(302)->withHeader('Location', (new Checkout())->Url().'/portal/orders');
				}
			  }
			}
		}else{
			$content = $request->getQueryParams();
			if(isset($content['merchantTradeNo'])){
				$order = TempOrder::where("order_id", '=', $content['merchantTradeNo'])->where('status', 0)->first();
				if($order){
					(new Purchase())->cancel($request, $response,  $order->order_id); 
					return $response->withStatus(302)->withHeader('Location', (new Checkout())->Url().'/portal/canceled?orderid='.$content['merchantTradeNo']);
			    }else{
					return $response->withStatus(302)->withHeader('Location', (new Checkout())->Url().'/portal/orders');
				}
			}
		}
		$response->getBody()->write("");
		return $response;
	}	
}	
