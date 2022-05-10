<?php

namespace App\Services\MailServices;

use League\OAuth2\Client\Provider\Google;
use League\OAuth2\Client\Grant\RefreshToken;
use App\Handlers\Config;
use Slim\Http\Request;
use Slim\Http\Response;
use App\Helpers\i18n;

class GoogleToken
{
	public function Url(){
		$Config = new Config();
		$protocol = ($_SERVER['HTTPS'] == 'on') ? "https://" : "http://";
		$url = ($Config->getConfig('baseUrl') != "" ? $Config->getConfig('baseUrl') : $protocol.$_SERVER['HTTP_HOST']);
		return $url;
	}
	
	public function getGoogleToken($request, $response, $args)
	{	
		$lang = new i18n();
		$Config = new Config();
		$content = $request->getParsedBody();
		$clientId = isset($content['clientId']) ? $content['clientId'] : $Config->getConfig('googleclientid');
		$clientSecret = isset($content['clientSecret']) ? $content['clientSecret'] : $Config->getConfig('googlesecret');
		$redirectUri = $this->Url()."/getGoogleToken";
		
		if(!isset($clientId)){
			$res = ['ret' => 0, 'msg' =>  $lang->get("clientId_notset") ];
			$response->getBody()->write(json_encode($res));
			return $response;
		}
		
		if(!isset($clientSecret)){
			$res = ['ret' => 0, 'msg' =>  $lang->get("clientSecret_notset") ];
			$response->getBody()->write(json_encode($res));
			return $response;
		}
		
			$params = [
				'clientId' => $clientId,
				'clientSecret' => $clientSecret,
				'redirectUri' => $redirectUri,
				'accessType' => 'offline'
			];			
			
			$provider = new Google($params);
			if(!isset($_GET['code'])){
				$authUrl = $provider->getAuthorizationUrl(['prompt' => 'consent', 'access_type' => 'offline', 'scope' => [
					'https://mail.google.com/',
					'https://www.googleapis.com/auth/analytics',
				]]);
				$res = ['ret' => 1, 'url' =>  $authUrl ];
				$response->getBody()->write(json_encode($res));
				return $response;
			}else {
				$token = $provider->getAccessToken(
					'authorization_code',
					[
						'code' => $_GET['code']
					]
				);
				$Config->setConfig('googletoken',$token->getToken());			
				$Config->setConfig('googlerefreshtoken',$token->getRefreshToken());
				$Config->setConfig('googletokenexpire',$token->getExpires()-300);
				return  $response->withHeader('Location', '/admin/google')->withStatus(302);
			}
			return  $response->withHeader('Location', '/admin/google')->withStatus(302);
	}

	public function refreshGoogleToken()
	{
		$Config = new Config();
		if(
			$Config->getConfig('googleclientid') == null  || $Config->getConfig('googleclientid') == "" ||
			$Config->getConfig('googlesecret') == null || $Config->getConfig('googlesecret') == "" || 
			$Config->getConfig('googlerefreshtoken') == null || $Config->getConfig('googlerefreshtoken') == "" ||
			$Config->getConfig('googletokenexpire') == null || $Config->getConfig('googletokenexpire') == "" 
		)
		{
			return 0;
		}
		
		if(time() >= $Config->getConfig('googletokenexpire')){
			$provider = new Google([
				'clientId'     => $Config->getConfig('googleclientid'),
				'clientSecret' => $Config->getConfig('googlesecret'),
				'redirectUri'  => $this->Url()."/getGoogleToken"
			]);

			$grant = new RefreshToken();
			$token = $provider->getAccessToken($grant, ['refresh_token' => $Config->getConfig('googlerefreshtoken')]);

			$Config->setConfig('googletoken',$token);
			$Config->setConfig('googletokenexpire', time()+ 3200);
			return 2;
		}else {
			return 1;
		}
		return 0;
	}	
}