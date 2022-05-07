<?php

namespace App\Payments;
 
use App\Helpers\i18n;
use App\Handlers\Config;
use App\Http\Models\Package;
use App\Http\Models\TempOrder;
use App\Handlers\AuthHandler\Auth;
use App\Http\Controllers\BaseController;

class Balance extends BaseController
{
    public function buy($request, $response, $args)
    {
		$user = Auth::getUser();
		if (!$user->isLogin) {
            return $response->withStatus(302)->withHeader('Location', '/login');
        }
		
		$lang = new i18n();
		$Config = new Config();
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
			
		$user->money = bcsub($user->money, $price, 2);        
		$user->save();
		
		$item->create_date 	= time();
		$item->exrate	= $price;
		$item->status 	= 0;
		$item->type		= 11;
		$item->save();
						
		(new Purchase())->update($order_id);
		
		$res['ret'] = 1;			
		$res['msg'] = $lang->get('purchase');
		$res['url'] = (new Checkout())->Url().'/portal/success?orderid='.$order_id;
		$response->getBody()->write(json_encode($res));
		return  $response;	
    }
}	