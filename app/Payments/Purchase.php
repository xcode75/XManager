<?php

namespace App\Payments;

use App\Helpers\i18n;
use App\Handlers\Config;
use App\Http\Models\Order;
use App\Http\Models\User;
use App\Http\Models\Package;
use App\Http\Models\TempOrder;
use App\Http\Models\TmpOrder;
use App\Http\Models\Coupon;
use App\Http\Models\Commission;
use App\Services\TelegramServices\Telegram;
use App\Services\MailServices\Mail;
use App\Handlers\AuthHandler\Auth;
use Exception;


class Purchase 
{
	public function update($orderid)
	{	
			$trade = TempOrder::where("order_id", $orderid)->first();
			$user = User::find($trade->userid);	
			$lang = new i18n();
			$Config = new Config();
			
			$Content = (new \App\Http\Controllers\Admin\TemplatesController())->getContent(3);
			
			$package = Package::where("id", $trade->packageid)->where("status", 1)->first();
			
			if ($package->type == 1) {
				$user->transfer_enable += $package->bandwidth * 1024 * 1024 * 1024;
				$user->save();
			}
			
			if ($package->type == 2) {
				$user->level = $package->level;
				$user->group = $package->group;
				$user->speedlimit = $package->speedlimit;
				$user->connector = $package->connector;
				
				if ($trade->renew == 0) {
					$user->expire_in = date('Y-m-d H:i:s', time() + $trade->packagexp * 86400);
					$user->transfer_enable = $package->bandwidth * 1024 * 1024 * 1024;
					$user->u = 0;
					$user->d = 0;
					$user->last_day_t = 0;
				} else {
					if($package->renew_traffic_type == 1){
						$user->transfer_enable = $package->bandwidth * 1024 * 1024 * 1024;
					}else{
						$user->transfer_enable += $package->bandwidth * 1024 * 1024 * 1024;
					}
					if ($package->renew_type == 1) {
						$user->expire_in =   date('Y-m-d H:i:s', time() + $trade->packagexp * 86400);
					}else{
						$user->expire_in = date('Y-m-d H:i:s', strtotime($user->expire_in) +  ($trade->packagexp * 86400));
					}
				}

				$user->save();
			}
			
			if($trade->coupon != null || $trade->coupon != ''){
				$coupon = Coupon::where('code', $trade->coupon)->where('status',1)->first();
				if($coupon){
					if($coupon->type == 1){	
						$trade->discount = 	$coupon->credit;
					}else{
						$price = $trade->total * ((100 - $coupon->credit) / 100);
						$discount = bcsub($trade->total,$price,2);
						$trade->discount = 	$discount;
					}
				}
			}
			
			if ($package->type == 2) {
				if ($trade->renew == 0 || $package->renew_type == 1)  {
					$trade->exp  = strtotime($user->expire_in);	
				}else{
					$trade->exp  = time() + $trade->packagexp * 86400;
				}
			}
			
			$trade->status = 1;
			$trade->save();
			
			if($trade->type != 11){
				if($trade->extra != "" || $trade->extra != null ){	
					if($user->money <= $trade->total){
						$user->money = $trade->extra;
						$user->save();
					}else{
						$user->money += $trade->extra;
						$user->save();	
					}
				}elseif($user->money <= $trade->total){
					$user->money = 0;
					$user->save();
				}
			}

			$close_date = time();
			

			if ($package->type == 1) {
				$pktype = $lang->get("topup");
			}else if($package->type == 2){
				$pktype = $lang->get("package");
			}			
			
			if ($Config->GetConfig('enable_rebate') == 1){
				if (
					($Config->getConfig('comm_pay_once') == 1 && Commission::where('ref_by', $user->ref_by)->where('userid', $user->id)->count() < 1)
					|| $Config->getConfig('comm_pay_once') == 0
				){
					if ($user->ref_by > 0 && $package->type == 2 && $user->ref_by != $user->id ) {
						
						$gift_user = User::where('id', '=', $user->ref_by)->first();
						$gift_user->aff_balance += ($trade->total * ($Config->getConfig('rebate') / 100));
						$gift_user->save();
						
						$Payback = new Commission();
						$Payback->total = $trade->total;
						$Payback->packageid = $trade->packageid;
						$Payback->userid = $user->id;
						$Payback->ref_by = $user->ref_by;
						$Payback->ref_get = ($trade->total * ($Config->getConfig('rebate') / 100));
						$Payback->datetime = time();
						$Payback->save();
					}
				}
			}
			
			$purchase = new Order();
			$purchase->close_date		= $close_date;
			$purchase->create_date	    = $trade->create_date;
			$purchase->state			= $trade->status;
			$purchase->coupon			= $trade->coupon;
			$purchase->packageid 		= $trade->packageid;
			$purchase->exp			    = $trade->exp;
			$purchase->userid			= $user->id;
			$purchase->email			= $user->email;
			$purchase->username		    = $user->user_name;
			$purchase->total			= $trade->price;
			$purchase->really_price		= $trade->total;
			$purchase->renew			= $trade->renew;
			$purchase->packagetype		= $trade->packagetype;
			$purchase->packagexp		= $trade->packagexp;
			$purchase->order_id			= $trade->order_id;
			$purchase->exrate	        = $trade->exrate;
			$purchase->type	            = $trade->type;
			$purchase->pay_url 			= $trade->pay_url;
			$purchase->discount	        = $trade->discount;
			$purchase->pay_date	        = time();
			$purchase->save();
				
			if (
				$Config->getConfig('telegram_chatid')!= ""  
				&&  $Config->getConfig('telegram_token') != ""  
				&&  $Config->getConfig('enable_telegram') == 1
			){
				$messageText = $lang->getLang("Transac") . PHP_EOL .
				'------------------------------' . PHP_EOL .
				$lang->getLang("UserN")	.	  '： #' . $user->id .' '.$user->user_name .  PHP_EOL .
				$lang->getLang("email")	.	  '：'. $user->email . PHP_EOL .
				$lang->getLang("order-number") .  '：#'. $trade->order_id . PHP_EOL .
				$lang->getLang("TransacType"). '：【'.$pktype.'】 ' . $package->name . ' ' . $package->bandwidth.'GB ' . PHP_EOL .
				$lang->getLang("OrderAmt") .  '：' .$Config->getConfig('default_currency_symbol') . ' ' . $trade->total . PHP_EOL .
				$lang->getLang("PayMeth") .   '：' . (new Order())->paytype($trade->type). PHP_EOL .
				$lang->getLang("WallBal") .   '：' .$Config->getConfig('default_currency_symbol') . ' ' . $user->money . PHP_EOL .
				$lang->getLang("CreateTime") . '：' . date('Y-m-d H:i:s', $trade->create_date) . PHP_EOL .
				$lang->getLang("PayTime") .   '：' . date('Y-m-d H:i:s', $close_date);
				(new Telegram())->SendNotify($messageText, $Config->getConfig('telegram_chatid'));		
			}
			
			if ($Config->getConfig('mailDriver') != 0 && 
				$Config->getConfig('enable_notification')== 1 && 
				$Config->getConfig('send_order_email')== 1 &&
				$user->notification == 1 
			){
				$subject = $Config->getConfig('appName') . '-'. $lang->get('Invoice');
				
				try {
					Mail::send(
						$user->email, 
						$subject, 
						str_replace(
							[
								'%app_color%',
								'/%baseUrl%',
								'%appName%',
								'%UserName%',
								'%Lang_order1%',
								'%orderID%',
								'%Lang_order2%',
								'%Lang_order5%',
								'%Lang_Description%',
								'%Lang_OrderAmount%',
								'%Lang_AcBalance%',
								'%Lang_discount%',
								'%itemDes%',
								'%itemPrice%',
								'%usermoney%',
								'%disPrice%',
								'%orderDate%',
								'%Lang_TotalPrice%',
								'%TotalPrice%',
							],
							[
								$Config->getConfig('app_color'),
								$Config->getConfig('baseUrl'), 
								strtoupper($Config->getConfig('appName')),
								$user->user_name,
								$lang->get('order1'),
								$trade->order_id,
								$lang->getLang('order2'), 
								$lang->getLang('order5'), 
								$lang->getLang('Description'),
								$lang->getLang('OrderAmount'),
								$lang->getLang('AcBalance'),
								$lang->getLang('discount'),
								$Config->getConfig('appName') . ' - '. $package->bandwidth.' GB '. $package->name,
								$Config->getConfig('default_currency_symbol').' ' . $trade->price,
								$user->money,
								$Config->getConfig('default_currency_symbol').' ' .  ($trade->discount ? $trade->discount : "0.00"),
								date('Y-m-d H:i:s', $close_date),
								$lang->getLang('TotalPrice'),
								$Config->getConfig('default_currency_symbol').' ' . $trade->total,
							], $Content
						),
						[], 
						[]
					);
				} catch (Exception $e) {
					echo $e->getMessage();
				}
			}
			
			$trade->delete();
	}
		
