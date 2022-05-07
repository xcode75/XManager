<?php

namespace App\Payments;
 
use DateTime;
use App\Helpers\i18n;
use App\Helpers\Helpers;
use App\Handlers\Config;
use App\Http\Models\Order;
use App\Http\Models\User;
use App\Http\Models\Coupon;
use App\Http\Models\Package;
use App\Http\Models\TmpOrder;
use App\Http\Models\TempOrder;
use App\Handlers\AuthHandler\Auth;
use App\Http\Controllers\BaseController;
use App\Template as View;
use App\Services\TelegramServices\Telegram;


class Checkout extends BaseController
{
    public function create_order($request, $response, $args)
    {
		$user = Auth::getUser();
		$Config = new Config();
		$lang = new i18n();	
		$content = $request->getParsedBody();
		
		if (!$user->isLogin) {
            return $response->withStatus(302)->withHeader('Location', '/login');
        }
		
				
		$Pending = TempOrder::where("status", 0)->orwhere("status",-1)->where('userid',"=", $user->id)->count();
		
		if($Pending > 0){
			$pendings = TempOrder::where('userid', $user->id)->where("status", 0)->orwhere("status", -1)->get();
			foreach ($pendings as $p)
			{
				$res['ret'] = 2;
				$res['msg'] = $lang->get('pending_orders');
				$res['url'] = self::Url().'/portal/order?id='.$p['order_id'];
				$response->getBody()->write(json_encode($res));
				return $response;
			}
		}
		
        $package		= $content['package'];
        $coupon			= $content['coupon'];
		$amount			= $content['price'];
		$days			= $content['expire'];
		$renew			= $content['renew'];
		$paymethod		= $content['paymethod'];
        $coupon 		= trim($coupon);
        $code 			= $coupon;
		
		$package = Package::where('id', $package)->where('status', 1)->first();
		if ($package == "" || $package == null){
			$newResponse = $response->withStatus(302)->withHeader('Location', '/portal/packages');
			return $newResponse;
		}
		
		$now = new DateTime('today');
		$expire_in = new DateTime($user->expire_in);
		$interval = $now->diff($expire_in);
		$day_left =  $interval->format('%a');
		
		if($package->type == 2) 
		{
			$bought_count = Order::where("userid",$user->id)->where("state",1)->where("packagetype",2)->orderBy('id', 'desc')->take(1)->first();		
			if($bought_count != null){
				$pack = Package::where('id', $bought_count->packageid)->first();
				if($pack->reset_renew == 1){
					$dleft = round($day_left/$pack->reset_every_days,0);
					if(
						$dleft > 1
					){
						if (time() < ($bought_count->pay_date + $bought_count->packagexp * 86400) ) {
							$daystoReset =	(int)($pack->reset_every_days - (((time() - $bought_count->pay_date) / 86400) % $pack->reset_every_days));
							$res['ret'] = -4;
							if(Helpers::getCookie('lang')== "en"){
								$res['msg'] = $lang->get('not-exp1').$daystoReset.$lang->get('not-exp2');	
							}else{
								$res['msg'] = $lang->get('not-exp4').$daystoReset.$lang->get('not-exp5');
							}						
							$response->getBody()->write(json_encode($res));
							return $response;
						}
					}
				}				
			}
		}
		
		if($package->buy_count == 1){
			$orderc = Order::where('userid', $user->id)->where("state",1)->count();
			if($orderc >= 1){
				$res['ret'] = 0;
				$res['msg'] = $lang->get('not-allowed_purchase');						
				$response->getBody()->write(json_encode($res));
				return $response;
			}
		}
		
		$coupon = Coupon::where('code', $code)->where('status',1)->first();
        if ($code == '') {
            $credit = 0;
        } else {
            $coupon = Coupon::where('code',"=", $code)->where('status',1)->first();
            if (!$coupon) {
                $credit = 0;
            } else {
                $credit = $coupon->credit;
            }
			if (!$coupon) {
                $res['ret'] = 0;
                $res['msg'] = $lang->get('invalid-coupon');				
                $response->getBody()->write(json_encode($res));
				return $response;
				exit  ;
            }		
			$usage=$coupon->usage_no;
			if($usage > 0){
				$use_count=Order::where("coupon",$coupon->code)->where("state",1)->where("userid",$user->id)->count();
				if($use_count>=$usage){
					$res['ret'] = 0;
					$res['msg'] = $lang->get('used-coupon');
					$response->getBody()->write(json_encode($res));
				    return $response;
				}			
			}
			if($coupon->newuser == 1){
				$use_count=Order::where("userid",$user->id)->where("state",1)->count();
				if($use_count>0){
					$res['ret'] = 0;
					$res['msg'] = $lang->get('frst-time-buy');
					$response->getBody()->write(json_encode($res));
				    return $response;
				}			
			}			
            if ($coupon->order($package->id) == false) {
				$res['ret'] = 0;
				$res['msg'] = $lang->get('not-for-package');
				$response->getBody()->write(json_encode($res));
				return $response;
			}
            if ($coupon->expire < date('Y-m-d H:i:s',time())) {
                $res['ret'] = 0;
                $res['msg'] = $lang->get('coupon-expired');
                $response->getBody()->write(json_encode($res));
				return $response;
            }
        }
		$couponn = Coupon::where('code', $code)->where('status',1)->first();
		if($couponn){
			if($couponn->type == 1){	
				$price = $amount - $credit;
				$discount = $credit;
			}else if($couponn->type == 2){
				$price = $amount*((100 - $credit) / 100);
				$discount = bcsub($amount, $price, 2);
			}
		}else{
			$price = $amount;
			$discount = "0.00";
		}	
		
        $price = bcadd($price,0,2);

		if ($user->money < $price && $paymethod == 11) {
			$res['ret'] = 0;
			$res['msg'] = $lang->get('not-enough-bal');
			$response->getBody()->write(json_encode($res));
			return  $response;
        }
			
		if ($user->money < $price) {
			$amount_topay = (bcsub($price, $user->money, 2));
		}else{
			$amount_topay = $price;
		}
		
		switch ($paymethod) {
            case 1:
			case 2:
                $type = 1;
                 break;
			case 5:
                $type = 2;
                break;	
            case 11:
                $type = 11;
                break;
            case 6:
                $type = 4;
                break;
		    case 7:
                $type = 5;
                break;
			case 8:
                $type = 6;
                break;	
			case 3:
			case 4:
			case 16:
                $type = 7;
                break;
			case 10:
                $type = 8;
                break;
			case 9:
			case 12:
                $type = 9;
                break;	
			case 14:
                $type = 16;
                break;
			case 17:
			case 18:
			case 19:
			case 20:
                $type = 17;
                break;
			case 21:
			case 22:
                $type = 18;
                break;
			case 23:
			case 24:
                $type = 19;
                break;	
			case 25:
                $type = 20;
                break;	
			case 26:
                $type = 21;
                break;	
        }
		
		$temporder = new TempOrder();
		$temporder->price 			= $amount;
		$temporder->total 			= $amount_topay;
		$temporder->order_id 		= strtoupper(Helpers::genRandomChar(16));
        $temporder->create_date	    = time();
		$temporder->coupon			= $code;
		$temporder->packageid 		= $package->id;
		$temporder->packagetype	    = $package->type;
		$temporder->packagexp		= $package->type == 2 ? $days : 0;
		$temporder->userid			= $user->id;
        $temporder->paymethod 		= $paymethod;
		$temporder->renew			= $renew;
		$temporder->discount        = $discount ? $discount : "0.00";
		$temporder->exrate	        = $amount_topay;
		$temporder->type			= $type;

		if ($temporder->save()) {
			$res['ret'] 		= 1;
			$res['url'] 		= self::Url().'/portal/order?id='.$temporder->order_id;
			$response->getBody()->write(json_encode($res));
			return $response;
		}else {
			$res['ret'] 	= 0;
			$res['msg'] 	= $lang->get('order-create-error');
			$response->getBody()->write(json_encode($res));
			return $response;
        }
    }
	
