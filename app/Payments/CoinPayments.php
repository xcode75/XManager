<?php

namespace App\Payments;

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

class CoinPaymentsAPI 
{
	
	private $private_key = '';
	private $public_key = '';
	private $ch = null;
	
	public function Setup($private_key, $public_key) {
		$this->private_key = $private_key;
		$this->public_key = $public_key;
		$this->ch = null;
	}
	
	public function GetRates($short = TRUE) {
		$short = $short ? 1:0;
		return $this->api_call('rates', array('short' => $short));
	}
	
	public function CreateTransactionSimple($amount, $currency1, $currency2, $buyer_email, $address='', $ipn_url='') {		
		$req = array(
			'amount' => $amount,
			'currency1' => $currency1,
			'currency2' => $currency2,
			'buyer_email' => $buyer_email,
			'address' => $address,
			'ipn_url' => $ipn_url,
		);
		return $this->api_call('create_transaction', $req);
	}

	public function CreateTransaction($req) {
		return $this->api_call('create_transaction', $req);
	}

	public function GetCallbackAddress($currency, $ipn_url = '') {		
		$req = array(
			'currency' => $currency,
			'ipn_url' => $ipn_url,
		);
		return $this->api_call('get_callback_address', $req);
	}

	public function CreateWithdrawal($amount, $currency, $address, $auto_confirm = FALSE, $ipn_url = '') {		
		$req = array(
			'amount' => $amount,
			'currency' => $currency,
			'address' => $address,
			'auto_confirm' => $auto_confirm ? 1:0,
			'ipn_url' => $ipn_url,
		);
		return $this->api_call('create_withdrawal', $req);
	}

	public function CreateTransfer($amount, $currency, $merchant, $auto_confirm = FALSE) {		
		$req = array(
			'amount' => $amount,
			'currency' => $currency,
			'merchant' => $merchant,
			'auto_confirm' => $auto_confirm ? 1:0,
		);
		return $this->api_call('create_transfer', $req);
	}

	public function SendToPayByName($amount, $currency, $pbntag, $auto_confirm = FALSE) {		
		$req = array(
			'amount' => $amount,
			'currency' => $currency,
			'pbntag' => $pbntag,
			'auto_confirm' => $auto_confirm ? 1:0,
		);
		return $this->api_call('create_transfer', $req);
	}
	
	private function is_setup() {
		return (!empty($this->private_key) && !empty($this->public_key));
	}
	
	private function api_call($cmd, $req = array()) {
		if (!$this->is_setup()) {
			return array('error' => 'You have not called the Setup function with your private and public keys!');
		}

		$req['version'] = 1;
		$req['cmd'] = $cmd;
		$req['key'] = $this->public_key;
		$req['format'] = 'json'; 
	    
		$post_data = http_build_query($req, '', '&');
	    
		$hmac = hash_hmac('sha512', $post_data, $this->private_key);
	    
		if ($this->ch === null) {
			$this->ch = curl_init('https://www.coinpayments.net/api.php');
			curl_setopt($this->ch, CURLOPT_FAILONERROR, TRUE);
			curl_setopt($this->ch, CURLOPT_RETURNTRANSFER, TRUE);
			curl_setopt($this->ch, CURLOPT_SSL_VERIFYPEER, 0);
		}
		curl_setopt($this->ch, CURLOPT_HTTPHEADER, array('HMAC: '.$hmac));
		curl_setopt($this->ch, CURLOPT_POSTFIELDS, $post_data);
	    
		$data = curl_exec($this->ch);                
		if ($data !== FALSE) {
			if (PHP_INT_SIZE < 8 && version_compare(PHP_VERSION, '5.4.0') >= 0) {
				$dec = json_decode($data, TRUE, 512, JSON_BIGINT_AS_STRING);
			} else {
				$dec = json_decode($data, TRUE);
			}
			if ($dec !== NULL && count($dec)) {
				return $dec;
			} else {
				return array('error' => 'Unable to parse JSON result ('.json_last_error().')');
			}
		} else {
			return array('error' => 'cURL error: '.curl_error($this->ch));
		}
	}		
};


class CoinPayments extends BaseController
{	
	public function coinpayments($request, $response, $args)
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
		
		
		$rate = $Currency->getRate($Config->getConfig('cp_currency_code'));
		