	public function cancel($request, $response, $orderid)
	{
		$Config = new Config();
		$user = Auth::getUser();
		$lang = new i18n();	
		$order = TempOrder::where("order_id", $orderid)->where('userid', $user->id)->first();		
		if ($order){
			$user = User::find($order->userid);	
			
			if($order->paymethod == 1 || $order->paymethod == 2){
				TmpOrder::where("oid", $order->order_id)->delete();	
			}
			
			$purchase = new Order();
			$purchase->close_date		= time();
			$purchase->create_date	    = $order->create_date;
			$purchase->state			= -2;
			$purchase->coupon			= $order->coupon;
			$purchase->packageid 		= $order->packageid;
			$purchase->userid			= $user->id;
			$purchase->email			= $user->email;
			$purchase->username		    = $user->user_name;
			$purchase->total			= $order->total;
			$purchase->really_price		= $order->price;
			$purchase->type 			= $order->type;
			$purchase->renew			= $order->renew;
			$purchase->exrate		    = $order->exrate;
			$purchase->packagetype		= $order->packagetype;
			$purchase->packagexp		= $order->packagexp;
			$purchase->order_id			= $order->order_id;
			$purchase->pay_url 			= $order->pay_url;
			$purchase->save();
			
			$order->delete();
			
			if (
				$Config->getConfig('telegram_chatid')!= ""  
				&&  $Config->getConfig('telegram_token') != ""  
				&&  $Config->getConfig('enable_telegram') == 1
			){
				$messageText = $lang->getLang("Transac") . PHP_EOL .
				$lang->getLang("UserN")	.	  '： #' . $user->id .' '.$user->user_name .  PHP_EOL .
				$lang->getLang("email")	.	  '：'. $user->email . PHP_EOL .
				$lang->getLang("order-number") .  '：#'. $purchase->order_id . PHP_EOL .
				$lang->getLang("CreateTime") .'：'. date('Y-m-d H:i:s', $purchase->create_date) . PHP_EOL .
				$lang->getLang('Status').' '.$lang->getLang('orderc');	
				(new Telegram())->SendNotify($messageText, $Config->getConfig('telegram_chatid'));
			}
			
			$res['ret'] = 1;
			$res['msg'] = $lang->get('order_cancel');
			$res['url'] = (new Checkout())->Url().'/portal/canceled?orderid='.$purchase->order_id;
			
			$response->getBody()->write(json_encode($res));
			return $response;
		}
	}

