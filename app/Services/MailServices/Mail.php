<?php

namespace App\Services\MailServices;

use Smarty;
use App\Handlers\Config;
use App\XManager;
use App\Helpers\i18n;
use App\Helpers\Helpers;
use App\Handlers\AuthHandler\Auth;

define('BASE_PATH', __DIR__ . '/../../../');

class Mail
{
  
    public static function getClient()
    {
		$Config = new Config();
        $driver = $Config->getConfig('mailDriver');
        switch ($driver) {
            case 1:
                return new SendGrid();
			case 2:
                return new Mailgun();
			case 3:
                return new SmtpMail();
			case 4:
                return new AmazonSes();	
            default:
                return new SendGrid();
        }
    }

  
    public static function genHtml($template, $ary)
    {
		$user = Auth::getUser();
		$lang = new i18n();
		$allconfig = (new Config)->getConfig();
        $smarty = new smarty();
		
        $smarty->settemplatedir(BASE_PATH . '/templates/'.((new Config())->getConfig('template') ? (new Config())->getConfig('template') : "default") ."/mail/");
        $smarty->setcompiledir(BASE_PATH . '/storage/smarty/compile/');
        $smarty->setcachedir(BASE_PATH . '/storage/smarty/cache/');
        $smarty->assign('user', $user);
        $smarty->assign('XManager', XManager::GlobalConfig());
		$smarty->assign('lang', $lang);
		$smarty->assign('Config', $allconfig);
		$smarty->assign('lang_cookie', Helpers::getCookie('lang'));
		
        foreach ($ary as $key => $value) {
            $smarty->assign($key, $value);
        }
        return $smarty->fetch($template);
    }


    public static function send($to, $subject, $template, $ary = [], $files = [])
    {
        //$text = self::genHtml($template, $ary);
        return self::getClient()->send($to, $subject, $template, $files);
    }
}
