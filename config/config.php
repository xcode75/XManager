<?php
$XManager['debug'] 			 = false;
$XManager['timeZone'] 	  	 = "Asia/Shanghai";   ## https://www.php.net/manual/en/timezones.php
$XManager['default_lang'] 	 = "zh-cn"; #默认语言 en , zh-cn
$XManager['admin_path']      = "/administrator"; #管理员登录路径,别用 /admin

// db_host|db_socket 二选一，若设置 db_socket 则 db_host 会被忽略，不用请留空。若数据库在本机上推荐用 db_socket。
// db_host 例: localhost（可解析的主机名）, 127.0.0.1（IP 地址）, 10.0.0.2:4406（含端口)
// db_socket 例：/var/run/mysqld/mysqld.sock（需使用绝对地址）

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
 