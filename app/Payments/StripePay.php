<?php

namespace App\Payments;

use Stripe\Stripe;
use Stripe\Charge;
use Stripe\Source;
use App\Helpers\i18n;
use App\Handlers\Config; 
use App\Helpers\Helpers;
use App\Http\Models\User;
use App\Http\Models\Order;
use App\Http\Models\Package;
use App\Http\Models\Coupon;
use App\Http\Models\Currency;
use App\Handlers\AuthHandler\Auth;
use App\Helpers\QrcodeGen;
use App\Http\Controllers\BaseController;
use App\Http\Models\TempOrder;
use Exception;

class StripePay extends BaseController
{

	public function __construct()
    {
		$Config = new Config(); 
        Stripe::setApiKey($Config->getConfig('stripe_key'));
    }

	public function stripe($request, $response, $args)
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
		$type  = $content['type'];
		
		$item = TempOrder::where("order_id", $order_id)->where('userid', $user->id)->first();
		if(!$item){	
			$res['ret'] = 0;			
			$res['msg'] = $lang->get('pack_not_found');
			$res['url'] = (new Checkout())->Url().'/portal/packages';
			$response->getBody()->write(json_encode($res));
			return  $response;
		}

		if($item->pay_url != "" || $item->pay_url != null){
			if($item->paymethod == 3){
				$url = (new Checkout())->Url().'/portal/pay?orderid='.$item->order_id;
			}else{
				$url = $item->pay_url;
			}
			$res['ret'] 		= 1;
			$res['url'] 	    = $url;
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
		
		
		$rate = $Currency->getRate($Config->getConfig('stripe_currency_code'));
		
		$item->status 		= 0;
		$item->create_date 	= time();	
		$item->expdate 		= time() + 7200;
		$item->exrate		= bcmul($price,$rate, 2);
		$item->notify_url 	= (new Checkout())->Callback()."/notify/stripe";
		$item->save();			

		try {
			$payment_method_types =  array();
			
			if($Config->getConfig('enable_stripe_card') == "1"){
				array_push($payment_method_types,"card");
			}
			
			if($Config->getConfig('enable_stripe_alipay') == "1"){
				array_push($payment_method_types,"alipay");
			}
			
			if($Config->getConfig('enable_stripe_wechat') == "1"){
				array_push($payment_method_types,"wechat_pay");
			}			
			
			$checkout_session = \Stripe\Checkout\Session::create([
				'customer_email' => $user->email,
				'line_items' => [
					[
					    'price_data' => [
							'currency' => $Config->getConfig('stripe_currency_code'),
							'product_data' => [
							  'name' => (Helpers::getCookie('lang') == "en" ? 'Account Recharge' : "账户充值"),
							],
							'unit_amount' => $item->exrate * 100,
					    ],
					  'quantity' => 1,
					]
				],
				'mode' => 'payment',
				"locale" => (Helpers::getCookie('lang') == "en" ? "en" : "zh"),
				"payment_method_types" => $payment_method_types,
				"payment_method_options" => [
					"wechat_pay" => [
						"client" => "web"
					],
				],
				"metadata" => [
					"order_id" => $item->order_id,
				],
				'success_url' => $item->notify_url,
				'cancel_url'  => (new Checkout())->Url().'/portal/order?id='.$item->order_id,
			]);
				
			$item  = TempOrder::where("id", '=', $item->id)->where('status', 0)->first();
			$item->pay_id 	= $checkout_session['id'];
			$item->pay_url 		= $checkout_session['url'];
			$item->save();
				
			$res['ret'] 	= 1;
			$res['url'] 	= $checkout_session['url'];
			$response->getBody()->write(json_encode($res));
			return $response;
		}catch (Exception $e) {
			$res['ret'] 	= 0;
			$res['msg'] 	= $lang->get('order-create-error').": ".$e->getMessage();
			$response->getBody()->write(json_encode($res));
			return $response;
		}
	}

	public function callback($request, $response, $args)
    {	
	    ini_set('memory_limit', '-1');
		$Config = new Config();
		\Stripe\Stripe::setApiKey($Config->getConfig('stripe_key'));		
		
		$payload = @file_get_contents('php://input');
		$endpoint_secret = $Config->getConfig('stripe_webhook');
		$sig_header = $_SERVER['HTTP_STRIPE_SIGNATURE'];
		$event = null;
			
		try {
			$event = \Stripe\Webhook::constructEvent(
				$payload,
				$sig_header,
				$endpoint_secret
			); 
		} catch(\UnexpectedValueException $e) {
				$response->getBody()->write($e->getMessage());
				return $response;
		} catch (\Stripe\Exception\SignatureVerificationException $e) {
				$response->getBody()->write($e->getMessage());
				return $response;
		} 
		
		$stripe = new \Stripe\StripeClient($Config->getConfig('stripe_key'));
		switch ($event->type) {
			case 'source.chargeable':
			$source = $event->data->object;
			$session = $stripe->charges->retrieve($source['id'], []);
			if ($session['status'] == 'succeeded' && $session['paid'] == true) {
				$order = TempOrder::where("order_id", '=',  $source['metadata']['order_id'])->first();
				if($order){
					(new Purchase())->update($order->order_id);
					return $response->withStatus(302)->withHeader('Location', (new Checkout())->Url().'/portal/success?orderid='.$order->order_id);
					exit;
				}else{
					return $response->withStatus(302)->withHeader('Location', (new Checkout())->Url().'/portal/orders');
					exit;
				}
			}else{
				return $response->withStatus(302)->withHeader('Location', (new Checkout())->Url().'/portal/orders');
				exit;
			}
			break;
			case 'checkout.session.completed':
				$sessions = $event->data->object;
				$session = $stripe->checkout->sessions->retrieve($sessions['id'], []);
				if ($session->payment_status == 'paid') {	
					$order = TempOrder::where("order_id", '=',  $sessions['metadata']['order_id'])->first();
					if($order){
						(new Purchase())->update($sessions['metadata']['order_id']);
						return $response->withStatus(302)->withHeader('Location', (new Checkout())->Url().'/portal/success?orderid='.$order->order_id);	
						exit;							
					}else{
						return $response->withStatus(302)->withHeader('Location', (new Checkout())->Url().'/portal/orders');
						exit;
					}
				}else{
					return $response->withStatus(302)->withHeader('Location', (new Checkout())->Url().'/portal/orders');
					exit;
				}	
			break;	
		}
		die();
				
		$response->getBody()->write("");
		return $response;
	}	
}