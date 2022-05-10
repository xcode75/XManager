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


class Token188 extends BaseController
{

    public function pay($order) {
		$Config = new Config();
		$params = [
            'merchantId' => $Config->getConfig('token188_mchid'),
            'outTradeNo' => $order['trade_no'],
            'subject' => $order['trade_no'],
            'totalAmount' => (string)$order['total_fee'],
            'attach' => (string)$order['total_fee'],
            'body' => $order['trade_no'],
            'coinName' => 'USDT-TRC20',
            'notifyUrl' => $order['notify_url'],
            'timestamp' => $this->msectime(),
            'nonceStr' => $this->getNonceStr(16)
        ];
        //echo $params['totalAmount'];
        $mysign = self::GetSign($Config->getConfig('token188_key'), $params);
        // 网关连接
        $ret_raw = self::_curlPost($Config->getConfig('token188_url'), $params,$mysign,1);
        $ret = @json_decode($ret_raw, true);
		
        if ($ret['data']['paymentUrl']=='') {
            throw new \Exception('网络连接异常: 无法连接支付网关');
        }
        return $ret['data']['paymentUrl'];
    }

    public function verify($params) {
        $Config = new Config();
		$coinPay_sign = $params['sign'];
		unset($params['sign']);
		unset($params['notifyId']);
		$sign = self::GetSign($Config->getConfig('token188_key'), $params);
		// check sign
		if ($sign !== $coinPay_sign) {
			echo json_encode(['status' => 400]);
			return false;
		}else{
		    
			return true;
		}
    }

   
	public function GetSign($secret, $params)
    {
        $p=ksort($params);
        reset($params);
		if ($p) {
			$str = '';
			foreach ($params as $k => $val) {
				$str .= $k . '=' .  $val . '&';
			}
			$strs = rtrim($str, '&');
		}
		$strs .='&key='.$secret;
        $signature = md5($strs);
        //$params['sign'] = base64_encode($signature);
        return $signature;
    }
	
    public function msectime() {
		list($msec, $sec) = explode(' ', microtime());
		$msectime = (float)sprintf('%.0f', (floatval($msec) + floatval($sec)) * 1000);
		return $msectime;
    }

    public static function getNonceStr($length = 32)
    {
        $chars = "abcdefghijklmnopqrstuvwxyz0123456789";
        $str = "";
        for ($i = 0; $i < $length; $i++) {
            $str .= substr($chars, mt_rand(0, strlen($chars) - 1), 1);
        }
        return $str;
    }

    private function _curlPost($url,$params=false,$signature,$ispost=0){
        
		$ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_HEADER, 0);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_TIMEOUT, 300); //设置超时
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE); // https请求 不验证证书和hosts
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, FALSE);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $params);
        curl_setopt(
            $ch, CURLOPT_HTTPHEADER, array('token:'.$signature)
        );
        $result = curl_exec($ch);
        curl_close($ch);
        return $result;
    }
	
    public function token188($request, $response, $args)
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

		$rate = $Currency->getRate($Config->getConfig('token188_currency_code'));
		
		$item->status 		= 0;
		$item->create_date 	= time();
		$item->expdate 		= time() + 7200;
		$item->exrate		= bcmul($price,$rate, 2);
        $item->notify_url 	= (new Checkout())->Callback()."/notify/token188";
        $item->type		    = 16;
		$item->save();
		
		$re = [
			'trade_no'      => $item->order_id,
			'total_fee'     => $item->exrate,
			'notify_url'    => rtrim($item->notify_url),
			'return_url'    => rtrim($item->notify_url),
		];
		
		try {
			$result = self::pay($re);	
			
			$item = TempOrder::where("id", '=', $item->id)->where('status', 0)->first();
			$item->pay_url 	= $result;
			$item->save();	
				
			$res['ret'] 	= 1;
			$res['url'] 	= $result;
			$response->getBody()->write(json_encode($res));
			return $response;
		}catch (Exception $e) {
			$res['ret'] 	= 0;
			$res['msg'] 	= '创建支付订单错误：' . $e->getMessage();
			$response->getBody()->write(json_encode($res));
			return $response;
        }
    }
		
    public function callback($request, $response, $args)
    {	
	    ini_set('memory_limit', '-1');
		$Config = new Config();
		$user = Auth::getUser();
		$content = file_get_contents('php://input');
        $params = json_decode($content, true); //convert JSON into array

        if ($this->verify($params)) {
			$order = TempOrder::where("order_id", '=', $params['outTradeNo'])->where('userid', $user->id)->first();
			if ($order){
				(new Purchase())->update($params['outTradeNo']);
				echo 'success';
				return $response->withStatus(302)->withHeader('Location', (new Checkout())->Url().'/portal/success?orderid='.$params['outTradeNo']);
				exit;
			}else{
				$orders = Order::where("order_id", '=', $params['outTradeNo'])->where('userid', $user->id)->first();
				if($orders->state == 1 || $orders->state == "1"){
					return $response->withStatus(302)->withHeader('Location', (new Checkout())->Url().'/portal/success?orderid='.$params['outTradeNo']);
				}else{
					return $response->withStatus(302)->withHeader('Location', (new Checkout())->Url().'/portal/orders');
				}
			}
        }else{
			return $response->withStatus(302)->withHeader('Location', (new Checkout())->Url().'/portal/orders');
		}
		$response->getBody()->write("");
		return $response;
	}
}	