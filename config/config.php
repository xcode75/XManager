<?php
$xPanel['debug']        = false; 

$xPanel['timeZone'] 	= "PRC"; 
    
$xPanel['default_lang'] = "zh-cn"; #默认语 en英文 / zh-cn中文

$xPanel['db_driver']    = 'mysql';   
$xPanel['db_host']      = 'localhost';
$xPanel['db_socket']    = '';
$xPanel['db_database']  = 'xpanel';           
$xPanel['db_username']  = 'root';             
$xPanel['db_password']  = 'xpanel';           
$xPanel['db_charset']   = 'utf8';
$xPanel['db_collation'] = 'utf8_general_ci'; 
$xPanel['db_prefix']    = '';  


$xPanel['cdn_forwarded_ip'] = array('HTTP_X_FORWARDED_FOR', 'HTTP_ALI_CDN_REAL_IP', 'X-Real-IP', 'True-Client-Ip');
foreach ($xPanel['cdn_forwarded_ip'] as $cdn_forwarded_ip) {
    if (isset($_SERVER[$cdn_forwarded_ip])) {
        $list = explode(',', $_SERVER[$cdn_forwarded_ip]); 
        $_SERVER['REMOTE_ADDR'] = $list[0];
        break;
    }
}
 