		$item->status 		= 0;
		$item->create_date 	= time();	
		$item->expdate 		= time() + 7200;
		$item->exrate		= bcmul($price,$rate, 2);
		$item->notify_url 	= (new Checkout())->Callback()."/notify/coinpayments";
        $item->type		    = 4;
		$item->save();

		$cps = new CoinPaymentsAPI();		
		$cps->Setup($Config->getConfig('cp_private_key'), $Config->getConfig('cp_public_key'));
		
		$req = array(
			'amount' 		=> $item->exrate,
			'currency1' 	=> $Config->getConfig('cp_currency_code'),
			'currency2' 	=> "USDT.TRC20",
			'buyer_email' 	=> $user->email,
			'item_name' 	=> $package->name,
			'address' 		=> '',
			'ipn_url' 		=> $item->notify_url,
			'cancel_url'	=> $item->notify_url
		);
		$result = $cps->CreateTransaction($req);
		
		if ($result['error'] == 'ok') {	
                
				$item  = TempOrder::where("id", '=', $item->id)->where('status', 0)->first();
				$item->order_id 	= $result['result']['txn_id'];
				$item->pay_url 		= $result['result']['checkout_url'];
				$item->pay_qrcode 	= (new QrcodeGen)->Generate2($result['result']['address'], LOGO_PATH.($Config->getConfig('template') ? $Config->getConfig('template') : "default")."/img/pay/4.png");
				$item->expdate 		= time() + $result['result']['timeout'];
				$item->amount 		= $result['result']['amount'];
				$item->wallet 		= $result['result']['address'];
				$item->save();
				
				$res['ret'] 		= 1;
				$res['url'] 	    = (new Checkout())->Url().'/portal/pay?orderid='.$item->order_id;
				$response->getBody()->write(json_encode($res));
				return $response;
		} else {
				$res['ret'] 	= 0;
				$res['msg'] 	= $lang->get('order-create-error')." ".$result['error'];
				$response->getBody()->write(json_encode($res));
				return $response;
		}	
	}
	
	
    public function callback($request, $response, $args)
    {		
		$Config = new Config();
		$user = Auth::getUser();
		$cp_merchant_id = $Config->getConfig('cp_merchant_id');
		$cp_ipn_secret = $Config->getConfig('cp_ipn_secret');
		
		if (!isset($_POST['ipn_mode']) || $_POST['ipn_mode'] != 'hmac') {
			return $response->getBody()->write('IPN Mode is not HMAC');
		}
		
		if (!isset($_SERVER['HTTP_HMAC']) || empty($_SERVER['HTTP_HMAC'])) {
			return $response->getBody()->write('No HMAC signature sent.');
		}
		
		$callback = file_get_contents('php://input');
		if ($callback === FALSE || empty($callback)) {
			return $response->getBody()->write('Error reading POST data');
		}
		
		if (!isset($_POST['merchant']) || $_POST['merchant'] != trim($cp_merchant_id)) {
			return $response->getBody()->write('No or incorrect Merchant ID passed');
		}
		
		$hmac = hash_hmac("sha512", $request, trim($cp_ipn_secret));
		if (!hash_equals($hmac, $_SERVER['HTTP_HMAC'])) {
			return $response->getBody()->write('HMAC signature does not match');
		}
		
		$status = intval($_POST['status']);
		
		if ($status >= 100 || $status == 2 || $status == 1){
			$order = TempOrder::where("order_id", '=', $_POST['txn_id'])->where('userid', $user->id)->first();			
			if ($order){
				(new Purchase())->update($_POST['txn_id']);
				return $response->withStatus(302)->withHeader('Location', (new Checkout())->Url().'/portal/success?orderid='.$_POST['txn_id']);
			}else{
				$orders = Order::where("order_id", '=', $_POST['txn_id'])->where('userid', $user->id)->first();
				if($orders->state == 1 || $orders->state == "1"){
					return $response->withStatus(302)->withHeader('Location', (new Checkout())->Url().'/portal/success?orderid='.$_POST['txn_id']);
				}else{
					return $response->withStatus(302)->withHeader('Location', (new Checkout())->Url().'/portal/orders');
				}
			}
		}else{
            if((new Purchase())->cancel($request, $response,  $_POST['txn_id']));{
				return $response->withStatus(302)->withHeader('Location', (new Checkout())->Url().'/portal/canceled?orderid='.$order->order_id);
			}
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
   
}