	public function check_order($request, $response, $args)
    {
		$user = Auth::getUser();
		if (!$user->isLogin) {
            return $response->withStatus(302)->withHeader('Location', '/login');
        }

		$params = $request->getQueryParams();
		$orderid = $params['id'];
		
		$order = TempOrder::where("order_id", $orderid)->where("status", 0)->orwhere("status", -1)->where('userid',"=", $user->id)->first();
		if ($order == null || $order == ""){
			$newResponse = $response->withStatus(302)->withHeader('Location', '/portal/packages');
			return $newResponse;
		}
		
		$package = Package::find($order->packageid);
		if ($package == null || $package == "" || $package->status == 0){
			$newResponse = $response->withStatus(302)->withHeader('Location', '/portal/packages');
			return $newResponse;
		}
		
		$response->getBody()->write($this->view()
			->assign('user', $user)
			->assign('order', $order)
			->assign('package', $package)
			->assign('orderid', $orderid)
			->fetch('user/pending.tpl'));
		return $response;	
	}

	public function cancel_order($request, $response, $args)
    {
		$Config = new Config();
		$user = Auth::getUser();
		$lang = new i18n();	
		$params = $request->getParsedBody();
		$orderid = $params['id'];
		
		$order = TempOrder::where("order_id", $orderid)->where("status",0)->orwhere("status",-1)->where('userid',"=", $user->id)->first();
		
		if ($order){ 
			$order->status = "-2";
			$order->save();
			
			if($order->paymethod == 1 || $order->paymethod == 2){
				TmpOrder::where("oid", $order->order_id)->delete();	
			}
			
			$package = Package::find($order->packageid);
			
			$purchase = new Order();
			$purchase->close_date		= time();
			$purchase->create_date	    = $order->create_date;
			$purchase->state			= -2;
			$purchase->coupon			= $order->coupon;
			$purchase->packageid 		= $order->packageid;
			$purchase->userid			= $user->id;
			$purchase->email			= $user->email;
			$purchase->username		    = $user->user_name;
			$purchase->total			= $order->price;
			$purchase->really_price		= $order->total;
			$purchase->type 			= $order->type;
			$purchase->pay_url 			= $order->pay_url;
			$purchase->renew			= $order->renew;
			$purchase->packagetype		= $order->packagetype;
			$purchase->packagexp		= $order->packagexp;
			$purchase->order_id			= $order->order_id;
			$purchase->exrate	        = $order->exrate;
			$purchase->discount	        = $order->discount;
			$purchase->save();
			
			$order->delete();
			
			if (
				$Config->getConfig('telegram_chatid')!= ""  
				&&  $Config->getConfig('telegram_token') != ""  
				&&  $Config->getConfig('enable_telegram') == 1
			){
				$messageText = $lang->getLang('Transac') . PHP_EOL .
				$lang->getLang('UserN')	.	  '： #' . $user->id .' '.$user->user_name .  PHP_EOL .
				$lang->getLang("email")	.	  '：'. $user->email . PHP_EOL .
				$lang->getLang("TransacType"). '：' . $package->name . PHP_EOL .
				$lang->getLang("OrderAmt") .  '：' .$Config->getConfig('default_currency_symbol') . ' ' . $purchase->really_price . PHP_EOL .
				$lang->getLang("order-number") .  '：#'. $purchase->order_id . PHP_EOL .
				$lang->getLang("CreateTime") .'：'. date('Y-m-d H:i:s', $purchase->create_date) . PHP_EOL .
				$lang->getLang('Status').' '.$lang->getLang('orderc');	
				(new Telegram())->SendNotify($messageText, $Config->getConfig('telegram_chatid'));
			}
			
			$res['ret'] = 1;
			$res['msg'] = $lang->get('order_cancel');
			$res['url'] = self::Url().'/portal/canceled?orderid='.$purchase->order_id;
			$response->getBody()->write(json_encode($res));
			return $response;
		}else{
			$res['ret'] = 1;
			$res['msg'] = "not found";
			$response->getBody()->write(json_encode($res));
			return $response;
		}
	}

