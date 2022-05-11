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
use App\Http\Controllers\BaseController;
use App\Http\Models\Currency;
use Omnipay\Omnipay;
use App\Handlers\AuthHandler\Auth;
use App\Http\Models\TempOrder;

class PayPal extends BaseController
{
	
	
    private function createPayPalGateway()
    {
		$Config = new Config();
        $gateway = Omnipay::create('PayPal_Rest');
		$gateway->setClientId($Config->getConfig('paypal_client'));
		$gateway->setSecret($Config->getConfig('paypal_secret'));
		if($Config->getConfig('paypal_mode') == "live"){
			$gateway->setTestMode(false);
		}else{
			$gateway->setTestMode(true);
		}
        return $gateway;
    }	
	
    public function paypal($request, $response, $args)
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
		
		$rate = $Currency->getRate($Config->getConfig('paypal_currency_code'));
		
		$item->status 		= 0;
		$item->create_date 	= time();
		$item->expdate 		= 0;
		$item->exrate		= bcmul($price,$rate, 2);
        $item->notify_url 	= (new Checkout())->Callback()."/notify/paypal";
        $item->type		    = 14;
		$item->save();

		$gateway = $this->createPayPalGateway();
		try {
			$transaction = $gateway->purchase(array(
				'amount'        => $item->exrate,
				'transactionId' => $item->order_id,
				'currency'      => $Config->getConfig('paypal_currency_code'),
				'description'   => $Config->getConfig('appName').' - Invoice #'.$paypal->id,
				'returnUrl' 	=> $item->notify_url,
                'cancelUrl' 	=> (new Checkout())->Url()."/portal/checkout?id=".$package->id
			));
			$data = $transaction->getData();
			$data['application_context']['shipping_preference'] = 'NO_SHIPPING';
			$results = $transaction->sendData($data);
	
			$item = TempOrder::where("id", '=', $item->id)->where('status', 0)->first();
			$item->pay_id = $results->getTransactionReference();
			$item->pay_url  = $results->getRedirectUrl();
			$item->save();	
			
			$res['ret'] = 1;				
			$res['url'] = $results->getRedirectUrl();
			$response->getBody()->write(json_encode($res));
			return $response;

		} catch (Exception $e) { 
			$res['ret'] 	= 0;
			$res['msg'] 	= $lang->get('order-create-error')." ".$e->getMessage();
			$response->getBody()->write(json_encode($res));
			return $response;
			die('fail');
		}	  
    }

	
	public function callback($request, $response, $args)
    {
		$Config = new Config();
		$user = Auth::getUser();
		$paymentId = $_GET['paymentId'];
		$payerId = $_GET['PayerID'];
        $gateway = $this->createPayPalGateway();
		
        $query = $gateway->completePurchase(array(
			"transactionReference" => $paymentId,
			"payerId" => $payerId
		))->send();
		
		try {
	        if ($query->isSuccessful()){
				$order = TempOrder::where("pay_id", '=', $paymentId)->where('userid', $user->id)->first();
				if($order){
					(new Purchase())->update($order->order_id);
					return $response->withStatus(302)->withHeader('Location', (new Checkout())->Url().'/portal/success?orderid='.$order->order_id);
				}else{
					return $response->withStatus(302)->withHeader('Location', (new Checkout())->Url().'/portal/orders');
				}
			}
		}catch (Exception $e) {
            return $response->withStatus(302)->withHeader('Location', (new Checkout())->Url().'/portal/orders');
        }
		$response->getBody()->write("");
		return $response;
	}
}	