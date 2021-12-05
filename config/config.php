<?php

$XManager['debug'] 			= true;

$XManager['timeZone'] 	  	 = "PRC"; 
$XManager['default_lang'] 	 = "en"; #en/zh-cn

$XManager['db_driver']    	 = 'mysql';   
$XManager['db_host']      	 = 'localhost';
$XManager['db_socket']    	 = '';
$XManager['db_database']  	 = 'manager';           
$XManager['db_username']  	 = 'root';             
$XManager['db_password']  	 = '';           
$XManager['db_charset']   	 = 'utf8mb4';
$XManager['db_collation'] 	 = 'utf8mb4_unicode_ci'; 
$XManager['db_prefix']    	 = '';  

$XManager['cdn_forwarded_ip'] = array('HTTP_X_FORWARDED_FOR', 'HTTP_ALI_CDN_REAL_IP', 'X-Real-IP', 'True-Client-Ip');
foreach ($XManager['cdn_forwarded_ip'] as $cdn_forwarded_ip) {
    if (isset($_SERVER[$cdn_forwarded_ip])) {
        $list = explode(',', $_SERVER[$cdn_forwarded_ip]); 
        $_SERVER['REMOTE_ADDR'] = $list[0];
        break;
    }
}
 