	public function view_order($request, $response, $args)
    {
		$user = Auth::getUser();
		if (!$user->isLogin) {
            return $response->withStatus(302)->withHeader('Location', '/login');
        }

		$params = $request->getQueryParams();
		$orderid = $params['orderid'];
		
		$order = Order::where("userid",$user->id)->where("order_id", $orderid)->first();
		if (!$order|| $order->state != -2){
			$newResponse = $response->withStatus(302)->withHeader('Location', '/portal/orders');
			return $newResponse;
		}
		
		$package = Package::find($order->packageid);
		if (!$package || $package->status == 0){
			$newResponse = $response->withStatus(302)->withHeader('Location', '/portal/packages');
			return $newResponse;
		}
		
		$response->getBody()->write($this->view()
			->assign('order', $order)
			->assign('package', $package)
			->assign('orderid', $orderid)
			->fetch('user/view.tpl'));
		return $response;	
	}

	public function expire_order($request, $response, $args)
    {
		$user = Auth::getUser();
		if (!$user->isLogin) {
            return $response->withStatus(302)->withHeader('Location', '/login');
        }

		$params = $request->getQueryParams();
		$orderid = $params['orderid'];
		
		$order = Order::where("userid",$user->id)->where("order_id", $orderid)->first();
		if (!$order|| $order->state != -3){
			$newResponse = $response->withStatus(302)->withHeader('Location', '/portal/orders');
			return $newResponse;
		}
		
		$package = Package::find($order->packageid);
		if (!$package || $package->status == 0){
			$newResponse = $response->withStatus(302)->withHeader('Location', '/portal/packages');
			return $newResponse;
		}
		
		$response->getBody()->write($this->view()
			->assign('order', $order)
			->assign('package', $package)
			->assign('orderid', $orderid)
			->fetch('user/expire.tpl'));
		return $response;	
	}
	
