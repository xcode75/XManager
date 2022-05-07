<?php

namespace App\Payments;

use App\Http\Models\Order;
use App\Http\Models\TmpOrder;
use App\Http\Models\User;
use App\Http\Models\Package;
use App\Http\Models\Coupon;
use App\Handlers\Config;
use App\Helpers\Helpers;
use App\Helpers\i18n;
use App\Http\Controllers\BaseController;
use App\Http\Models\Currency;
use App\Handlers\AuthHandler\Auth;
use App\Template as View;
use App\Http\Models\TempOrder;
use App\Helpers\QrcodeGen;


class VPay extends BaseController
{
    public function vpay($request, $response, $args)
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
    
		$rate = $Currency->getRate($Config->getConfig('vpay_currency_code'));
		
		if ($Config->getConfig('jkstate') != "1"){
			$res['ret'] 		= 0;
			$res['msg'] 		= $lang->get('montor-offline');
			$response->getBody()->write(json_encode($res));
            return $response;			
        }		
		
		$vtype = $content['type'];
				
		if($vtype == 1){
			$type = 10;
		}else{
			$type = 1;
		}
		
		if ($type == 1) {
			$payUrl = $Config->getConfig('wechat_url');
		} else if ($type == 10) {
			$payUrl = $Config->getConfig('alipay_url');
		}

        if ($payUrl == "") {
			$res['ret'] 		= 0;
			$res['msg'] 		= $lang->get('no-qrcode');
			$response->getBody()->write(json_encode($res));
			return $response;			
        }
		
		$pay_total =  bcmul($price,$rate, 2);
		
		
		$addran = rand(0.01, 0.10);
        $reallyPrice = bcmul($pay_total ,100);
		$orderId = $item->order_id;		
        $ok = false;
        for ($i = 0; $i < 5; $i++) {
            $tmpPrice = $reallyPrice . "-" . $type;
			$rows = TmpOrder::where("price",$tmpPrice)->orwhere("oid","=",$orderId)->first();
			if ($rows){
				TmpOrder::where("uid",$user->id)->where("price",$tmpPrice)->orwhere("oid","=",$orderId)->delete();
				$pay_total = bcadd($pay_total,$addran,2);
				$reallyPrice = bcmul($pay_total ,100);
				$tmpPrice = $reallyPrice . "-" . $type;	
				$rows = TmpOrder::where("price",$tmpPrice)->orwhere("oid","=",$orderId)->first();
				if ($rows) {
					$res['ret'] 		= 0;
					$res['msg'] 		= $lang->get('system-busy');
					$response->getBody()->write(json_encode($res));
					return $response;	
				}
			}	

			$row = new TmpOrder;
			$row->price = $tmpPrice;
			$row->oid 	= $orderId;
			$row->uid 	= $user->id;
            if ($row->save()) {
                $ok = true;
                break;
            }
        }
        if (!$ok) {
			$res['ret'] 		= 0;
			$res['msg'] 		= $lang->get('system-busy');
			$response->getBody()->write(json_encode($res));
			return $response;	
        }
		
        $reallyPrice = bcdiv($reallyPrice, 100,2);	
		
		$item->status 		= 0;
		$item->pay_url 	    = $payUrl;
		$item->create_date 	= time();	
		$item->expdate 		= time() + ($Config->getConfig('vpay_order_exp') * 60);
		$item->exrate		= $reallyPrice;	
		$item->pay_qrcode 	= (new QrcodeGen())->Generate2($payUrl, LOGO_PATH.($Config->getConfig('template') ? $Config->getConfig('template') : "default")."/img/pay/".($type == 10 ? 1:2).'.png');
		$item->deeplink 	= ($type == 10 ? "alipays://platformapi/startapp?saId=10000007&clientVersion=3.7.0.0718&qrcode=".$payUrl : "");
		$item->extra		= $addran;
		$item->type		    = $type;
		$item->save();
		
		$res['ret'] 		= 1;	
		$res['url'] 	    = (new Checkout())->Url().'/portal/pay?orderid='.$item->order_id;
		$response->getBody()->write(json_encode($res));	
		return $response;		
    }

    public function checkorder($request, $response, $args)
    {
		$Config = new Config();
		$content = $request->getParsedBody();
        $res = Order::where("order_id", $content['order_id'])->first();
        if (!$res){
			$rs['result']   = 0;
			$rs['status']   = 0;
			$response->getBody()->write(json_encode($rs));
		    return $response;						
        }else{
			$rs['result']   = 1;
			$rs['status']   = $res->state;
			$rs['url']      = (new Checkout())->Url().'/portal/success?orderid='.$res->order_id;
			$response->getBody()->write(json_encode($rs));
		    return $response;	
		}
    }	

    public function appHeart($request, $response, $args)
	{	
		$Config = new Config();
		$lang = new i18n();
        $key = $Config->getConfig('api_key');
		$content = $request->getQueryParams();
        $t = $content['t'];
        $_sign = $t.$key;		
        if (md5($_sign) != $content['sign']){
			$Config->setConfig('jkstate', 0);
            $response->getBody()->write($lang->get('wrong-signature'));	
			return $response;
        }else{
			$Config->setConfig('lastheart', time());
			$Config->setConfig('jkstate', 1);
			$response->getBody()->write($lang->get('appHeart'));
			return $response;
		}		
		$response->getBody()->write("");
		return $response;
    }

    public function appPush($request, $response, $args)
	{
		$Config = new Config();
		$lang = new i18n();
        $key 	= $Config->getConfig('api_key');
        $t 		= $_GET['t'];
        $type 	= $_GET['type'];
        $price 	= $_GET['price'];
        $_sign 	= $type.$price.$t.$key;

		if (md5($_sign) != $_GET['sign']){
			$response->getBody()->write($lang->get('wrong-signature'));	
			return $response;
        }
		
        $res = TempOrder::where("exrate",$price)->where("type", $type)->where("status", 0)->first();  
		if ($res){
			(new Purchase())->update($res->order_id);
			$oid = $res->order_id;
			$Config->setConfig('lastpay', time());
			TmpOrder::where("oid",$res->order_id)->delete();
			return $response->withStatus(302)->withHeader('Location', (new Checkout())->Url().'/portal/success?orderid='.$oid);
        }else{
			return $response->withStatus(302)->withHeader('Location', (new Checkout())->Url().'/portal/orders');
		}	
	}	
}