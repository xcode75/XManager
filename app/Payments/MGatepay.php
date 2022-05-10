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

class MGatepay extends BaseController
{

	private $appSecret;
    private $gatewayUri;
	
    public function __construct()
    {
		$Config = new Config();
        $this->appSecret = $Config->getConfig('mgate_app_secret');
        $this->gatewayUri = $Config->getConfig('mgate_api_url');
    }
	
    public function prepareSign($data)
    {
        ksort($data);
        return http_build_query($data);
    }

 
    public function sign($data)
    {
        return strtolower(md5($data . $this->appSecret));
    }

  
    public function verify($data, $signature)
    {
    	unset($data['sign']);
        $mySign = $this->sign($this->prepareSign($data));
        return $mySign === $signature;
    }

    public function post($data)
    {
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL, $this->gatewayUri);
        curl_setopt($curl, CURLOPT_HEADER, 0);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, false);
        curl_setopt($curl, CURLOPT_POST, 1);
        curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
        curl_setopt($curl, CURLOPT_HTTPHEADER, ['User-Agent: mGate']);
        $data = curl_exec($curl);
        curl_close($curl);
        return $data;
    }
	

	
    public function mgatepay($request, $response, $args)
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
		
		$rate = $Currency->getRate($Config->getConfig('mgate_currency_code'));
		
		$item->status 		= 0;
		$item->create_date 	= time();
		$item->expdate 		= time() + 7200;
		$item->exrate		= bcmul($price,$rate, 2);
        $item->notify_url 	= (new Checkout())->Callback()."/notify/mgate";
        $item->type		    = 8;
		$item->save();

		$data['app_id'] = $Config->getConfig('mgate_app_id');
        $data['out_trade_no'] = $item->order_id;
        $data['total_amount'] = (float)($item->exrate * 100);
        $data['notify_url'] = $item->notify_url;
        $data['return_url'] = $item->notify_url;

        $params = $this->prepareSign($data);
        $data['sign'] = $this->sign($params);
        $result         = json_decode($this->post($data), true);       
		
		if (isset($result['data'])) {
			$item = TempOrder::where("id", '=', $item->id)->where('status', 0)->first();
			$item->pay_url 	= $result['data']['pay_url'];				
			$item->save();
			
			$res['ret'] 		= 1;	
			$res['url'] 		= $item->pay_url;
			$response->getBody()->write(json_encode($res));
			return $response;
		} else {
			$res['ret'] 	= 0;
			$res['msg'] 	= $lang->get('order-create-error');
			$response->getBody()->write(json_encode($res));
			return $response;
		}	  
    }

	
	
    public function callback($request, $response, $args)
    {
		$Config = new Config();
		$user = Auth::getUser();
		$content = $request->getQueryParams();
		if ($this->verify($request->getQueryParams(), $content['sign'])) {
			$order = TempOrder::where("order_id", '=', $content['out_trade_no'])->where('userid', $user->id)->first();
			if ($order){
				(new Purchase())->update($content['out_trade_no']);
				return $response->withStatus(302)->withHeader('Location', (new Checkout())->Url().'/portal/success?orderid='.$content['out_trade_no']);
				exit;
			} else {
				$orders = Order::where("order_id", '=', $content['out_trade_no'])->where('userid', $user->id)->first();
				if($orders->state == 1 || $orders->state == "1"){
					return $response->withStatus(302)->withHeader('Location', (new Checkout())->Url().'/portal/success?orderid='.$content['out_trade_no']);
				}else{
					return $response->withStatus(302)->withHeader('Location', (new Checkout())->Url().'/portal/orders');
				}
			}
		}else{
			return $response->withStatus(302)->withHeader('Location', (new Checkout())->Url().'/portal/orders');
		}
	}	
}	