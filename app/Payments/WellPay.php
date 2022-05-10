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
use Exception;


class WellPay extends BaseController
{
	private $gatewayUri;
	
	public function __construct()
    {
       $this->gatewayUri = 'https://check.bbapk.xyz/api/Wellpay/create'; 
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

    public function verify($context_arr, $signature)
    {
		$Config = new Config();
        $s_key = $Config->getConfig('wellpay_app_secret');
        $return_arr_forsort=array();
        foreach ($context_arr as $key => $val) {
            if($key!='sign'&&$key!='sign_type'&&$key!='data'&&$val!=null&&$val!='')
                $return_arr_forsort[$key]=$val;
                
                if($key=='data')
                {
                    foreach($val as $key1=>$val1)
                    {
                        if($val1!=null&&$val1!='')
                            $return_arr_forsort[$key1]=$val1;
                    }
                }
        }
       ksort($return_arr_forsort);
        $signStr = htmlspecialchars(http_build_query($return_arr_forsort));
        $sign2 = strtolower(md5($signStr . $s_key));
        return $sign2 === $signature;
    }
    
	public function post($url,$data)
    {
		if (is_array($data))
        {
            $data = http_build_query($data, null, '&');
        }
		
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL, $url);
        curl_setopt($curl, CURLOPT_HEADER, 0);       
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, false);
        curl_setopt($curl, CURLOPT_POST, 1);
        curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
        curl_setopt($curl, CURLOPT_HTTPHEADER,  array(
            "Content-Type: application/x-www-form-urlencoded"
		));
            
        $data = curl_exec($curl);
        curl_close($curl);
        return $data;
    }
	
    function http_post_data($url, $data_string) {
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data_string);
        curl_setopt($ch, CURLOPT_HTTPHEADER, array(
            "Content-Type: application/x-www-form-urlencoded "
		) );
        ob_start();
        curl_exec($ch);
        $return_content = ob_get_contents();
        ob_end_clean();
        $return_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        return $return_content;
    }
	
    public function wellpay($request, $response, $args)
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

		$rate = $Currency->getRate($Config->getConfig('wellpay_currency_code'));
		
		$item->status 		= 0;
		$item->create_date 	= time();
		$item->expdate 		= time() + 7200;
		$item->exrate		= bcmul($price,$rate, 2);
        $item->notify_url 	= (new Checkout())->Callback()."/notify/wellpay";
        $item->type		    = 22;
		$item->save();
		
		$appid = $Config->getConfig('wellpay_app_id');
        $nonce_str = md5(time());
        $ip = $this->getip();
		
        $business = array(
            'request_time' => time(),
            'version' =>'1.01',
            'ip'=> $ip,
            'remark'=>""
        );
		
		$notify_url = $item->notify_url;
        $return_url = $item->notify_url;
        $price = sprintf("%.2f",$item->exrate);
       
        $data = array(
            'appid'=> $appid,
            'orderno' => $item->order_id,
            'totalfee'=> $price,
            'notifyurl' => $notify_url,
            'returnurl' => $item->notify_url.'?wid='.$item->order_id,
        );
		
        $appkey = $Config->getConfig('wellpay_app_secret');
        ksort($data);
        $sign1 = htmlspecialchars(http_build_query($data));
      
        $sign = strtolower(md5($sign1 . $appkey));
        $business["sign"] = $sign;
        $business["data"] = $data;
   
        $json_return_content= $this->post( $this->gatewayUri, $business);
		$context_arr = json_decode($json_return_content, true);
		
		if(isset($context_arr['data']['waterid']) && isset($context_arr['data']['url'])){
			$item = TempOrder::where("id", '=', $item->id)->where('status', 0)->first();
			$item->pay_url 	= $context_arr['data']['url'];
			$item->save();	
				
			$res['ret'] 	= 1;
			$res['url'] 	= $context_arr['data']['url'];
			$response->getBody()->write(json_encode($res));
			return $response;
		}else  {
			$res['ret'] 	= 0;
			$res['msg'] 	= '创建支付订单错误'.$context_arr['msg'];
			$response->getBody()->write(json_encode($res));
			return $response;
        }
    }
		
		
    public function callback($request, $response, $args)
    {	
		ini_set('memory_limit', '-1');
		$params = $_POST;
		$user = Auth::getUser();
		$content = $request->getQueryParams();
		if(isset($content['wid'])){
			$orders = Order::where("order_id", '=', $content['wid'])->where('userid', $user->id)->first();
			if($orders->state == 1 || $orders->state == "1"){
				return $response->withStatus(302)->withHeader('Location', (new Checkout())->Url().'/portal/success?orderid='.$content['wid']);
			}else{
				return $response->withStatus(302)->withHeader('Location', (new Checkout())->Url().'/portal/orders');
			}
		}else{	
			if (!self::verify($params, $params['sign'])) {
				return $response->withStatus(302)->withHeader('Location', (new Checkout())->Url().'/portal/orders');
			}else{
				$order = TempOrder::where("order_id", '=', $params['orderno'])->where('userid', $user->id)->first();
				if ($order){
					(new Purchase())->update($params['orderno']);
					echo 'success';
					return $response->withStatus(302)->withHeader('Location', (new Checkout())->Url().'/portal/success?orderid='.$params['orderno']);
					exit;
				}else{
					$orders = Order::where("order_id", '=', $params['orderno'])->where('userid', $user->id)->first();
					if($orders->state == 1 || $orders->state == "1"){
						return $response->withStatus(302)->withHeader('Location', (new Checkout())->Url().'/portal/success?orderid='.$params['orderno']);
					}else{
						return $response->withStatus(302)->withHeader('Location', (new Checkout())->Url().'/portal/orders');
					}
				}
			}
		}
		$response->getBody()->write("Order verification failed");
		return $response;
	}
	
    public function getip() {
        static $ip = '';
        $ip = $_SERVER['REMOTE_ADDR'];
        if(isset($_SERVER['HTTP_CDN_SRC_IP'])) {
            $ip = $_SERVER['HTTP_CDN_SRC_IP'];
        } elseif (isset($_SERVER['HTTP_CLIENT_IP']) && preg_match('/^([0-9]{1,3}\.){3}[0-9]{1,3}$/', $_SERVER['HTTP_CLIENT_IP'])) {
            $ip = $_SERVER['HTTP_CLIENT_IP'];
        } elseif(isset($_SERVER['HTTP_X_FORWARDED_FOR']) AND preg_match_all('#\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}#s', $_SERVER['HTTP_X_FORWARDED_FOR'], $matches)) {
            foreach ($matches[0] AS $xip) {
                if (!preg_match('#^(10|172\.16|192\.168)\.#', $xip)) {
                    $ip = $xip;
                    break; 
                } 
            }
        }
        return $ip;
    }
}	