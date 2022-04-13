<?php

namespace App\Payments;

use Exception;
use Paymentwall_Config;
use Paymentwall_Pingback;
use Paymentwall_Widget;
use Paymentwall_Product;
use Paymentwall_GenerericApiObject; 

use App\Http\Models\Order;
use App\Http\Models\User;
use App\Http\Models\Package;
use App\Http\Models\Coupon;
use App\Handlers\Config;
use App\Helpers\Helpers;
use App\Helpers\i18n;
use App\Http\Models\Currency;
use App\Http\Models\TempOrder;
use App\Handlers\AuthHandler\Auth;
use App\Http\Controllers\BaseController;


class Paymentwall extends BaseController
{

    public function paymentwall($request, $response, $args)
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
		
		$rate = $Currency->getRate($Config->getConfig('paymentwall_currency_code'));
		
		$item->status 		= 0;
		$item->create_date 	= time();
		$item->expdate 		= (time() + 600)*1000;
		$item->exrate		= bcmul($price,$rate, 2);
        $item->notify_url 	= (new Checkout())->Callback()."/notify/paymentwall";
        $item->save();
   
		
		if(Helpers::getCookie('lang')== "en"){
			$lang = "en";
		}else{
			$lang = "zh_CN";
		}
		
		try {
			Paymentwall_Config::getInstance()->set(array(
			'api_type' => Paymentwall_Config::API_GOODS,
			'public_key' => $Config->getConfig('paymentwall_key'),
			'private_key' => $Config->getConfig('paymentwall_secret')
			));

			$widget = new Paymentwall_Widget(
				$user->id, // uid
				$Config->getConfig('paymentwall_widget'), // widget
				array(
					new Paymentwall_Product(
						$item->order_id, // ag_external_id
						$item->exrate, // amount
						$Config->getConfig('paymentwall_currency_code'), // currencyCode
						$Config->getConfig('appName').' - '.$package->name, // ag_name
						Paymentwall_Product::TYPE_FIXED // ag_type
					) 
				),
				array(
					'email' => $user->email, 
					'history[registration_date]' => strtotime($user->reg_date),
					'ps' => $type,
					'customer[username]' => $user->user_name,
					'success_url' => (new Checkout())->Url().'/portal/clientarea',
					'failure_url' => (new Checkout())->Url()."portal/checkout?id=".$package->id,
					'pingback_url' => $item->notify_url,
					'logo_url' => $Config->getConfig('logo_path'),
					'project_name' => $Config->getConfig('appName'),
					'lang' => $lang,
					'country_code' => $Config->getConfig('paymentwall_country_code'),
					'merchant_order_id' => $item->order_id
				)
			);

			$item = TempOrder::where("id", '=', $item->id)->where('status', 0)->first();
			$item->pay_url 	= $widget->getUrl();
			$item->type		= 17;
			$item->save();	
				
			$res['ret'] 	= 1;
			$res['url'] 	= $widget->getUrl();			
			$response->getBody()->write(json_encode($res));
			return $response;
		}catch (Exception $e) {
			$res['ret'] 	= 0;
			$res['msg'] 	= $e->getMessage();
			$response->getBody()->write(json_encode($res));
			return $response;
        }
    }
		
    public function callback($request, $response, $args)
    {		
		$Config = new Config();
		Paymentwall_Config::getInstance()->set(array(
			'api_type' => Paymentwall_Config::API_GOODS,
			'public_key' => $Config->getConfig('paymentwall_key'),
			'private_key' => $Config->getConfig('paymentwall_secret')
		));
		$pingback = new Paymentwall_Pingback($_GET, $_SERVER['REMOTE_ADDR']);
		$delivery = new Paymentwall_GenerericApiObject('delivery');
		$delivery->post(array(
			'payment_id' => $pingback->getProductId,
			'merchant_reference_id' => $pingback->getProductId,
			'type' => 'digital',
			'status' => 'delivered',
			'refundable' => false,
			'details' => 'Item was delivered to the user account',
			'reason' => 'none',
		));
		if ($pingback->validate()) {
		  $productId = $pingback->getProduct()->getId();
		  if ($pingback->isDeliverable()) {
		    // deliver the product
		  } else if ($pingback->isCancelable()) {
			// 
		  }
		  
		  $order = TempOrder::where("order_id", '=', $pingback->getProductId)->first();
		  if($order){
			(new Purchase())->update($pingback->getProductId);
			echo 'OK';
			return $response->withStatus(302)->withHeader('Location', (new Checkout())->Url().'/portal/success?orderid='.$pingback->getProductId);
		  } else {
				$orders = Order::where("order_id", '=', $pingback->getProductId)->first();
				if($orders->state == 1 || $orders->state == "1"){
					return $response->withStatus(302)->withHeader('Location', (new Checkout())->Url().'/portal/success?orderid='.$pingback->getProductId);
				}else{
					return $response->withStatus(302)->withHeader('Location', (new Checkout())->Url().'/portal/orders');
				}
		  }
		} else {
		  //echo $pingback->getErrorSummary();
		  return $response->withStatus(302)->withHeader('Location', (new Checkout())->Url().'/portal/orders');
		}
		$response->getBody()->write("");
		return $response;
	}
}	