	public function updateQuery($orderid)
	{	
			$trade = Order::where("order_id", $orderid)->first();
			$user = User::find($trade->userid);	
			$lang = new i18n();
			$Config = new Config();
			$Content = (new \App\Http\Controllers\Admin\TemplatesController())->getContent(3);			
			$package = Package::where("id", $trade->packageid)->where("status", 1)->first();
			
			if ($package->type == 1) {
				$user->transfer_enable += $package->bandwidth * 1024 * 1024 * 1024;
				$user->save();
			}
			
			if ($package->type == 2) {
				$user->level = $package->level;
				$user->group = $package->group;
				$user->speedlimit = $package->speedlimit;
				$user->connector = $package->connector;
				
				if ($trade->renew == 0) {
					$user->expire_in = date('Y-m-d H:i:s', time() + $trade->packagexp * 86400);
					$user->transfer_enable = $package->bandwidth * 1024 * 1024 * 1024;
					$user->u = 0;
					$user->d = 0;
					$user->last_day_t = 0;
				} else {
					if($package->renew_traffic_type == 1){
						$user->transfer_enable = $package->bandwidth * 1024 * 1024 * 1024;
					}else{
						$user->transfer_enable += $package->bandwidth * 1024 * 1024 * 1024;
					}
					if ($package->renew_type == 1) {
						$user->expire_in =   date('Y-m-d H:i:s', time() + $trade->packagexp * 86400);
					}else{
						$user->expire_in = date('Y-m-d H:i:s', strtotime($user->expire_in) +  ($trade->packagexp * 86400));
					}
				}

				$user->save();
			}
					
			if ($package->type == 2) {
				if ($trade->renew == 0 || $package->renew_type == 1)  {
					$trade->exp  = strtotime($user->expire_in);	
				}else{
					$trade->exp  = time() + $trade->packagexp * 86400;
				}
			}
			
			$trade->status = 1;
			$trade->save();
			
			if($trade->type != 11){
				if($trade->extra != "" || $trade->extra != null ){	
					if($user->money <= $trade->really_price){
						$user->money = $trade->extra;
						$user->save();
					}else{
						$user->money += $trade->extra;
						$user->save();	
					}
				}elseif($user->money <= $trade->really_price){
					$user->money = 0;
					$user->save();
				}
			}

			$close_date = time();
			

			if ($package->type == 1) {
				$pktype = $lang->get("topup");
			}else if($package->type == 2){
				$pktype = $lang->get("package");
			}			
			
			if ($Config->GetConfig('enable_rebate') == 1){
				if (
					($Config->getConfig('comm_pay_once') == 1 && Commission::where('ref_by', $user->ref_by)->where('userid', $user->id)->count() < 1)
					|| $Config->getConfig('comm_pay_once') == 0
				){
					if ($user->ref_by > 0 && $package->type == 2 && $user->ref_by != $user->id ) {
						
						$gift_user = User::where('id', '=', $user->ref_by)->first();
						$gift_user->aff_balance += ($trade->really_price * ($Config->getConfig('rebate') / 100));
						$gift_user->save();
						
						$Payback = new Commission();
						$Payback->total = $trade->really_price;
						$Payback->packageid = $trade->packageid;
						$Payback->userid = $user->id;
						$Payback->ref_by = $user->ref_by;
						$Payback->ref_get = ($trade->really_price * ($Config->getConfig('rebate') / 100));
						$Payback->datetime = time();
						$Payback->save();
					}
				}
			}
			
			$trade->close_date		= $close_date;
			$trade->state			= 1;
			$trade->pay_date	        = time();
			$trade->save();
				
			if (
				$Config->getConfig('telegram_chatid')!= ""  
				&&  $Config->getConfig('telegram_token') != ""  
				&&  $Config->getConfig('enable_telegram') == 1
			){
				$messageText = $lang->getLang("Transac") . PHP_EOL .
				'------------------------------' . PHP_EOL .
				$lang->getLang("UserN")	.	  '： #' . $user->id .' '.$user->user_name .  PHP_EOL .
				$lang->getLang("email")	.	  '：'. $user->email . PHP_EOL .
				$lang->getLang("order-number") .  '：#'. $trade->order_id . PHP_EOL .
				$lang->getLang("TransacType"). '：【'.$pktype.'】 ' . $package->name . ' ' . $package->bandwidth.'GB ' . PHP_EOL .
				$lang->getLang("OrderAmt") .  '：' .$Config->getConfig('default_currency_symbol') . ' ' . $trade->really_price . PHP_EOL .
				$lang->getLang("PayMeth") .   '：' . (new Order())->paytype($trade->type). PHP_EOL .
				$lang->getLang("WallBal") .   '：' .$Config->getConfig('default_currency_symbol') . ' ' . $user->money . PHP_EOL .
				$lang->getLang("CreateTime") . '：' . date('Y-m-d H:i:s', $trade->create_date) . PHP_EOL .
				$lang->getLang("PayTime") .   '：' . date('Y-m-d H:i:s', $close_date);
				(new Telegram())->SendNotify($messageText, $Config->getConfig('telegram_chatid'));		
			}
			
			if ($Config->getConfig('mailDriver') != 0 && 
				$Config->getConfig('enable_notification')== 1 && 
				$Config->getConfig('send_order_email')== 1 &&
				$user->notification == 1 
			){
					$subject = $Config->getConfig('appName') . '-'. $lang->get('Invoice');
					try {
						Mail::send($user->email, $subject, 
						str_replace(
							[
								'%app_color%',
								'/%baseUrl%',
								'%appName%',
								'%UserName%',
								'%Lang_order1%',
								'%orderID%',
								'%Lang_order2%',
								'%Lang_order5%',
								'%Lang_Description%',
								'%Lang_OrderAmount%',
								'%Lang_AcBalance%',
								'%Lang_discount%',
								'%itemDes%',
								'%itemPrice%',
								'%usermoney%',
								'%disPrice%',
								'%orderDate%',
								'%Lang_TotalPrice%',
								'%TotalPrice%',
							],
							[
								$Config->getConfig('app_color'),
								$Config->getConfig('baseUrl'), 
								strtoupper($Config->getConfig('appName')),
								$user->user_name,
								$lang->get('order1'),
								$trade->order_id,
								$lang->getLang('order2'), 
								$lang->getLang('order5'), 
								$lang->getLang('Description'),
								$lang->getLang('OrderAmount'),
								$lang->getLang('AcBalance'),
								$lang->getLang('discount'),
								$Config->getConfig('appName') . ' - '. $package->bandwidth.' GB '. $package->name,
								$Config->getConfig('default_currency_symbol').' ' . $trade->price,
								$user->money,
								$Config->getConfig('default_currency_symbol').' ' .  ($trade->discount ? $trade->discount : "0.00"),
								date('Y-m-d H:i:s', $close_date),
								$lang->getLang('TotalPrice'),
								$Config->getConfig('default_currency_symbol').' ' . $trade->total,
							], $Content
						), 
						[], 
						[]
						);
					} catch (Exception $e) {
						echo $e->getMessage();
					}
				
			}
	}	
}		