	public function success_order($request, $response, $args)
    {
		$user = Auth::getUser();
		if (!$user->isLogin) {
            return $response->withStatus(302)->withHeader('Location', '/login');
        }

		$params = $request->getQueryParams();
		$orderid = $params['orderid'];
		
		$order = Order::where("userid",$user->id)->where("order_id", $orderid)->first();
		if (!$order || $order->state != 1){
			$newResponse = $response->withStatus(302)->withHeader('Location', '/portal/orders');
			return $newResponse;
		}
		
		$package = Package::find($order->packageid);
		if (!$package || $package->status == 0){
			$newResponse = $response->withStatus(302)->withHeader('Location', '/portal/packages');
			return $newResponse;
		}
		
		$response->getBody()->write($this->view()
			->assign('order', $order)
			->assign('package', $package)
			->assign('orderid', $orderid)
			->fetch('user/success.tpl'));
		return $response;	
	}
	
	public function pay($request, $response, $args)
	{
		$user = Auth::getUser();
		$params = $request->getQueryParams();
		$orderid = $params['orderid'];
		$order = TempOrder::where('userid', $user->id)->where("order_id", $orderid)->where("status",0)->first();
		if (!$order){
			$newResponse = $response->withStatus(302)->withHeader('Location', '/portal/packages');
			return $newResponse;
		}
		
		$package = Package::find($order->packageid);
		
		$response->getBody()->write($this->view()
			->assign('order', $order)
			->assign('package', $package)
	        ->fetch('include/paymethod/pay.tpl'));
		return $response;
	}
    public function setExpire($request, $response, $args)
	{
		$Config = new Config();
		$user = Auth::getUser();
		$content = $request->getParsedBody();
		$lang = new i18n();	
		$orderId = $content['order_id'];
		
		$order = TempOrder::where('userid',"=", $user->id)->where("order_id", $orderId)->where("status", 0)->first();
        if ($order){
            TempOrder::where("order_id",$orderId)->update(array("status" => -3));
            
			if($order->paymethod == 1 || $order->paymethod == 2){
				TmpOrder::where("oid", $order->order_id)->delete();	
			}
			
			$package = Package::find($order->packageid);
			
			$purchase = new Order();
			$purchase->close_date		= time();
			$purchase->create_date	    = $order->create_date;
			$purchase->state			= -3;
			$purchase->coupon			= $order->coupon;
			$purchase->packageid 		= $order->packageid;
			$purchase->userid			= $user->id;
			$purchase->email			= $user->email;
			$purchase->username		    = $user->user_name;
			$purchase->total			= $order->total;
			$purchase->really_price		= $order->price;
			$purchase->type 			= $order->type;
			$purchase->pay_url 			= $order->pay_url;
			$purchase->renew			= $order->renew;
			$purchase->exrate		    = $order->exrate;
			$purchase->packagetype		= $order->packagetype;
			$purchase->packagexp		= $order->packagexp;
			$purchase->order_id			= $order->order_id;
			$purchase->save();
			
			$order->delete();
			
			if (
				$Config->getConfig('telegram_chatid')!= ""  
				&&  $Config->getConfig('telegram_token') != ""  
				&&  $Config->getConfig('enable_telegram') == 1
			){
				$messageText = $lang->getLang('Transac') . PHP_EOL .
				$lang->getLang('UserN')	.	  '： #' . $user->id .' '.$user->user_name .  PHP_EOL .
				$lang->getLang('email')	.	  '：'. $user->email . PHP_EOL .
				$lang->getLang('order-number') .  '：#'. $purchase->order_id . PHP_EOL .
				$lang->getLang("TransacType"). '：' . $package->name . PHP_EOL .
				$lang->getLang("OrderAmt") .  '：' .$Config->getConfig('default_currency_symbol') . ' ' . $purchase->really_price . PHP_EOL .
				$lang->getLang('CreateTime') .'：'. date('Y-m-d H:i:s', $purchase->create_date) . PHP_EOL .
				$lang->getLang('Status').' '.$lang->getLang('TimedOut');	
				(new Telegram())->SendNotify($messageText, $Config->getConfig('telegram_chatid'));
			}
			
			$rs['url'] = self::Url().'/portal/expired?orderid='.$purchase->order_id;
			$rs['ret'] = 1;
			$response->getBody()->write(json_encode($rs));	
			return $response;			        
        }else{
			$rs['ret'] = 0;
			$response->getBody()->write(json_encode($rs));	
			return $response;
		}
    }	
	
	public function Url(){
		$Config = new Config();
		$protocol = ($_SERVER['HTTPS'] == 'on') ? "https://" : "http://";
		$url = ($Config->getConfig('baseUrl') != "" ? $Config->getConfig('baseUrl') : $protocol.$_SERVER['HTTP_HOST']);
		return $url;
	}
	
	public function Callback(){
		$Config = new Config();
		$protocol = ($_SERVER['HTTPS'] == 'on') ? "https://" : "http://";
		$address = ($Config->getConfig('baseUrl') != "" ? $Config->getConfig('baseUrl') : $protocol.$_SERVER['HTTP_HOST']);	
        //$address = $protocol.$_SERVER['HTTP_HOST'];		
		$url = ($Config->getConfig('callback_addr') != "" ? $Config->getConfig('callback_addr') : $address);
		return $url;
	}
}	
