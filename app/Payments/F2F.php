<?php

namespace App\Payments;

use Exception;
use Omnipay\Omnipay;
use App\Helpers\i18n;
use App\Helpers\Helpers;
use App\Handlers\Config;
use App\Http\Models\User;
use App\Http\Models\Order;
use App\Http\Models\Coupon;
use App\Http\Models\Package;
use App\Http\Models\TempOrder;
use App\Http\Models\Currency;
use App\Handlers\AuthHandler\Auth;
use App\Http\Controllers\BaseController;
use App\Helpers\QrcodeGen;

class F2F extends BaseController
{
	
    private function createGateway()
    {
		$Config = new Config();
        $gateway = Omnipay::create('Alipay_AopF2F');
        $gateway->setSignType('RSA2'); //RSA/RSA2
        $gateway->setAppId($Config->getConfig('f2fpay_app_id'));
        $gateway->setPrivateKey($Config->getConfig('f2fpay_private_key')); 
        $gateway->setAlipayPublicKey($Config->getConfig('f2fpay_public_key')); 
        $gateway->setNotifyUrl((new Checkout())->Callback(). '/notify/f2fpay');
        return $gateway;
    }	
	
    public function f2f($request, $response, $args)
    {
		ini_set('memory_limit', '-1');
		$user = Auth::getUser();
		if (!$user->isLogin) {
            return $response->withStatus(302)->withHeader('Location', '/login');
        }
		
		$Config = new Config();
		$lang = new i18n();	
		$Currency = new Currency();
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
    
		$rate = $Currency->getRate($Config->getConfig('f2fpay_currency_code'));
		
		$item->status 		= 0;
		$item->create_date 	= time();	
		$item->expdate 		= time() + 7200;
		$item->exrate		= bcmul($price,$rate, 2);
		$item->notify_url 	= (new Checkout())->Callback()."/notify/f2fpay";
        $item->type		    = 5;
		$item->save();

		try {
			$process = $this->createGateway();
			$request = $process->purchase();
			$request->setBizContent([
				'subject' => $item->order_id,
				'out_trade_no' => $item->order_id,
				'total_amount' => $item->exrate
			]);
			$aliResponse = $request->send();
			$qrcode     = $aliResponse->getQrCode();
			
			if($qrcode == null){
				$res['ret'] 	= 0;
				$res['msg'] 	= $lang->get("");
				$response->getBody()->write(json_encode($res));
				return $response;
			}
			
			$itemm       = TempOrder::where("id", '=', $item->id)->where('status', 0)->first();
			$itemm->pay_url 	    = $qrcode;
			$itemm->pay_qrcode 	= (new QrcodeGen)->Generate2($itemm->pay_url, LOGO_PATH.($Config->getConfig('template') ? $Config->getConfig('template') : "default")."/img/pay/1.png");
			$itemm->deeplink 	= "alipays://platformapi/startapp?saId=10000007&clientVersion=3.7.0.0718&qrcode=".$itemm->pay_url;
			$itemm->save();	
			
			$res['ret'] 	= 1;				
			$res['url'] 	= (new Checkout())->Url().'/portal/pay?orderid='.$itemm->order_id;
			$response->getBody()->write(json_encode($res));
			return $response;
		} catch (Exception $e) { 
			$res['ret'] 	= 0;
			$res['msg'] 	= $e->getMessage();
			$response->getBody()->write(json_encode($res));
			return $response;
			die('fail');
		}	  
    }
		
	public function query($orderid)
    {
		ini_set('memory_limit', '-1');
		$Config = new Config();
        $gateway = $this->createGateway();
        $request = $gateway->completePurchase();
        $request->setParams($_POST);
		try {
			$aliResponse = $gateway->query(
				[
					'biz_content' => [
						'out_trade_no' => $orderid
					]
				]
			)->send();
			$result = $aliResponse->getTradeStatus();
			if ($result == 'TRADE_SUCCESS' || $result == 'TRADE_FINISHED'){
				$order = TempOrder::where("order_id", $orderid)->first();
				if($order){
					(new Purchase())->update($orderid);
				}
			}
		}catch (Exception $e) {
            echo $e->getMessage();
        }
	}

	public function callback($request, $response, $args)
    {
		ini_set('memory_limit', '-1');
		$user = Auth::getUser();
		$Config = new Config();
        $gateway = $this->createGateway();
        $request = $gateway->completePurchase();
        $request->setParams($_POST);
		
		try {
			$aliResponse = $request->send();
			if ($aliResponse->isPaid() && $aliResponse->data('out_trade_no')) {	
				$order = TempOrder::where("order_id",  $aliResponse->data('out_trade_no'))->where('userid', $user->id)->first();
				if($order){
					(new Purchase())->update($aliResponse->data('out_trade_no'));
					return $response->withStatus(302)->withHeader('Location', (new Checkout())->Url().'/portal/success?orderid='.$aliResponse->data('out_trade_no'));
				}else{
					$orders = Order::where("order_id", '=', $aliResponse->data('out_trade_no'))->first();
					if($orders->state == 1 || $orders->state == "1"){
						return $response->withStatus(302)->withHeader('Location', (new Checkout())->Url().'/portal/success?orderid='.$aliResponse->data('out_trade_no'));
					}else{
						return $response->withStatus(302)->withHeader('Location', (new Checkout())->Url().'/portal/orders');
					}
				}
			}
		}catch (Exception $e) {
            $response->getBody()->write($e->getMessage());
			return $response;
        }	
		$response->getBody()->write("");
		return $response;
	}
	
    public function checkorder($request, $response, $args)
    {
		$content = $request->getParsedBody();
		$Config = new Config();
		$user = Auth::getUser();
        $res = Order::where("order_id", $content['order_id'])->where('userid', $user->id)->first();
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
	
	public function f2fquery($request, $response, $args)
    {
		ini_set('memory_limit', '-1');
		$Config = new Config();
		$lang = new i18n();	
		$content = $request->getParsedBody();
        $gateway = $this->createGateway();
        $re = $gateway->completePurchase();
        $re->setParams($_POST);
		try {
			$aliResponse = $gateway->query(
				[
					'biz_content' => [
						'out_trade_no' => $content['order_id']
					]
				]
			)->send();
			$result = $aliResponse->getTradeStatus();
			if ($result == 'TRADE_SUCCESS' || $result == 'TRADE_FINISHED'){
				$order = Order::where("order_id", '=', $content['order_id'])->first();
				if($order){
					(new Purchase())->updateQuery($content['order_id']);
				}
				$rs['result']   = 1;
				$rs['msg']   = $lang->get('query_paid');
				$response->getBody()->write(json_encode($rs));
				return $response;
			}
			$rs['result']   = 0;
			$rs['msg']   = $lang->get('query_not');
			$response->getBody()->write(json_encode($rs));
		    return $response;
		}catch (Exception $e) {
            $rs['result']   = 0;
			$rs['msg']   = $lang->get('query_not').": ".$e->getMessage();
			$response->getBody()->write(json_encode($rs));
		    return $response;
        }
	}	
}	