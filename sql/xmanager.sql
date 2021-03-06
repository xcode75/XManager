
CREATE TABLE `accounts` (
  `id` int(20) NOT NULL,
  `status` int(2) NOT NULL DEFAULT 0,
  `accountname` text NOT NULL,
  `accountid` text NOT NULL,
  `accountpassword` text NOT NULL,
  `allow_check` tinyint(1) NOT NULL DEFAULT 0,
  `accountlevel` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `alive_ip`
--

CREATE TABLE `alive_ip` (
  `id` bigint(20) NOT NULL,
  `nodeid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `username` varchar(250) DEFAULT NULL,
  `ip` text NOT NULL,
  `datetime` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `captcha`
--

CREATE TABLE `captcha` (
  `id` bigint(20) NOT NULL,
  `phrase` text DEFAULT NULL,
  `phraseid` int(5) NOT NULL,
  `expire` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cloudflare`
--

CREATE TABLE `cloudflare` (
  `id` int(11) NOT NULL,
  `domain` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_key` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zone_id` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `commission`
--

CREATE TABLE `commission` (
  `id` bigint(20) NOT NULL,
  `packageid` int(11) NOT NULL,
  `total` decimal(12,2) NOT NULL,
  `userid` bigint(20) NOT NULL,
  `ref_by` bigint(20) NOT NULL,
  `ref_get` decimal(12,2) NOT NULL,
  `datetime` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `config`
--

CREATE TABLE `config` (
  `name` varchar(255) NOT NULL,
  `value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `config`
--



INSERT INTO `config` (`name`, `value`) VALUES
('accessdenied', '0'),
('admin_telegram', ''),
('alipay', '0'),
('alipay_url', ''),
('allowaccess', '0'),
('allowed_phone_numbers', ''),
('api_key', 'Cs5PwEF4AwrY0XHQpyPx'),
('appName', 'XManager'),
('app_color', '#168ea1'),
('aws_key', ''),
('aws_region', ''),
('aws_secret', ''),
('aws_sender', ''),
('backup_email', ''),
('backup_password', ''),
('baseUrl', 'https://www.xyz.com'),
('binancepay_apikey', ''),
('binancepay_currency_code', 'USD'),
('binancepay_nonce', ''),
('binancepay_order_exp', '2'),
('binancepay_secretKey', ''),
('callback_addr', ''),
('captcha', '0'),
('chat_mode', '1'),
('cnrestrictions', ''),
('comm_pay_once', '1'),
('cp_currency_code', 'CNY'),
('cp_ipn_secret', ''),
('cp_merchant_id', ''),
('cp_private_key', ''),
('cp_public_key', ''),
('crisp_id', ''),
('cryptapi_currency_code', 'USD'),
('cryptapi_usdt_address', ''),
('default_currency', 'USD'),
('default_currency_symbol', '$'),
('dev_limit_type', '1'),
('disable_coupon', '1'),
('dsabletrafficlogs', '0'),
('easypay_apiurl', ''),
('easypay_app_id', ''),
('easypay_currency_code', 'CNY'),
('easypay_secret', ''),
('email_backup', '0'),
('email_loginverify', '1'),
('email_verify', '1'),
('enablepayments', '1'),
('enable_backup', '0'),
('enable_binancepay', '0'),
('enable_chat', '0'),
('enable_coinpayments', '0'),
('enable_cryptapi', '0'),
('enable_easypay', '0'),
('enable_easypay_alipay', '0'),
('enable_easypay_wechat', '0'),
('enable_epusdt', '0'),
('enable_f2fpay', '0'),
('enable_ga_tracking', '0'),
('enable_google_analytics', '0'),
('enable_invite', '0'),
('enable_kill', '1'),
('enable_mgate', '0'),
('enable_notification', '1'),
('enable_paymentwall', '0'),
('enable_paypal', '0'),
('enable_paystack', '0'),
('enable_rave', '0'),
('enable_rebate', '1'),
('enable_reg', '1'),
('enable_stripe', '0'),
('enable_stripe_alipay', '0'),
('enable_stripe_card', '1'),
('enable_stripe_wechat', '0'),
('enable_telegram', '0'),
('enable_theadpay', '0'),
('enable_token188', '0'),
('enable_vpay', '0'),
('enable_vpay_alipay', '0'),
('enable_vpay_wechat', '0'),
('enable_wellpay', '0'),
('epusdt_api', ''),
('epusdt_currency_code', 'USD'),
('epusdt_token', ''),
('exchange_apikey', ''),
('exchange_method', '1'),
('exp_reset', '1'),
('exp_reset_level', '1'),
('f2fpay_app_id', ''),
('f2fpay_currency_code', 'CNY'),
('f2fpay_private_key', ''),
('f2fpay_public_key', ''),
('ga_auth_loginverify', '1'),
('googleauth', NULL),
('googleclientid', ''),
('googleemail', ''),
('googlehost', 'smtp.gmail.com'),
('googleport', '587'),
('googlerefreshtoken', ''),
('googlesecret', ''),
('googletoken', ''),
('googletokenexpire', ''),
('google_analytics_id', ''),
('google_tracking_id', ''),
('h_captcha_key', ''),
('h_captcha_secrete', ''),
('jkstate', '1'),
('lastheart', NULL),
('lastpay', NULL),
('latesversion', 'v5.48'),
('latesversioncontent', ''),
('LoginLogs', '1'),
('loginverify', '0'),
('login_bind_ip', '0'),
('logo_path', '/uploads/X.png'),
('mailDriver', '3'),
('mailgun_domain', ''),
('mailgun_key', ''),
('mailgun_sender', ''),
('maintenance', '0'),
('mgate_api_url', ''),
('mgate_app_id', ''),
('mgate_app_secret', ''),
('mgate_currency_code', 'CNY'),
('mobile_loginverify', '0'),
('muKey', 'XManager'),
('paymentwall_alipay', '0'),
('paymentwall_card', '0'),
('paymentwall_country_code', 'CN'),
('paymentwall_currency_code', 'USD'),
('paymentwall_env', '0'),
('paymentwall_key', ''),
('paymentwall_secret', ''),
('paymentwall_unionpay', '0'),
('paymentwall_wechat', '0'),
('paymentwall_widget', 'p1_1'),
('payoutlimit', '100'),
('payoutmethod', '1,2,3'),
('paypal_client', ''),
('paypal_currency_code', 'USD'),
('paypal_mode', 'live'),
('paypal_secret', ''),
('paystack_card', '0'),
('paystack_currency_code', 'USD'),
('paystack_mobile_currency_code', 'GHS'),
('paystack_mobile_money', '0'),
('paystack_secret', ''),
('pay_bal', '0'),
('pay_logo', '0'),
('pwdMethod', 'sha256'),
('rave_card', '0'),
('rave_currency_code', 'USD'),
('rave_mobile_currency_code', 'GHS'),
('rave_mobile_money', '0'),
('rave_secret', ''),
('rebate', '60'),
('rebate_info', ''),
('reg_connector', '1'),
('reg_group', '1'),
('reg_level', '3'),
('reg_mode', '1'),
('reg_speed', '1024'),
('reg_traffic', '1'),
('reg_traffic_exp', '1'),
('rememberme', '7'),
('restrictions', ''),
('restrict_email', '0'),
('restrict_email_list', '@gmail.com,@protonmail.com,@ymail.com,@hotmail.co.uk,@hotmail.com,@qq.com,@outlook.com,@163.com,@126.com,@live.com,@msn.com,@yeah.net,@foxmail.com'),
('salt', ''),
('sendgrid_key', ''),
('sendgrid_name', 'XManager'),
('sendgrid_sender', 'no-reply@xyz.com'),
('send_order_email', '0'),
('ShareAccounts', '0'),
('site_key', '1145141919810'),
('smsDriver', '0'),
('smtp_debug', NULL),
('smtp_host', 'smtp.sendgrid.net'),
('smtp_method', '0'),
('smtp_name', 'XManager'),
('smtp_password', ''),
('smtp_port', '587'),
('smtp_sender', 'no-reply@xyz.com'),
('smtp_ssl', '1'),
('smtp_username', ''),
('statsupdate', '10'),
('stripe_currency_code', 'USD'),
('stripe_key', ''),
('stripe_webhook', ''),
('subUrl', 'https://www.xyz.com/link/'),
('sub_addr', 'https://www.xyz.com/link/'),
('tawkchat_api', ''),
('tawkchat_id', ''),
('telegram_backup', '0'),
('telegram_bot', ''),
('telegram_chatid', ''),
('telegram_gid', ''),
('telegram_group_link', ''),
('telegram_group_quiet', '1'),
('telegram_loginverify', '1'),
('telegram_request_token', ''),
('telegram_token', ''),
('template', 'default'),
('theadpay_currency_code', 'CNY'),
('theadpay_key', ''),
('theadpay_mchid', ''),
('theadpay_url', ''),
('token188_currency_code', 'CNY'),
('token188_key', ''),
('token188_mchid', ''),
('token188_url', 'https://api.token188.com/utg/pay/address'),
('trafficexpnotify', '0'),
('trafficexpnotifydays', '1,3'),
('trafficusednotify', '0'),
('trafficusednotifylimit', '500'),
('user_currecy_switch', '0'),
('user_language_select', '1'),
('user_verify_email', '0'),
('version', 'v5.48'),
('ViewLogs', '0'),
('vpay_currency_code', 'CNY'),
('vpay_order_exp', '10'),
('webapisafe', '0'),
('wechat_url', ''),
('wellpay_app_id', ''),
('wellpay_app_secret', ''),
('wellpay_serverid', ''),
('wellpay_currency_code', 'CNY');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(8) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `iso3` char(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numeric_code` char(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iso2` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phonecode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `capital` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_symbol` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tld` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `native` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `region` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subregion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timezones` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `translations` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `emoji` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emojiU` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `flag` tinyint(1) NOT NULL DEFAULT 1,
  `wikiDataId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Rapid API GeoDB Cities'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `iso3`, `numeric_code`, `iso2`, `phonecode`, `capital`, `currency`, `currency_symbol`, `tld`, `native`, `region`, `subregion`, `timezones`, `translations`, `latitude`, `longitude`, `emoji`, `emojiU`, `created_at`, `updated_at`, `flag`, `wikiDataId`) VALUES
(1, 'Afghanistan', 'AFG', '004', 'AF', '93', 'Kabul', 'AFN', '??', '.af', '??????????????????', 'Asia', 'Southern Asia', '[{\"zoneName\":\"Asia/Kabul\",\"gmtOffset\":16200,\"gmtOffsetName\":\"UTC+04:30\",\"abbreviation\":\"AFT\",\"tzName\":\"Afghanistan Time\"}]', '{\"kr\":\"??????????????????\",\"br\":\"Afeganist??o\",\"pt\":\"Afeganist??o\",\"nl\":\"Afghanistan\",\"hr\":\"Afganistan\",\"fa\":\"??????????????????\",\"de\":\"Afghanistan\",\"es\":\"Afganist??n\",\"fr\":\"Afghanistan\",\"ja\":\"?????????????????????\",\"it\":\"Afghanistan\",\"cn\":\"?????????\"}', '33.00000000', '65.00000000', '????????', 'U+1F1E6 U+1F1EB', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q889'),
(2, 'Aland Islands', 'ALA', '248', 'AX', '35818', 'Mariehamn', 'EUR', '???', '.ax', '??land', 'Europe', 'Northern Europe', '[{\"zoneName\":\"Europe/Mariehamn\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"}]', '{\"kr\":\"????????? ??????\",\"br\":\"Ilhas de Aland\",\"pt\":\"Ilhas de Aland\",\"nl\":\"??landeilanden\",\"hr\":\"??landski otoci\",\"fa\":\"?????????? ????????\",\"de\":\"??land\",\"es\":\"Alandia\",\"fr\":\"??land\",\"ja\":\"?????????????????????\",\"it\":\"Isole Aland\",\"cn\":\"????????????\"}', '60.11666700', '19.90000000', '????????', 'U+1F1E6 U+1F1FD', '2018-07-20 20:11:03', '2021-12-04 08:17:27', 1, NULL),
(3, 'Albania', 'ALB', '008', 'AL', '355', 'Tirana', 'ALL', 'Lek', '.al', 'Shqip??ria', 'Europe', 'Southern Europe', '[{\"zoneName\":\"Europe/Tirane\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Alb??nia\",\"pt\":\"Alb??nia\",\"nl\":\"Albani??\",\"hr\":\"Albanija\",\"fa\":\"????????????\",\"de\":\"Albanien\",\"es\":\"Albania\",\"fr\":\"Albanie\",\"ja\":\"???????????????\",\"it\":\"Albania\",\"cn\":\"???????????????\"}', '41.00000000', '20.00000000', '????????', 'U+1F1E6 U+1F1F1', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q222'),
(4, 'Algeria', 'DZA', '012', 'DZ', '213', 'Algiers', 'DZD', '????', '.dz', '??????????????', 'Africa', 'Northern Africa', '[{\"zoneName\":\"Africa/Algiers\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Arg??lia\",\"pt\":\"Arg??lia\",\"nl\":\"Algerije\",\"hr\":\"Al??ir\",\"fa\":\"??????????????\",\"de\":\"Algerien\",\"es\":\"Argelia\",\"fr\":\"Alg??rie\",\"ja\":\"??????????????????\",\"it\":\"Algeria\",\"cn\":\"???????????????\"}', '28.00000000', '3.00000000', '????????', 'U+1F1E9 U+1F1FF', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q262'),
(5, 'American Samoa', 'ASM', '016', 'AS', '1684', 'Pago Pago', 'USD', '$', '.as', 'American Samoa', 'Oceania', 'Polynesia', '[{\"zoneName\":\"Pacific/Pago_Pago\",\"gmtOffset\":-39600,\"gmtOffsetName\":\"UTC-11:00\",\"abbreviation\":\"SST\",\"tzName\":\"Samoa Standard Time\"}]', '{\"kr\":\"?????????????????????\",\"br\":\"Samoa Americana\",\"pt\":\"Samoa Americana\",\"nl\":\"Amerikaans Samoa\",\"hr\":\"Ameri??ka Samoa\",\"fa\":\"???????????? ????????????\",\"de\":\"Amerikanisch-Samoa\",\"es\":\"Samoa Americana\",\"fr\":\"Samoa am??ricaines\",\"ja\":\"????????????????????????\",\"it\":\"Samoa Americane\",\"cn\":\"???????????????\"}', '-14.33333333', '-170.00000000', '????????', 'U+1F1E6 U+1F1F8', '2018-07-20 20:11:03', '2021-12-04 08:17:14', 1, NULL),
(6, 'Andorra', 'AND', '020', 'AD', '376', 'Andorra la Vella', 'EUR', '???', '.ad', 'Andorra', 'Europe', 'Southern Europe', '[{\"zoneName\":\"Europe/Andorra\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Andorra\",\"pt\":\"Andorra\",\"nl\":\"Andorra\",\"hr\":\"Andora\",\"fa\":\"????????????\",\"de\":\"Andorra\",\"es\":\"Andorra\",\"fr\":\"Andorre\",\"ja\":\"????????????\",\"it\":\"Andorra\",\"cn\":\"?????????\"}', '42.50000000', '1.50000000', '????????', 'U+1F1E6 U+1F1E9', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q228'),
(7, 'Angola', 'AGO', '024', 'AO', '244', 'Luanda', 'AOA', 'Kz', '.ao', 'Angola', 'Africa', 'Middle Africa', '[{\"zoneName\":\"Africa/Luanda\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"WAT\",\"tzName\":\"West Africa Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Angola\",\"pt\":\"Angola\",\"nl\":\"Angola\",\"hr\":\"Angola\",\"fa\":\"????????????\",\"de\":\"Angola\",\"es\":\"Angola\",\"fr\":\"Angola\",\"ja\":\"????????????\",\"it\":\"Angola\",\"cn\":\"?????????\"}', '-12.50000000', '18.50000000', '????????', 'U+1F1E6 U+1F1F4', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q916'),
(8, 'Anguilla', 'AIA', '660', 'AI', '1264', 'The Valley', 'XCD', '$', '.ai', 'Anguilla', 'Americas', 'Caribbean', '[{\"zoneName\":\"America/Anguilla\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Anguila\",\"pt\":\"Anguila\",\"nl\":\"Anguilla\",\"hr\":\"Angvila\",\"fa\":\"??????????????\",\"de\":\"Anguilla\",\"es\":\"Anguilla\",\"fr\":\"Anguilla\",\"ja\":\"????????????\",\"it\":\"Anguilla\",\"cn\":\"?????????\"}', '18.25000000', '-63.16666666', '????????', 'U+1F1E6 U+1F1EE', '2018-07-20 20:11:03', '2021-12-04 08:17:08', 1, NULL),
(9, 'Antarctica', 'ATA', '010', 'AQ', '672', '', 'AAD', '$', '.aq', 'Antarctica', 'Polar', '', '[{\"zoneName\":\"Antarctica/Casey\",\"gmtOffset\":39600,\"gmtOffsetName\":\"UTC+11:00\",\"abbreviation\":\"AWST\",\"tzName\":\"Australian Western Standard Time\"},{\"zoneName\":\"Antarctica/Davis\",\"gmtOffset\":25200,\"gmtOffsetName\":\"UTC+07:00\",\"abbreviation\":\"DAVT\",\"tzName\":\"Davis Time\"},{\"zoneName\":\"Antarctica/DumontDUrville\",\"gmtOffset\":36000,\"gmtOffsetName\":\"UTC+10:00\",\"abbreviation\":\"DDUT\",\"tzName\":\"Dumont d\'Urville Time\"},{\"zoneName\":\"Antarctica/Mawson\",\"gmtOffset\":18000,\"gmtOffsetName\":\"UTC+05:00\",\"abbreviation\":\"MAWT\",\"tzName\":\"Mawson Station Time\"},{\"zoneName\":\"Antarctica/McMurdo\",\"gmtOffset\":46800,\"gmtOffsetName\":\"UTC+13:00\",\"abbreviation\":\"NZDT\",\"tzName\":\"New Zealand Daylight Time\"},{\"zoneName\":\"Antarctica/Palmer\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"CLST\",\"tzName\":\"Chile Summer Time\"},{\"zoneName\":\"Antarctica/Rothera\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"ROTT\",\"tzName\":\"Rothera Research Station Time\"},{\"zoneName\":\"Antarctica/Syowa\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"SYOT\",\"tzName\":\"Showa Station Time\"},{\"zoneName\":\"Antarctica/Troll\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC??00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"},{\"zoneName\":\"Antarctica/Vostok\",\"gmtOffset\":21600,\"gmtOffsetName\":\"UTC+06:00\",\"abbreviation\":\"VOST\",\"tzName\":\"Vostok Station Time\"}]', '{\"kr\":\"??????\",\"br\":\"Ant??rtida\",\"pt\":\"Ant??rctida\",\"nl\":\"Antarctica\",\"hr\":\"Antarktika\",\"fa\":\"??????????????\",\"de\":\"Antarktika\",\"es\":\"Ant??rtida\",\"fr\":\"Antarctique\",\"ja\":\"????????????\",\"it\":\"Antartide\",\"cn\":\"?????????\"}', '-74.65000000', '4.48000000', '????????', 'U+1F1E6 U+1F1F6', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, NULL),
(10, 'Antigua And Barbuda', 'ATG', '028', 'AG', '1268', 'St. John\'s', 'XCD', '$', '.ag', 'Antigua and Barbuda', 'Americas', 'Caribbean', '[{\"zoneName\":\"America/Antigua\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]', '{\"kr\":\"????????? ?????????\",\"br\":\"Ant??gua e Barbuda\",\"pt\":\"Ant??gua e Barbuda\",\"nl\":\"Antigua en Barbuda\",\"hr\":\"Antigva i Barbuda\",\"fa\":\"?????????????? ?? ??????????????\",\"de\":\"Antigua und Barbuda\",\"es\":\"Antigua y Barbuda\",\"fr\":\"Antigua-et-Barbuda\",\"ja\":\"????????????????????????????????????\",\"it\":\"Antigua e Barbuda\",\"cn\":\"?????????????????????\"}', '17.05000000', '-61.80000000', '????????', 'U+1F1E6 U+1F1EC', '2018-07-20 20:11:03', '2021-12-04 08:16:59', 1, 'Q781'),
(11, 'Argentina', 'ARG', '032', 'AR', '54', 'Buenos Aires', 'ARS', '$', '.ar', 'Argentina', 'Americas', 'South America', '[{\"zoneName\":\"America/Argentina/Buenos_Aires\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"ART\",\"tzName\":\"Argentina Time\"},{\"zoneName\":\"America/Argentina/Catamarca\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"ART\",\"tzName\":\"Argentina Time\"},{\"zoneName\":\"America/Argentina/Cordoba\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"ART\",\"tzName\":\"Argentina Time\"},{\"zoneName\":\"America/Argentina/Jujuy\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"ART\",\"tzName\":\"Argentina Time\"},{\"zoneName\":\"America/Argentina/La_Rioja\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"ART\",\"tzName\":\"Argentina Time\"},{\"zoneName\":\"America/Argentina/Mendoza\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"ART\",\"tzName\":\"Argentina Time\"},{\"zoneName\":\"America/Argentina/Rio_Gallegos\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"ART\",\"tzName\":\"Argentina Time\"},{\"zoneName\":\"America/Argentina/Salta\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"ART\",\"tzName\":\"Argentina Time\"},{\"zoneName\":\"America/Argentina/San_Juan\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"ART\",\"tzName\":\"Argentina Time\"},{\"zoneName\":\"America/Argentina/San_Luis\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"ART\",\"tzName\":\"Argentina Time\"},{\"zoneName\":\"America/Argentina/Tucuman\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"ART\",\"tzName\":\"Argentina Time\"},{\"zoneName\":\"America/Argentina/Ushuaia\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"ART\",\"tzName\":\"Argentina Time\"}]', '{\"kr\":\"???????????????\",\"br\":\"Argentina\",\"pt\":\"Argentina\",\"nl\":\"Argentini??\",\"hr\":\"Argentina\",\"fa\":\"????????????????\",\"de\":\"Argentinien\",\"es\":\"Argentina\",\"fr\":\"Argentine\",\"ja\":\"??????????????????\",\"it\":\"Argentina\",\"cn\":\"?????????\"}', '-34.00000000', '-64.00000000', '????????', 'U+1F1E6 U+1F1F7', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q414'),
(12, 'Armenia', 'ARM', '051', 'AM', '374', 'Yerevan', 'AMD', '??', '.am', '????????????????', 'Asia', 'Western Asia', '[{\"zoneName\":\"Asia/Yerevan\",\"gmtOffset\":14400,\"gmtOffsetName\":\"UTC+04:00\",\"abbreviation\":\"AMT\",\"tzName\":\"Armenia Time\"}]', '{\"kr\":\"???????????????\",\"br\":\"Arm??nia\",\"pt\":\"Arm??nia\",\"nl\":\"Armeni??\",\"hr\":\"Armenija\",\"fa\":\"????????????????\",\"de\":\"Armenien\",\"es\":\"Armenia\",\"fr\":\"Arm??nie\",\"ja\":\"???????????????\",\"it\":\"Armenia\",\"cn\":\"????????????\"}', '40.00000000', '45.00000000', '????????', 'U+1F1E6 U+1F1F2', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q399'),
(13, 'Aruba', 'ABW', '533', 'AW', '297', 'Oranjestad', 'AWG', '??', '.aw', 'Aruba', 'Americas', 'Caribbean', '[{\"zoneName\":\"America/Aruba\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Aruba\",\"pt\":\"Aruba\",\"nl\":\"Aruba\",\"hr\":\"Aruba\",\"fa\":\"??????????\",\"de\":\"Aruba\",\"es\":\"Aruba\",\"fr\":\"Aruba\",\"ja\":\"?????????\",\"it\":\"Aruba\",\"cn\":\"?????????\"}', '12.50000000', '-69.96666666', '????????', 'U+1F1E6 U+1F1FC', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, NULL),
(14, 'Australia', 'AUS', '036', 'AU', '61', 'Canberra', 'AUD', '$', '.au', 'Australia', 'Oceania', 'Australia and New Zealand', '[{\"zoneName\":\"Antarctica/Macquarie\",\"gmtOffset\":39600,\"gmtOffsetName\":\"UTC+11:00\",\"abbreviation\":\"MIST\",\"tzName\":\"Macquarie Island Station Time\"},{\"zoneName\":\"Australia/Adelaide\",\"gmtOffset\":37800,\"gmtOffsetName\":\"UTC+10:30\",\"abbreviation\":\"ACDT\",\"tzName\":\"Australian Central Daylight Saving Time\"},{\"zoneName\":\"Australia/Brisbane\",\"gmtOffset\":36000,\"gmtOffsetName\":\"UTC+10:00\",\"abbreviation\":\"AEST\",\"tzName\":\"Australian Eastern Standard Time\"},{\"zoneName\":\"Australia/Broken_Hill\",\"gmtOffset\":37800,\"gmtOffsetName\":\"UTC+10:30\",\"abbreviation\":\"ACDT\",\"tzName\":\"Australian Central Daylight Saving Time\"},{\"zoneName\":\"Australia/Currie\",\"gmtOffset\":39600,\"gmtOffsetName\":\"UTC+11:00\",\"abbreviation\":\"AEDT\",\"tzName\":\"Australian Eastern Daylight Saving Time\"},{\"zoneName\":\"Australia/Darwin\",\"gmtOffset\":34200,\"gmtOffsetName\":\"UTC+09:30\",\"abbreviation\":\"ACST\",\"tzName\":\"Australian Central Standard Time\"},{\"zoneName\":\"Australia/Eucla\",\"gmtOffset\":31500,\"gmtOffsetName\":\"UTC+08:45\",\"abbreviation\":\"ACWST\",\"tzName\":\"Australian Central Western Standard Time (Unofficial)\"},{\"zoneName\":\"Australia/Hobart\",\"gmtOffset\":39600,\"gmtOffsetName\":\"UTC+11:00\",\"abbreviation\":\"AEDT\",\"tzName\":\"Australian Eastern Daylight Saving Time\"},{\"zoneName\":\"Australia/Lindeman\",\"gmtOffset\":36000,\"gmtOffsetName\":\"UTC+10:00\",\"abbreviation\":\"AEST\",\"tzName\":\"Australian Eastern Standard Time\"},{\"zoneName\":\"Australia/Lord_Howe\",\"gmtOffset\":39600,\"gmtOffsetName\":\"UTC+11:00\",\"abbreviation\":\"LHST\",\"tzName\":\"Lord Howe Summer Time\"},{\"zoneName\":\"Australia/Melbourne\",\"gmtOffset\":39600,\"gmtOffsetName\":\"UTC+11:00\",\"abbreviation\":\"AEDT\",\"tzName\":\"Australian Eastern Daylight Saving Time\"},{\"zoneName\":\"Australia/Perth\",\"gmtOffset\":28800,\"gmtOffsetName\":\"UTC+08:00\",\"abbreviation\":\"AWST\",\"tzName\":\"Australian Western Standard Time\"},{\"zoneName\":\"Australia/Sydney\",\"gmtOffset\":39600,\"gmtOffsetName\":\"UTC+11:00\",\"abbreviation\":\"AEDT\",\"tzName\":\"Australian Eastern Daylight Saving Time\"}]', '{\"kr\":\"??????\",\"br\":\"Austr??lia\",\"pt\":\"Austr??lia\",\"nl\":\"Australi??\",\"hr\":\"Australija\",\"fa\":\"????????????????\",\"de\":\"Australien\",\"es\":\"Australia\",\"fr\":\"Australie\",\"ja\":\"?????????????????????\",\"it\":\"Australia\",\"cn\":\"????????????\"}', '-27.00000000', '133.00000000', '????????', 'U+1F1E6 U+1F1FA', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q408'),
(15, 'Austria', 'AUT', '040', 'AT', '43', 'Vienna', 'EUR', '???', '.at', '??sterreich', 'Europe', 'Western Europe', '[{\"zoneName\":\"Europe/Vienna\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"???????????????\",\"br\":\"??ustria\",\"pt\":\"??ustria\",\"nl\":\"Oostenrijk\",\"hr\":\"Austrija\",\"fa\":\"??????????\",\"de\":\"??sterreich\",\"es\":\"Austria\",\"fr\":\"Autriche\",\"ja\":\"??????????????????\",\"it\":\"Austria\",\"cn\":\"?????????\"}', '47.33333333', '13.33333333', '????????', 'U+1F1E6 U+1F1F9', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q40'),
(16, 'Azerbaijan', 'AZE', '031', 'AZ', '994', 'Baku', 'AZN', 'm', '.az', 'Az??rbaycan', 'Asia', 'Western Asia', '[{\"zoneName\":\"Asia/Baku\",\"gmtOffset\":14400,\"gmtOffsetName\":\"UTC+04:00\",\"abbreviation\":\"AZT\",\"tzName\":\"Azerbaijan Time\"}]', '{\"kr\":\"??????????????????\",\"br\":\"Azerbaij??o\",\"pt\":\"Azerbaij??o\",\"nl\":\"Azerbeidzjan\",\"hr\":\"Azerbajd??an\",\"fa\":\"??????????????????\",\"de\":\"Aserbaidschan\",\"es\":\"Azerbaiy??n\",\"fr\":\"Azerba??djan\",\"ja\":\"????????????????????????\",\"it\":\"Azerbaijan\",\"cn\":\"????????????\"}', '40.50000000', '47.50000000', '????????', 'U+1F1E6 U+1F1FF', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q227'),
(17, 'Bahamas The', 'BHS', '044', 'BS', '1242', 'Nassau', 'BSD', 'B$', '.bs', 'Bahamas', 'Americas', 'Caribbean', '[{\"zoneName\":\"America/Nassau\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America)\"}]', '{\"kr\":\"?????????\",\"br\":\"Bahamas\",\"pt\":\"Baamas\",\"nl\":\"Bahama???s\",\"hr\":\"Bahami\",\"fa\":\"????????????\",\"de\":\"Bahamas\",\"es\":\"Bahamas\",\"fr\":\"Bahamas\",\"ja\":\"?????????\",\"it\":\"Bahamas\",\"cn\":\"?????????\"}', '24.25000000', '-76.00000000', '????????', 'U+1F1E7 U+1F1F8', '2018-07-20 20:11:03', '2021-12-04 08:16:48', 1, 'Q778'),
(18, 'Bahrain', 'BHR', '048', 'BH', '973', 'Manama', 'BHD', '.??.??', '.bh', '?????????????????', 'Asia', 'Western Asia', '[{\"zoneName\":\"Asia/Bahrain\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"AST\",\"tzName\":\"Arabia Standard Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Bahrein\",\"pt\":\"Bar??m\",\"nl\":\"Bahrein\",\"hr\":\"Bahrein\",\"fa\":\"??????????\",\"de\":\"Bahrain\",\"es\":\"Bahrein\",\"fr\":\"Bahre??n\",\"ja\":\"???????????????\",\"it\":\"Bahrein\",\"cn\":\"??????\"}', '26.00000000', '50.55000000', '????????', 'U+1F1E7 U+1F1ED', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q398'),
(19, 'Bangladesh', 'BGD', '050', 'BD', '880', 'Dhaka', 'BDT', '???', '.bd', 'Bangladesh', 'Asia', 'Southern Asia', '[{\"zoneName\":\"Asia/Dhaka\",\"gmtOffset\":21600,\"gmtOffsetName\":\"UTC+06:00\",\"abbreviation\":\"BDT\",\"tzName\":\"Bangladesh Standard Time\"}]', '{\"kr\":\"???????????????\",\"br\":\"Bangladesh\",\"pt\":\"Bangladeche\",\"nl\":\"Bangladesh\",\"hr\":\"Banglade??\",\"fa\":\"??????????????\",\"de\":\"Bangladesch\",\"es\":\"Bangladesh\",\"fr\":\"Bangladesh\",\"ja\":\"?????????????????????\",\"it\":\"Bangladesh\",\"cn\":\"?????????\"}', '24.00000000', '90.00000000', '????????', 'U+1F1E7 U+1F1E9', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q902'),
(20, 'Barbados', 'BRB', '052', 'BB', '1246', 'Bridgetown', 'BBD', 'Bds$', '.bb', 'Barbados', 'Americas', 'Caribbean', '[{\"zoneName\":\"America/Barbados\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]', '{\"kr\":\"???????????????\",\"br\":\"Barbados\",\"pt\":\"Barbados\",\"nl\":\"Barbados\",\"hr\":\"Barbados\",\"fa\":\"????????????????\",\"de\":\"Barbados\",\"es\":\"Barbados\",\"fr\":\"Barbade\",\"ja\":\"???????????????\",\"it\":\"Barbados\",\"cn\":\"????????????\"}', '13.16666666', '-59.53333333', '????????', 'U+1F1E7 U+1F1E7', '2018-07-20 20:11:03', '2021-12-04 08:16:34', 1, 'Q244'),
(21, 'Belarus', 'BLR', '112', 'BY', '375', 'Minsk', 'BYN', 'Br', '.by', '??????????????????', 'Europe', 'Eastern Europe', '[{\"zoneName\":\"Europe/Minsk\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"MSK\",\"tzName\":\"Moscow Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Bielorr??ssia\",\"pt\":\"Bielorr??ssia\",\"nl\":\"Wit-Rusland\",\"hr\":\"Bjelorusija\",\"fa\":\"????????????\",\"de\":\"Wei??russland\",\"es\":\"Bielorrusia\",\"fr\":\"Bi??lorussie\",\"ja\":\"???????????????\",\"it\":\"Bielorussia\",\"cn\":\"????????????\"}', '53.00000000', '28.00000000', '????????', 'U+1F1E7 U+1F1FE', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q184'),
(22, 'Belgium', 'BEL', '056', 'BE', '32', 'Brussels', 'EUR', '???', '.be', 'Belgi??', 'Europe', 'Western Europe', '[{\"zoneName\":\"Europe/Brussels\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"?????????\",\"br\":\"B??lgica\",\"pt\":\"B??lgica\",\"nl\":\"Belgi??\",\"hr\":\"Belgija\",\"fa\":\"??????????\",\"de\":\"Belgien\",\"es\":\"B??lgica\",\"fr\":\"Belgique\",\"ja\":\"????????????\",\"it\":\"Belgio\",\"cn\":\"?????????\"}', '50.83333333', '4.00000000', '????????', 'U+1F1E7 U+1F1EA', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q31'),
(23, 'Belize', 'BLZ', '084', 'BZ', '501', 'Belmopan', 'BZD', '$', '.bz', 'Belize', 'Americas', 'Central America', '[{\"zoneName\":\"America/Belize\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America)\"}]', '{\"kr\":\"?????????\",\"br\":\"Belize\",\"pt\":\"Belize\",\"nl\":\"Belize\",\"hr\":\"Belize\",\"fa\":\"????????\",\"de\":\"Belize\",\"es\":\"Belice\",\"fr\":\"Belize\",\"ja\":\"????????????\",\"it\":\"Belize\",\"cn\":\"?????????\"}', '17.25000000', '-88.75000000', '????????', 'U+1F1E7 U+1F1FF', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q242'),
(24, 'Benin', 'BEN', '204', 'BJ', '229', 'Porto-Novo', 'XOF', 'CFA', '.bj', 'B??nin', 'Africa', 'Western Africa', '[{\"zoneName\":\"Africa/Porto-Novo\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"WAT\",\"tzName\":\"West Africa Time\"}]', '{\"kr\":\"??????\",\"br\":\"Benin\",\"pt\":\"Benim\",\"nl\":\"Benin\",\"hr\":\"Benin\",\"fa\":\"????????\",\"de\":\"Benin\",\"es\":\"Ben??n\",\"fr\":\"B??nin\",\"ja\":\"?????????\",\"it\":\"Benin\",\"cn\":\"??????\"}', '9.50000000', '2.25000000', '????????', 'U+1F1E7 U+1F1EF', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q962'),
(25, 'Bermuda', 'BMU', '060', 'BM', '1441', 'Hamilton', 'BMD', '$', '.bm', 'Bermuda', 'Americas', 'Northern America', '[{\"zoneName\":\"Atlantic/Bermuda\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Bermudas\",\"pt\":\"Bermudas\",\"nl\":\"Bermuda\",\"hr\":\"Bermudi\",\"fa\":\"????????????\",\"de\":\"Bermuda\",\"es\":\"Bermudas\",\"fr\":\"Bermudes\",\"ja\":\"???????????????\",\"it\":\"Bermuda\",\"cn\":\"?????????\"}', '32.33333333', '-64.75000000', '????????', 'U+1F1E7 U+1F1F2', '2018-07-20 20:11:03', '2021-12-04 08:16:21', 1, NULL),
(26, 'Bhutan', 'BTN', '064', 'BT', '975', 'Thimphu', 'BTN', 'Nu.', '.bt', '??brug-yul', 'Asia', 'Southern Asia', '[{\"zoneName\":\"Asia/Thimphu\",\"gmtOffset\":21600,\"gmtOffsetName\":\"UTC+06:00\",\"abbreviation\":\"BTT\",\"tzName\":\"Bhutan Time\"}]', '{\"kr\":\"??????\",\"br\":\"But??o\",\"pt\":\"But??o\",\"nl\":\"Bhutan\",\"hr\":\"Butan\",\"fa\":\"??????????\",\"de\":\"Bhutan\",\"es\":\"But??n\",\"fr\":\"Bhoutan\",\"ja\":\"????????????\",\"it\":\"Bhutan\",\"cn\":\"??????\"}', '27.50000000', '90.50000000', '????????', 'U+1F1E7 U+1F1F9', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q917'),
(27, 'Bolivia', 'BOL', '068', 'BO', '591', 'Sucre', 'BOB', 'Bs.', '.bo', 'Bolivia', 'Americas', 'South America', '[{\"zoneName\":\"America/La_Paz\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"BOT\",\"tzName\":\"Bolivia Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Bol??via\",\"pt\":\"Bol??via\",\"nl\":\"Bolivia\",\"hr\":\"Bolivija\",\"fa\":\"????????????\",\"de\":\"Bolivien\",\"es\":\"Bolivia\",\"fr\":\"Bolivie\",\"ja\":\"????????????????????????\",\"it\":\"Bolivia\",\"cn\":\"????????????\"}', '-17.00000000', '-65.00000000', '????????', 'U+1F1E7 U+1F1F4', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q750'),
(28, 'Bosnia and Herzegovina', 'BIH', '070', 'BA', '387', 'Sarajevo', 'BAM', 'KM', '.ba', 'Bosna i Hercegovina', 'Europe', 'Southern Europe', '[{\"zoneName\":\"Europe/Sarajevo\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"???????????? ??????????????????\",\"br\":\"B??snia e Herzegovina\",\"pt\":\"B??snia e Herzegovina\",\"nl\":\"Bosni?? en Herzegovina\",\"hr\":\"Bosna i Hercegovina\",\"fa\":\"?????????? ?? ??????????????\",\"de\":\"Bosnien und Herzegowina\",\"es\":\"Bosnia y Herzegovina\",\"fr\":\"Bosnie-Herz??govine\",\"ja\":\"????????????????????????????????????\",\"it\":\"Bosnia ed Erzegovina\",\"cn\":\"??????????????????????????????\"}', '44.00000000', '18.00000000', '????????', 'U+1F1E7 U+1F1E6', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q225'),
(29, 'Botswana', 'BWA', '072', 'BW', '267', 'Gaborone', 'BWP', 'P', '.bw', 'Botswana', 'Africa', 'Southern Africa', '[{\"zoneName\":\"Africa/Gaborone\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"CAT\",\"tzName\":\"Central Africa Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Botsuana\",\"pt\":\"Botsuana\",\"nl\":\"Botswana\",\"hr\":\"Bocvana\",\"fa\":\"????????????????\",\"de\":\"Botswana\",\"es\":\"Botswana\",\"fr\":\"Botswana\",\"ja\":\"????????????\",\"it\":\"Botswana\",\"cn\":\"????????????\"}', '-22.00000000', '24.00000000', '????????', 'U+1F1E7 U+1F1FC', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q963'),
(30, 'Bouvet Island', 'BVT', '074', 'BV', '0055', '', 'NOK', 'kr', '.bv', 'Bouvet??ya', '', '', '[{\"zoneName\":\"Europe/Oslo\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"?????? ???\",\"br\":\"Ilha Bouvet\",\"pt\":\"Ilha Bouvet\",\"nl\":\"Bouveteiland\",\"hr\":\"Otok Bouvet\",\"fa\":\"?????????? ????????\",\"de\":\"Bouvetinsel\",\"es\":\"Isla Bouvet\",\"fr\":\"??le Bouvet\",\"ja\":\"????????????\",\"it\":\"Isola Bouvet\",\"cn\":\"?????????\"}', '-54.43333333', '3.40000000', '????????', 'U+1F1E7 U+1F1FB', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, NULL),
(31, 'Brazil', 'BRA', '076', 'BR', '55', 'Brasilia', 'BRL', 'R$', '.br', 'Brasil', 'Americas', 'South America', '[{\"zoneName\":\"America/Araguaina\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"BRT\",\"tzName\":\"Bras??lia Time\"},{\"zoneName\":\"America/Bahia\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"BRT\",\"tzName\":\"Bras??lia Time\"},{\"zoneName\":\"America/Belem\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"BRT\",\"tzName\":\"Bras??lia Time\"},{\"zoneName\":\"America/Boa_Vista\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AMT\",\"tzName\":\"Amazon Time (Brazil)[3\"},{\"zoneName\":\"America/Campo_Grande\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AMT\",\"tzName\":\"Amazon Time (Brazil)[3\"},{\"zoneName\":\"America/Cuiaba\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"BRT\",\"tzName\":\"Brasilia Time\"},{\"zoneName\":\"America/Eirunepe\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"ACT\",\"tzName\":\"Acre Time\"},{\"zoneName\":\"America/Fortaleza\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"BRT\",\"tzName\":\"Bras??lia Time\"},{\"zoneName\":\"America/Maceio\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"BRT\",\"tzName\":\"Bras??lia Time\"},{\"zoneName\":\"America/Manaus\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AMT\",\"tzName\":\"Amazon Time (Brazil)\"},{\"zoneName\":\"America/Noronha\",\"gmtOffset\":-7200,\"gmtOffsetName\":\"UTC-02:00\",\"abbreviation\":\"FNT\",\"tzName\":\"Fernando de Noronha Time\"},{\"zoneName\":\"America/Porto_Velho\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AMT\",\"tzName\":\"Amazon Time (Brazil)[3\"},{\"zoneName\":\"America/Recife\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"BRT\",\"tzName\":\"Bras??lia Time\"},{\"zoneName\":\"America/Rio_Branco\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"ACT\",\"tzName\":\"Acre Time\"},{\"zoneName\":\"America/Santarem\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"BRT\",\"tzName\":\"Bras??lia Time\"},{\"zoneName\":\"America/Sao_Paulo\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"BRT\",\"tzName\":\"Bras??lia Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Brasil\",\"pt\":\"Brasil\",\"nl\":\"Brazili??\",\"hr\":\"Brazil\",\"fa\":\"??????????\",\"de\":\"Brasilien\",\"es\":\"Brasil\",\"fr\":\"Br??sil\",\"ja\":\"????????????\",\"it\":\"Brasile\",\"cn\":\"??????\"}', '-10.00000000', '-55.00000000', '????????', 'U+1F1E7 U+1F1F7', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q155'),
(32, 'British Indian Ocean Territory', 'IOT', '086', 'IO', '246', 'Diego Garcia', 'USD', '$', '.io', 'British Indian Ocean Territory', 'Africa', 'Eastern Africa', '[{\"zoneName\":\"Indian/Chagos\",\"gmtOffset\":21600,\"gmtOffsetName\":\"UTC+06:00\",\"abbreviation\":\"IOT\",\"tzName\":\"Indian Ocean Time\"}]', '{\"kr\":\"????????? ????????? ??????\",\"br\":\"Territ??rio Brit??nico do Oceano ????dico\",\"pt\":\"Territ??rio Brit??nico do Oceano ??ndico\",\"nl\":\"Britse Gebieden in de Indische Oceaan\",\"hr\":\"Britanski Indijskooceanski teritorij\",\"fa\":\"?????????? ???????????????? ???? ?????????????? ??????\",\"de\":\"Britisches Territorium im Indischen Ozean\",\"es\":\"Territorio Brit??nico del Oc??ano ??ndico\",\"fr\":\"Territoire britannique de l\'oc??an Indien\",\"ja\":\"?????????????????????????????????\",\"it\":\"Territorio britannico dell\'oceano indiano\",\"cn\":\"?????????????????????\"}', '-6.00000000', '71.50000000', '????????', 'U+1F1EE U+1F1F4', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, NULL),
(33, 'Brunei', 'BRN', '096', 'BN', '673', 'Bandar Seri Begawan', 'BND', 'B$', '.bn', 'Negara Brunei Darussalam', 'Asia', 'South-Eastern Asia', '[{\"zoneName\":\"Asia/Brunei\",\"gmtOffset\":28800,\"gmtOffsetName\":\"UTC+08:00\",\"abbreviation\":\"BNT\",\"tzName\":\"Brunei Darussalam Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Brunei\",\"pt\":\"Brunei\",\"nl\":\"Brunei\",\"hr\":\"Brunej\",\"fa\":\"????????????\",\"de\":\"Brunei\",\"es\":\"Brunei\",\"fr\":\"Brunei\",\"ja\":\"?????????????????????????????????\",\"it\":\"Brunei\",\"cn\":\"??????\"}', '4.50000000', '114.66666666', '????????', 'U+1F1E7 U+1F1F3', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q921'),
(34, 'Bulgaria', 'BGR', '100', 'BG', '359', 'Sofia', 'BGN', '????.', '.bg', '????????????????', 'Europe', 'Eastern Europe', '[{\"zoneName\":\"Europe/Sofia\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Bulg??ria\",\"pt\":\"Bulg??ria\",\"nl\":\"Bulgarije\",\"hr\":\"Bugarska\",\"fa\":\"??????????????????\",\"de\":\"Bulgarien\",\"es\":\"Bulgaria\",\"fr\":\"Bulgarie\",\"ja\":\"???????????????\",\"it\":\"Bulgaria\",\"cn\":\"????????????\"}', '43.00000000', '25.00000000', '????????', 'U+1F1E7 U+1F1EC', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q219'),
(35, 'Burkina Faso', 'BFA', '854', 'BF', '226', 'Ouagadougou', 'XOF', 'CFA', '.bf', 'Burkina Faso', 'Africa', 'Western Africa', '[{\"zoneName\":\"Africa/Ouagadougou\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC??00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"}]', '{\"kr\":\"???????????? ??????\",\"br\":\"Burkina Faso\",\"pt\":\"Burquina Faso\",\"nl\":\"Burkina Faso\",\"hr\":\"Burkina Faso\",\"fa\":\"??????????????????????\",\"de\":\"Burkina Faso\",\"es\":\"Burkina Faso\",\"fr\":\"Burkina Faso\",\"ja\":\"?????????????????????\",\"it\":\"Burkina Faso\",\"cn\":\"???????????????\"}', '13.00000000', '-2.00000000', '????????', 'U+1F1E7 U+1F1EB', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q965'),
(36, 'Burundi', 'BDI', '108', 'BI', '257', 'Bujumbura', 'BIF', 'FBu', '.bi', 'Burundi', 'Africa', 'Eastern Africa', '[{\"zoneName\":\"Africa/Bujumbura\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"CAT\",\"tzName\":\"Central Africa Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Burundi\",\"pt\":\"Bur??ndi\",\"nl\":\"Burundi\",\"hr\":\"Burundi\",\"fa\":\"??????????????\",\"de\":\"Burundi\",\"es\":\"Burundi\",\"fr\":\"Burundi\",\"ja\":\"????????????\",\"it\":\"Burundi\",\"cn\":\"?????????\"}', '-3.50000000', '30.00000000', '????????', 'U+1F1E7 U+1F1EE', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q967'),
(37, 'Cambodia', 'KHM', '116', 'KH', '855', 'Phnom Penh', 'KHR', 'KHR', '.kh', 'K??mp??ch??a', 'Asia', 'South-Eastern Asia', '[{\"zoneName\":\"Asia/Phnom_Penh\",\"gmtOffset\":25200,\"gmtOffsetName\":\"UTC+07:00\",\"abbreviation\":\"ICT\",\"tzName\":\"Indochina Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Camboja\",\"pt\":\"Camboja\",\"nl\":\"Cambodja\",\"hr\":\"Kambod??a\",\"fa\":\"????????????\",\"de\":\"Kambodscha\",\"es\":\"Camboya\",\"fr\":\"Cambodge\",\"ja\":\"???????????????\",\"it\":\"Cambogia\",\"cn\":\"?????????\"}', '13.00000000', '105.00000000', '????????', 'U+1F1F0 U+1F1ED', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q424'),
(38, 'Cameroon', 'CMR', '120', 'CM', '237', 'Yaounde', 'XAF', 'FCFA', '.cm', 'Cameroon', 'Africa', 'Middle Africa', '[{\"zoneName\":\"Africa/Douala\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"WAT\",\"tzName\":\"West Africa Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Camar??es\",\"pt\":\"Camar??es\",\"nl\":\"Kameroen\",\"hr\":\"Kamerun\",\"fa\":\"????????????\",\"de\":\"Kamerun\",\"es\":\"Camer??n\",\"fr\":\"Cameroun\",\"ja\":\"???????????????\",\"it\":\"Camerun\",\"cn\":\"?????????\"}', '6.00000000', '12.00000000', '????????', 'U+1F1E8 U+1F1F2', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q1009'),
(39, 'Canada', 'CAN', '124', 'CA', '1', 'Ottawa', 'CAD', '$', '.ca', 'Canada', 'Americas', 'Northern America', '[{\"zoneName\":\"America/Atikokan\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America)\"},{\"zoneName\":\"America/Blanc-Sablon\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"},{\"zoneName\":\"America/Cambridge_Bay\",\"gmtOffset\":-25200,\"gmtOffsetName\":\"UTC-07:00\",\"abbreviation\":\"MST\",\"tzName\":\"Mountain Standard Time (North America)\"},{\"zoneName\":\"America/Creston\",\"gmtOffset\":-25200,\"gmtOffsetName\":\"UTC-07:00\",\"abbreviation\":\"MST\",\"tzName\":\"Mountain Standard Time (North America)\"},{\"zoneName\":\"America/Dawson\",\"gmtOffset\":-25200,\"gmtOffsetName\":\"UTC-07:00\",\"abbreviation\":\"MST\",\"tzName\":\"Mountain Standard Time (North America)\"},{\"zoneName\":\"America/Dawson_Creek\",\"gmtOffset\":-25200,\"gmtOffsetName\":\"UTC-07:00\",\"abbreviation\":\"MST\",\"tzName\":\"Mountain Standard Time (North America)\"},{\"zoneName\":\"America/Edmonton\",\"gmtOffset\":-25200,\"gmtOffsetName\":\"UTC-07:00\",\"abbreviation\":\"MST\",\"tzName\":\"Mountain Standard Time (North America)\"},{\"zoneName\":\"America/Fort_Nelson\",\"gmtOffset\":-25200,\"gmtOffsetName\":\"UTC-07:00\",\"abbreviation\":\"MST\",\"tzName\":\"Mountain Standard Time (North America)\"},{\"zoneName\":\"America/Glace_Bay\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"},{\"zoneName\":\"America/Goose_Bay\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"},{\"zoneName\":\"America/Halifax\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"},{\"zoneName\":\"America/Inuvik\",\"gmtOffset\":-25200,\"gmtOffsetName\":\"UTC-07:00\",\"abbreviation\":\"MST\",\"tzName\":\"Mountain Standard Time (North America\"},{\"zoneName\":\"America/Iqaluit\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America\"},{\"zoneName\":\"America/Moncton\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"},{\"zoneName\":\"America/Nipigon\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America\"},{\"zoneName\":\"America/Pangnirtung\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America\"},{\"zoneName\":\"America/Rainy_River\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"},{\"zoneName\":\"America/Rankin_Inlet\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"},{\"zoneName\":\"America/Regina\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"},{\"zoneName\":\"America/Resolute\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"},{\"zoneName\":\"America/St_Johns\",\"gmtOffset\":-12600,\"gmtOffsetName\":\"UTC-03:30\",\"abbreviation\":\"NST\",\"tzName\":\"Newfoundland Standard Time\"},{\"zoneName\":\"America/Swift_Current\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"},{\"zoneName\":\"America/Thunder_Bay\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America\"},{\"zoneName\":\"America/Toronto\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America\"},{\"zoneName\":\"America/Vancouver\",\"gmtOffset\":-28800,\"gmtOffsetName\":\"UTC-08:00\",\"abbreviation\":\"PST\",\"tzName\":\"Pacific Standard Time (North America\"},{\"zoneName\":\"America/Whitehorse\",\"gmtOffset\":-25200,\"gmtOffsetName\":\"UTC-07:00\",\"abbreviation\":\"MST\",\"tzName\":\"Mountain Standard Time (North America\"},{\"zoneName\":\"America/Winnipeg\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"},{\"zoneName\":\"America/Yellowknife\",\"gmtOffset\":-25200,\"gmtOffsetName\":\"UTC-07:00\",\"abbreviation\":\"MST\",\"tzName\":\"Mountain Standard Time (North America\"}]', '{\"kr\":\"?????????\",\"br\":\"Canad??\",\"pt\":\"Canad??\",\"nl\":\"Canada\",\"hr\":\"Kanada\",\"fa\":\"????????????\",\"de\":\"Kanada\",\"es\":\"Canad??\",\"fr\":\"Canada\",\"ja\":\"?????????\",\"it\":\"Canada\",\"cn\":\"?????????\"}', '60.00000000', '-95.00000000', '????????', 'U+1F1E8 U+1F1E6', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q16'),
(40, 'Cape Verde', 'CPV', '132', 'CV', '238', 'Praia', 'CVE', '$', '.cv', 'Cabo Verde', 'Africa', 'Western Africa', '[{\"zoneName\":\"Atlantic/Cape_Verde\",\"gmtOffset\":-3600,\"gmtOffsetName\":\"UTC-01:00\",\"abbreviation\":\"CVT\",\"tzName\":\"Cape Verde Time\"}]', '{\"kr\":\"???????????????\",\"br\":\"Cabo Verde\",\"pt\":\"Cabo Verde\",\"nl\":\"Kaapverdi??\",\"hr\":\"Zelenortska Republika\",\"fa\":\"?????? ??????\",\"de\":\"Kap Verde\",\"es\":\"Cabo Verde\",\"fr\":\"Cap Vert\",\"ja\":\"??????????????????\",\"it\":\"Capo Verde\",\"cn\":\"?????????\"}', '16.00000000', '-24.00000000', '????????', 'U+1F1E8 U+1F1FB', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q1011'),
(41, 'Cayman Islands', 'CYM', '136', 'KY', '1345', 'George Town', 'KYD', '$', '.ky', 'Cayman Islands', 'Americas', 'Caribbean', '[{\"zoneName\":\"America/Cayman\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America\"}]', '{\"kr\":\"????????? ??????\",\"br\":\"Ilhas Cayman\",\"pt\":\"Ilhas Caim??o\",\"nl\":\"Caymaneilanden\",\"hr\":\"Kajmanski otoci\",\"fa\":\"?????????? ????????\",\"de\":\"Kaimaninseln\",\"es\":\"Islas Caim??n\",\"fr\":\"??les Ca??mans\",\"ja\":\"??????????????????\",\"it\":\"Isole Cayman\",\"cn\":\"????????????\"}', '19.50000000', '-80.50000000', '????????', 'U+1F1F0 U+1F1FE', '2018-07-20 20:11:03', '2021-12-04 08:16:08', 1, NULL),
(42, 'Central African Republic', 'CAF', '140', 'CF', '236', 'Bangui', 'XAF', 'FCFA', '.cf', 'K??d??r??s??se t?? B??afr??ka', 'Africa', 'Middle Africa', '[{\"zoneName\":\"Africa/Bangui\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"WAT\",\"tzName\":\"West Africa Time\"}]', '{\"kr\":\"?????????????????? ?????????\",\"br\":\"Rep??blica Centro-Africana\",\"pt\":\"Rep??blica Centro-Africana\",\"nl\":\"Centraal-Afrikaanse Republiek\",\"hr\":\"Srednjoafri??ka Republika\",\"fa\":\"???????????? ?????????????? ??????????\",\"de\":\"Zentralafrikanische Republik\",\"es\":\"Rep??blica Centroafricana\",\"fr\":\"R??publique centrafricaine\",\"ja\":\"???????????????????????????\",\"it\":\"Repubblica Centrafricana\",\"cn\":\"??????\"}', '7.00000000', '21.00000000', '????????', 'U+1F1E8 U+1F1EB', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q929'),
(43, 'Chad', 'TCD', '148', 'TD', '235', 'N\'Djamena', 'XAF', 'FCFA', '.td', 'Tchad', 'Africa', 'Middle Africa', '[{\"zoneName\":\"Africa/Ndjamena\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"WAT\",\"tzName\":\"West Africa Time\"}]', '{\"kr\":\"??????\",\"br\":\"Chade\",\"pt\":\"Chade\",\"nl\":\"Tsjaad\",\"hr\":\"??ad\",\"fa\":\"??????\",\"de\":\"Tschad\",\"es\":\"Chad\",\"fr\":\"Tchad\",\"ja\":\"?????????\",\"it\":\"Ciad\",\"cn\":\"??????\"}', '15.00000000', '19.00000000', '????????', 'U+1F1F9 U+1F1E9', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q657'),
(44, 'Chile', 'CHL', '152', 'CL', '56', 'Santiago', 'CLP', '$', '.cl', 'Chile', 'Americas', 'South America', '[{\"zoneName\":\"America/Punta_Arenas\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"CLST\",\"tzName\":\"Chile Summer Time\"},{\"zoneName\":\"America/Santiago\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"CLST\",\"tzName\":\"Chile Summer Time\"},{\"zoneName\":\"Pacific/Easter\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EASST\",\"tzName\":\"Easter Island Summer Time\"}]', '{\"kr\":\"??????\",\"br\":\"Chile\",\"pt\":\"Chile\",\"nl\":\"Chili\",\"hr\":\"??ile\",\"fa\":\"????????\",\"de\":\"Chile\",\"es\":\"Chile\",\"fr\":\"Chili\",\"ja\":\"??????\",\"it\":\"Cile\",\"cn\":\"??????\"}', '-30.00000000', '-71.00000000', '????????', 'U+1F1E8 U+1F1F1', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q298'),
(45, 'China', 'CHN', '156', 'CN', '86', 'Beijing', 'CNY', '??', '.cn', '??????', 'Asia', 'Eastern Asia', '[{\"zoneName\":\"Asia/Shanghai\",\"gmtOffset\":28800,\"gmtOffsetName\":\"UTC+08:00\",\"abbreviation\":\"CST\",\"tzName\":\"China Standard Time\"},{\"zoneName\":\"Asia/Urumqi\",\"gmtOffset\":21600,\"gmtOffsetName\":\"UTC+06:00\",\"abbreviation\":\"XJT\",\"tzName\":\"China Standard Time\"}]', '{\"kr\":\"??????\",\"br\":\"China\",\"pt\":\"China\",\"nl\":\"China\",\"hr\":\"Kina\",\"fa\":\"??????\",\"de\":\"China\",\"es\":\"China\",\"fr\":\"Chine\",\"ja\":\"??????\",\"it\":\"Cina\",\"cn\":\"??????\"}', '35.00000000', '105.00000000', '????????', 'U+1F1E8 U+1F1F3', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q148'),
(46, 'Christmas Island', 'CXR', '162', 'CX', '61', 'Flying Fish Cove', 'AUD', '$', '.cx', 'Christmas Island', 'Oceania', 'Australia and New Zealand', '[{\"zoneName\":\"Indian/Christmas\",\"gmtOffset\":25200,\"gmtOffsetName\":\"UTC+07:00\",\"abbreviation\":\"CXT\",\"tzName\":\"Christmas Island Time\"}]', '{\"kr\":\"??????????????? ???\",\"br\":\"Ilha Christmas\",\"pt\":\"Ilha do Natal\",\"nl\":\"Christmaseiland\",\"hr\":\"Bo??i??ni otok\",\"fa\":\"?????????? ????????????\",\"de\":\"Weihnachtsinsel\",\"es\":\"Isla de Navidad\",\"fr\":\"??le Christmas\",\"ja\":\"??????????????????\",\"it\":\"Isola di Natale\",\"cn\":\"?????????\"}', '-10.50000000', '105.66666666', '????????', 'U+1F1E8 U+1F1FD', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, NULL),
(47, 'Cocos (Keeling) Islands', 'CCK', '166', 'CC', '61', 'West Island', 'AUD', '$', '.cc', 'Cocos (Keeling) Islands', 'Oceania', 'Australia and New Zealand', '[{\"zoneName\":\"Indian/Cocos\",\"gmtOffset\":23400,\"gmtOffsetName\":\"UTC+06:30\",\"abbreviation\":\"CCT\",\"tzName\":\"Cocos Islands Time\"}]', '{\"kr\":\"????????? ??????\",\"br\":\"Ilhas Cocos\",\"pt\":\"Ilhas dos Cocos\",\"nl\":\"Cocoseilanden\",\"hr\":\"Kokosovi Otoci\",\"fa\":\"?????????? ??????????\",\"de\":\"Kokosinseln\",\"es\":\"Islas Cocos o Islas Keeling\",\"fr\":\"??les Cocos\",\"ja\":\"????????????????????????????????????\",\"it\":\"Isole Cocos e Keeling\",\"cn\":\"???????????????????????????\"}', '-12.50000000', '96.83333333', '????????', 'U+1F1E8 U+1F1E8', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, NULL),
(48, 'Colombia', 'COL', '170', 'CO', '57', 'Bogota', 'COP', '$', '.co', 'Colombia', 'Americas', 'South America', '[{\"zoneName\":\"America/Bogota\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"COT\",\"tzName\":\"Colombia Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Col??mbia\",\"pt\":\"Col??mbia\",\"nl\":\"Colombia\",\"hr\":\"Kolumbija\",\"fa\":\"????????????\",\"de\":\"Kolumbien\",\"es\":\"Colombia\",\"fr\":\"Colombie\",\"ja\":\"???????????????\",\"it\":\"Colombia\",\"cn\":\"????????????\"}', '4.00000000', '-72.00000000', '????????', 'U+1F1E8 U+1F1F4', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q739'),
(49, 'Comoros', 'COM', '174', 'KM', '269', 'Moroni', 'KMF', 'CF', '.km', 'Komori', 'Africa', 'Eastern Africa', '[{\"zoneName\":\"Indian/Comoro\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"EAT\",\"tzName\":\"East Africa Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Comores\",\"pt\":\"Comores\",\"nl\":\"Comoren\",\"hr\":\"Komori\",\"fa\":\"??????????\",\"de\":\"Union der Komoren\",\"es\":\"Comoras\",\"fr\":\"Comores\",\"ja\":\"?????????\",\"it\":\"Comore\",\"cn\":\"?????????\"}', '-12.16666666', '44.25000000', '????????', 'U+1F1F0 U+1F1F2', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q970'),
(50, 'Congo', 'COG', '178', 'CG', '242', 'Brazzaville', 'XAF', 'FC', '.cg', 'R??publique du Congo', 'Africa', 'Middle Africa', '[{\"zoneName\":\"Africa/Brazzaville\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"WAT\",\"tzName\":\"West Africa Time\"}]', '{\"kr\":\"??????\",\"br\":\"Congo\",\"pt\":\"Congo\",\"nl\":\"Congo [Republiek]\",\"hr\":\"Kongo\",\"fa\":\"????????\",\"de\":\"Kongo\",\"es\":\"Congo\",\"fr\":\"Congo\",\"ja\":\"??????????????????\",\"it\":\"Congo\",\"cn\":\"??????\"}', '-1.00000000', '15.00000000', '????????', 'U+1F1E8 U+1F1EC', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q971'),
(51, 'Democratic Republic of the Congo', 'COD', '180', 'CD', '243', 'Kinshasa', 'CDF', 'FC', '.cd', 'R??publique d??mocratique du Congo', 'Africa', 'Middle Africa', '[{\"zoneName\":\"Africa/Kinshasa\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"WAT\",\"tzName\":\"West Africa Time\"},{\"zoneName\":\"Africa/Lubumbashi\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"CAT\",\"tzName\":\"Central Africa Time\"}]', '{\"kr\":\"?????? ?????? ?????????\",\"br\":\"RD Congo\",\"pt\":\"RD Congo\",\"nl\":\"Congo [DRC]\",\"hr\":\"Kongo, Demokratska Republika\",\"fa\":\"???????????? ????????\",\"de\":\"Kongo (Dem. Rep.)\",\"es\":\"Congo (Rep. Dem.)\",\"fr\":\"Congo (R??p. d??m.)\",\"ja\":\"????????????????????????\",\"it\":\"Congo (Rep. Dem.)\",\"cn\":\"???????????????\"}', '0.00000000', '25.00000000', '????????', 'U+1F1E8 U+1F1E9', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q974'),
(52, 'Cook Islands', 'COK', '184', 'CK', '682', 'Avarua', 'NZD', '$', '.ck', 'Cook Islands', 'Oceania', 'Polynesia', '[{\"zoneName\":\"Pacific/Rarotonga\",\"gmtOffset\":-36000,\"gmtOffsetName\":\"UTC-10:00\",\"abbreviation\":\"CKT\",\"tzName\":\"Cook Island Time\"}]', '{\"kr\":\"??? ??????\",\"br\":\"Ilhas Cook\",\"pt\":\"Ilhas Cook\",\"nl\":\"Cookeilanden\",\"hr\":\"Cookovo Oto??je\",\"fa\":\"?????????? ??????\",\"de\":\"Cookinseln\",\"es\":\"Islas Cook\",\"fr\":\"??les Cook\",\"ja\":\"???????????????\",\"it\":\"Isole Cook\",\"cn\":\"????????????\"}', '-21.23333333', '-159.76666666', '????????', 'U+1F1E8 U+1F1F0', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q26988'),
(53, 'Costa Rica', 'CRI', '188', 'CR', '506', 'San Jose', 'CRC', '???', '.cr', 'Costa Rica', 'Americas', 'Central America', '[{\"zoneName\":\"America/Costa_Rica\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"}]', '{\"kr\":\"???????????????\",\"br\":\"Costa Rica\",\"pt\":\"Costa Rica\",\"nl\":\"Costa Rica\",\"hr\":\"Kostarika\",\"fa\":\"??????????????????\",\"de\":\"Costa Rica\",\"es\":\"Costa Rica\",\"fr\":\"Costa Rica\",\"ja\":\"???????????????\",\"it\":\"Costa Rica\",\"cn\":\"???????????????\"}', '10.00000000', '-84.00000000', '????????', 'U+1F1E8 U+1F1F7', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q800'),
(54, 'Cote D\'Ivoire (Ivory Coast)', 'CIV', '384', 'CI', '225', 'Yamoussoukro', 'XOF', 'CFA', '.ci', NULL, 'Africa', 'Western Africa', '[{\"zoneName\":\"Africa/Abidjan\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC??00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"}]', '{\"kr\":\"??????????????????\",\"br\":\"Costa do Marfim\",\"pt\":\"Costa do Marfim\",\"nl\":\"Ivoorkust\",\"hr\":\"Obala Bjelokosti\",\"fa\":\"???????? ??????\",\"de\":\"Elfenbeink??ste\",\"es\":\"Costa de Marfil\",\"fr\":\"C??te d\'Ivoire\",\"ja\":\"????????????????????????\",\"it\":\"Costa D\'Avorio\",\"cn\":\"????????????\"}', '8.00000000', '-5.00000000', '????????', 'U+1F1E8 U+1F1EE', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q1008'),
(55, 'Croatia', 'HRV', '191', 'HR', '385', 'Zagreb', 'HRK', 'kn', '.hr', 'Hrvatska', 'Europe', 'Southern Europe', '[{\"zoneName\":\"Europe/Zagreb\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"???????????????\",\"br\":\"Cro??cia\",\"pt\":\"Cro??cia\",\"nl\":\"Kroati??\",\"hr\":\"Hrvatska\",\"fa\":\"????????????\",\"de\":\"Kroatien\",\"es\":\"Croacia\",\"fr\":\"Croatie\",\"ja\":\"???????????????\",\"it\":\"Croazia\",\"cn\":\"????????????\"}', '45.16666666', '15.50000000', '????????', 'U+1F1ED U+1F1F7', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q224'),
(56, 'Cuba', 'CUB', '192', 'CU', '53', 'Havana', 'CUP', '$', '.cu', 'Cuba', 'Americas', 'Caribbean', '[{\"zoneName\":\"America/Havana\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"CST\",\"tzName\":\"Cuba Standard Time\"}]', '{\"kr\":\"??????\",\"br\":\"Cuba\",\"pt\":\"Cuba\",\"nl\":\"Cuba\",\"hr\":\"Kuba\",\"fa\":\"????????\",\"de\":\"Kuba\",\"es\":\"Cuba\",\"fr\":\"Cuba\",\"ja\":\"????????????\",\"it\":\"Cuba\",\"cn\":\"??????\"}', '21.50000000', '-80.00000000', '????????', 'U+1F1E8 U+1F1FA', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q241'),
(57, 'Cyprus', 'CYP', '196', 'CY', '357', 'Nicosia', 'EUR', '???', '.cy', '????????????', 'Europe', 'Southern Europe', '[{\"zoneName\":\"Asia/Famagusta\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"},{\"zoneName\":\"Asia/Nicosia\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Chipre\",\"pt\":\"Chipre\",\"nl\":\"Cyprus\",\"hr\":\"Cipar\",\"fa\":\"????????\",\"de\":\"Zypern\",\"es\":\"Chipre\",\"fr\":\"Chypre\",\"ja\":\"????????????\",\"it\":\"Cipro\",\"cn\":\"????????????\"}', '35.00000000', '33.00000000', '????????', 'U+1F1E8 U+1F1FE', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q229'),
(58, 'Czech Republic', 'CZE', '203', 'CZ', '420', 'Prague', 'CZK', 'K??', '.cz', '??esk?? republika', 'Europe', 'Eastern Europe', '[{\"zoneName\":\"Europe/Prague\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"??????\",\"br\":\"Rep??blica Tcheca\",\"pt\":\"Rep??blica Checa\",\"nl\":\"Tsjechi??\",\"hr\":\"??e??ka\",\"fa\":\"???????????? ????\",\"de\":\"Tschechische Republik\",\"es\":\"Rep??blica Checa\",\"fr\":\"R??publique tch??que\",\"ja\":\"?????????\",\"it\":\"Repubblica Ceca\",\"cn\":\"??????\"}', '49.75000000', '15.50000000', '????????', 'U+1F1E8 U+1F1FF', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q213'),
(59, 'Denmark', 'DNK', '208', 'DK', '45', 'Copenhagen', 'DKK', 'Kr.', '.dk', 'Danmark', 'Europe', 'Northern Europe', '[{\"zoneName\":\"Europe/Copenhagen\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Dinamarca\",\"pt\":\"Dinamarca\",\"nl\":\"Denemarken\",\"hr\":\"Danska\",\"fa\":\"??????????????\",\"de\":\"D??nemark\",\"es\":\"Dinamarca\",\"fr\":\"Danemark\",\"ja\":\"???????????????\",\"it\":\"Danimarca\",\"cn\":\"??????\"}', '56.00000000', '10.00000000', '????????', 'U+1F1E9 U+1F1F0', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q35');
INSERT INTO `countries` (`id`, `name`, `iso3`, `numeric_code`, `iso2`, `phonecode`, `capital`, `currency`, `currency_symbol`, `tld`, `native`, `region`, `subregion`, `timezones`, `translations`, `latitude`, `longitude`, `emoji`, `emojiU`, `created_at`, `updated_at`, `flag`, `wikiDataId`) VALUES
(60, 'Djibouti', 'DJI', '262', 'DJ', '253', 'Djibouti', 'DJF', 'Fdj', '.dj', 'Djibouti', 'Africa', 'Eastern Africa', '[{\"zoneName\":\"Africa/Djibouti\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"EAT\",\"tzName\":\"East Africa Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Djibuti\",\"pt\":\"Djibuti\",\"nl\":\"Djibouti\",\"hr\":\"D??ibuti\",\"fa\":\"????????????\",\"de\":\"Dschibuti\",\"es\":\"Yibuti\",\"fr\":\"Djibouti\",\"ja\":\"?????????\",\"it\":\"Gibuti\",\"cn\":\"?????????\"}', '11.50000000', '43.00000000', '????????', 'U+1F1E9 U+1F1EF', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q977'),
(61, 'Dominica', 'DMA', '212', 'DM', '1767', 'Roseau', 'XCD', '$', '.dm', 'Dominica', 'Americas', 'Caribbean', '[{\"zoneName\":\"America/Dominica\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]', '{\"kr\":\"???????????? ??????\",\"br\":\"Dominica\",\"pt\":\"Dominica\",\"nl\":\"Dominica\",\"hr\":\"Dominika\",\"fa\":\"????????????????\",\"de\":\"Dominica\",\"es\":\"Dominica\",\"fr\":\"Dominique\",\"ja\":\"???????????????\",\"it\":\"Dominica\",\"cn\":\"????????????\"}', '15.41666666', '-61.33333333', '????????', 'U+1F1E9 U+1F1F2', '2018-07-20 20:11:03', '2021-12-04 08:15:54', 1, 'Q784'),
(62, 'Dominican Republic', 'DOM', '214', 'DO', '1809', 'Santo Domingo', 'DOP', '$', '.do', 'Rep??blica Dominicana', 'Americas', 'Caribbean', '[{\"zoneName\":\"America/Santo_Domingo\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]', '{\"kr\":\"???????????? ?????????\",\"br\":\"Rep??blica Dominicana\",\"pt\":\"Rep??blica Dominicana\",\"nl\":\"Dominicaanse Republiek\",\"hr\":\"Dominikanska Republika\",\"fa\":\"???????????? ????????????????\",\"de\":\"Dominikanische Republik\",\"es\":\"Rep??blica Dominicana\",\"fr\":\"R??publique dominicaine\",\"ja\":\"?????????????????????\",\"it\":\"Repubblica Dominicana\",\"cn\":\"?????????????????????\"}', '19.00000000', '-70.66666666', '????????', 'U+1F1E9 U+1F1F4', '2018-07-20 20:11:03', '2021-12-04 08:15:46', 1, 'Q786'),
(63, 'East Timor', 'TLS', '626', 'TL', '670', 'Dili', 'USD', '$', '.tl', 'Timor-Leste', 'Asia', 'South-Eastern Asia', '[{\"zoneName\":\"Asia/Dili\",\"gmtOffset\":32400,\"gmtOffsetName\":\"UTC+09:00\",\"abbreviation\":\"TLT\",\"tzName\":\"Timor Leste Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Timor Leste\",\"pt\":\"Timor Leste\",\"nl\":\"Oost-Timor\",\"hr\":\"Isto??ni Timor\",\"fa\":\"?????????? ????????\",\"de\":\"Timor-Leste\",\"es\":\"Timor Oriental\",\"fr\":\"Timor oriental\",\"ja\":\"??????????????????\",\"it\":\"Timor Est\",\"cn\":\"?????????\"}', '-8.83333333', '125.91666666', '????????', 'U+1F1F9 U+1F1F1', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q574'),
(64, 'Ecuador', 'ECU', '218', 'EC', '593', 'Quito', 'USD', '$', '.ec', 'Ecuador', 'Americas', 'South America', '[{\"zoneName\":\"America/Guayaquil\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"ECT\",\"tzName\":\"Ecuador Time\"},{\"zoneName\":\"Pacific/Galapagos\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"GALT\",\"tzName\":\"Gal??pagos Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Equador\",\"pt\":\"Equador\",\"nl\":\"Ecuador\",\"hr\":\"Ekvador\",\"fa\":\"??????????????\",\"de\":\"Ecuador\",\"es\":\"Ecuador\",\"fr\":\"??quateur\",\"ja\":\"???????????????\",\"it\":\"Ecuador\",\"cn\":\"????????????\"}', '-2.00000000', '-77.50000000', '????????', 'U+1F1EA U+1F1E8', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q736'),
(65, 'Egypt', 'EGY', '818', 'EG', '20', 'Cairo', 'EGP', '??.??', '.eg', '?????????', 'Africa', 'Northern Africa', '[{\"zoneName\":\"Africa/Cairo\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Egito\",\"pt\":\"Egipto\",\"nl\":\"Egypte\",\"hr\":\"Egipat\",\"fa\":\"??????\",\"de\":\"??gypten\",\"es\":\"Egipto\",\"fr\":\"??gypte\",\"ja\":\"????????????\",\"it\":\"Egitto\",\"cn\":\"??????\"}', '27.00000000', '30.00000000', '????????', 'U+1F1EA U+1F1EC', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q79'),
(66, 'El Salvador', 'SLV', '222', 'SV', '503', 'San Salvador', 'USD', '$', '.sv', 'El Salvador', 'Americas', 'Central America', '[{\"zoneName\":\"America/El_Salvador\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"}]', '{\"kr\":\"???????????????\",\"br\":\"El Salvador\",\"pt\":\"El Salvador\",\"nl\":\"El Salvador\",\"hr\":\"Salvador\",\"fa\":\"????????????????????\",\"de\":\"El Salvador\",\"es\":\"El Salvador\",\"fr\":\"Salvador\",\"ja\":\"?????????????????????\",\"it\":\"El Salvador\",\"cn\":\"????????????\"}', '13.83333333', '-88.91666666', '????????', 'U+1F1F8 U+1F1FB', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q792'),
(67, 'Equatorial Guinea', 'GNQ', '226', 'GQ', '240', 'Malabo', 'XAF', 'FCFA', '.gq', 'Guinea Ecuatorial', 'Africa', 'Middle Africa', '[{\"zoneName\":\"Africa/Malabo\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"WAT\",\"tzName\":\"West Africa Time\"}]', '{\"kr\":\"?????? ??????\",\"br\":\"Guin?? Equatorial\",\"pt\":\"Guin?? Equatorial\",\"nl\":\"Equatoriaal-Guinea\",\"hr\":\"Ekvatorijalna Gvineja\",\"fa\":\"???????? ??????????????\",\"de\":\"??quatorial-Guinea\",\"es\":\"Guinea Ecuatorial\",\"fr\":\"Guin??e-??quatoriale\",\"ja\":\"???????????????\",\"it\":\"Guinea Equatoriale\",\"cn\":\"???????????????\"}', '2.00000000', '10.00000000', '????????', 'U+1F1EC U+1F1F6', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q983'),
(68, 'Eritrea', 'ERI', '232', 'ER', '291', 'Asmara', 'ERN', 'Nfk', '.er', '????????????', 'Africa', 'Eastern Africa', '[{\"zoneName\":\"Africa/Asmara\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"EAT\",\"tzName\":\"East Africa Time\"}]', '{\"kr\":\"???????????????\",\"br\":\"Eritreia\",\"pt\":\"Eritreia\",\"nl\":\"Eritrea\",\"hr\":\"Eritreja\",\"fa\":\"????????????\",\"de\":\"Eritrea\",\"es\":\"Eritrea\",\"fr\":\"??rythr??e\",\"ja\":\"???????????????\",\"it\":\"Eritrea\",\"cn\":\"???????????????\"}', '15.00000000', '39.00000000', '????????', 'U+1F1EA U+1F1F7', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q986'),
(69, 'Estonia', 'EST', '233', 'EE', '372', 'Tallinn', 'EUR', '???', '.ee', 'Eesti', 'Europe', 'Northern Europe', '[{\"zoneName\":\"Europe/Tallinn\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"}]', '{\"kr\":\"???????????????\",\"br\":\"Est??nia\",\"pt\":\"Est??nia\",\"nl\":\"Estland\",\"hr\":\"Estonija\",\"fa\":\"????????????\",\"de\":\"Estland\",\"es\":\"Estonia\",\"fr\":\"Estonie\",\"ja\":\"???????????????\",\"it\":\"Estonia\",\"cn\":\"????????????\"}', '59.00000000', '26.00000000', '????????', 'U+1F1EA U+1F1EA', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q191'),
(70, 'Ethiopia', 'ETH', '231', 'ET', '251', 'Addis Ababa', 'ETB', 'Nkf', '.et', '???????????????', 'Africa', 'Eastern Africa', '[{\"zoneName\":\"Africa/Addis_Ababa\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"EAT\",\"tzName\":\"East Africa Time\"}]', '{\"kr\":\"???????????????\",\"br\":\"Eti??pia\",\"pt\":\"Eti??pia\",\"nl\":\"Ethiopi??\",\"hr\":\"Etiopija\",\"fa\":\"????????????\",\"de\":\"??thiopien\",\"es\":\"Etiop??a\",\"fr\":\"??thiopie\",\"ja\":\"???????????????\",\"it\":\"Etiopia\",\"cn\":\"???????????????\"}', '8.00000000', '38.00000000', '????????', 'U+1F1EA U+1F1F9', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q115'),
(71, 'Falkland Islands', 'FLK', '238', 'FK', '500', 'Stanley', 'FKP', '??', '.fk', 'Falkland Islands', 'Americas', 'South America', '[{\"zoneName\":\"Atlantic/Stanley\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"FKST\",\"tzName\":\"Falkland Islands Summer Time\"}]', '{\"kr\":\"???????????? ??????\",\"br\":\"Ilhas Malvinas\",\"pt\":\"Ilhas Falkland\",\"nl\":\"Falklandeilanden [Islas Malvinas]\",\"hr\":\"Falklandski Otoci\",\"fa\":\"?????????? ??????????????\",\"de\":\"Falklandinseln\",\"es\":\"Islas Malvinas\",\"fr\":\"??les Malouines\",\"ja\":\"????????????????????????????????????????????????\",\"it\":\"Isole Falkland o Isole Malvine\",\"cn\":\"???????????????\"}', '-51.75000000', '-59.00000000', '????????', 'U+1F1EB U+1F1F0', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, NULL),
(72, 'Faroe Islands', 'FRO', '234', 'FO', '298', 'Torshavn', 'DKK', 'Kr.', '.fo', 'F??royar', 'Europe', 'Northern Europe', '[{\"zoneName\":\"Atlantic/Faroe\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC??00\",\"abbreviation\":\"WET\",\"tzName\":\"Western European Time\"}]', '{\"kr\":\"?????? ??????\",\"br\":\"Ilhas Faro??\",\"pt\":\"Ilhas Faro??\",\"nl\":\"Faer??er\",\"hr\":\"Farski Otoci\",\"fa\":\"?????????? ????????\",\"de\":\"F??r??er-Inseln\",\"es\":\"Islas Faroe\",\"fr\":\"??les F??ro??\",\"ja\":\"??????????????????\",\"it\":\"Isole Far Oer\",\"cn\":\"????????????\"}', '62.00000000', '-7.00000000', '????????', 'U+1F1EB U+1F1F4', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, NULL),
(73, 'Fiji Islands', 'FJI', '242', 'FJ', '679', 'Suva', 'FJD', 'FJ$', '.fj', 'Fiji', 'Oceania', 'Melanesia', '[{\"zoneName\":\"Pacific/Fiji\",\"gmtOffset\":43200,\"gmtOffsetName\":\"UTC+12:00\",\"abbreviation\":\"FJT\",\"tzName\":\"Fiji Time\"}]', '{\"kr\":\"??????\",\"br\":\"Fiji\",\"pt\":\"Fiji\",\"nl\":\"Fiji\",\"hr\":\"Fi??i\",\"fa\":\"????????\",\"de\":\"Fidschi\",\"es\":\"Fiyi\",\"fr\":\"Fidji\",\"ja\":\"????????????\",\"it\":\"Figi\",\"cn\":\"??????\"}', '-18.00000000', '175.00000000', '????????', 'U+1F1EB U+1F1EF', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q712'),
(74, 'Finland', 'FIN', '246', 'FI', '358', 'Helsinki', 'EUR', '???', '.fi', 'Suomi', 'Europe', 'Northern Europe', '[{\"zoneName\":\"Europe/Helsinki\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Finl??ndia\",\"pt\":\"Finl??ndia\",\"nl\":\"Finland\",\"hr\":\"Finska\",\"fa\":\"????????????\",\"de\":\"Finnland\",\"es\":\"Finlandia\",\"fr\":\"Finlande\",\"ja\":\"??????????????????\",\"it\":\"Finlandia\",\"cn\":\"??????\"}', '64.00000000', '26.00000000', '????????', 'U+1F1EB U+1F1EE', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q33'),
(75, 'France', 'FRA', '250', 'FR', '33', 'Paris', 'EUR', '???', '.fr', 'France', 'Europe', 'Western Europe', '[{\"zoneName\":\"Europe/Paris\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Fran??a\",\"pt\":\"Fran??a\",\"nl\":\"Frankrijk\",\"hr\":\"Francuska\",\"fa\":\"????????????\",\"de\":\"Frankreich\",\"es\":\"Francia\",\"fr\":\"France\",\"ja\":\"????????????\",\"it\":\"Francia\",\"cn\":\"??????\"}', '46.00000000', '2.00000000', '????????', 'U+1F1EB U+1F1F7', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q142'),
(76, 'French Guiana', 'GUF', '254', 'GF', '594', 'Cayenne', 'EUR', '???', '.gf', 'Guyane fran??aise', 'Americas', 'South America', '[{\"zoneName\":\"America/Cayenne\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"GFT\",\"tzName\":\"French Guiana Time\"}]', '{\"kr\":\"???????????? ?????????\",\"br\":\"Guiana Francesa\",\"pt\":\"Guiana Francesa\",\"nl\":\"Frans-Guyana\",\"hr\":\"Francuska Gvajana\",\"fa\":\"?????????? ????????????\",\"de\":\"Franz??sisch Guyana\",\"es\":\"Guayana Francesa\",\"fr\":\"Guayane\",\"ja\":\"????????????????????????\",\"it\":\"Guyana francese\",\"cn\":\"???????????????\"}', '4.00000000', '-53.00000000', '????????', 'U+1F1EC U+1F1EB', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, NULL),
(77, 'French Polynesia', 'PYF', '258', 'PF', '689', 'Papeete', 'XPF', '???', '.pf', 'Polyn??sie fran??aise', 'Oceania', 'Polynesia', '[{\"zoneName\":\"Pacific/Gambier\",\"gmtOffset\":-32400,\"gmtOffsetName\":\"UTC-09:00\",\"abbreviation\":\"GAMT\",\"tzName\":\"Gambier Islands Time\"},{\"zoneName\":\"Pacific/Marquesas\",\"gmtOffset\":-34200,\"gmtOffsetName\":\"UTC-09:30\",\"abbreviation\":\"MART\",\"tzName\":\"Marquesas Islands Time\"},{\"zoneName\":\"Pacific/Tahiti\",\"gmtOffset\":-36000,\"gmtOffsetName\":\"UTC-10:00\",\"abbreviation\":\"TAHT\",\"tzName\":\"Tahiti Time\"}]', '{\"kr\":\"???????????? ???????????????\",\"br\":\"Polin??sia Francesa\",\"pt\":\"Polin??sia Francesa\",\"nl\":\"Frans-Polynesi??\",\"hr\":\"Francuska Polinezija\",\"fa\":\"??????????????? ????????????\",\"de\":\"Franz??sisch-Polynesien\",\"es\":\"Polinesia Francesa\",\"fr\":\"Polyn??sie fran??aise\",\"ja\":\"??????????????????????????????\",\"it\":\"Polinesia Francese\",\"cn\":\"?????????????????????\"}', '-15.00000000', '-140.00000000', '????????', 'U+1F1F5 U+1F1EB', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, NULL),
(78, 'French Southern Territories', 'ATF', '260', 'TF', '262', 'Port-aux-Francais', 'EUR', '???', '.tf', 'Territoire des Terres australes et antarctiques fr', 'Africa', 'Southern Africa', '[{\"zoneName\":\"Indian/Kerguelen\",\"gmtOffset\":18000,\"gmtOffsetName\":\"UTC+05:00\",\"abbreviation\":\"TFT\",\"tzName\":\"French Southern and Antarctic Time\"}]', '{\"kr\":\"???????????? ?????? ??? ??????\",\"br\":\"Terras Austrais e Ant??rticas Francesas\",\"pt\":\"Terras Austrais e Ant??rticas Francesas\",\"nl\":\"Franse Gebieden in de zuidelijke Indische Oceaan\",\"hr\":\"Francuski ju??ni i antarkti??ki teritoriji\",\"fa\":\"????????????????????? ?????????? ?? ???????????????? ????????????\",\"de\":\"Franz??sische S??d- und Antarktisgebiete\",\"es\":\"Tierras Australes y Ant??rticas Francesas\",\"fr\":\"Terres australes et antarctiques fran??aises\",\"ja\":\"????????????????????????????????????\",\"it\":\"Territori Francesi del Sud\",\"cn\":\"??????????????????\"}', '-49.25000000', '69.16700000', '????????', 'U+1F1F9 U+1F1EB', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, NULL),
(79, 'Gabon', 'GAB', '266', 'GA', '241', 'Libreville', 'XAF', 'FCFA', '.ga', 'Gabon', 'Africa', 'Middle Africa', '[{\"zoneName\":\"Africa/Libreville\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"WAT\",\"tzName\":\"West Africa Time\"}]', '{\"kr\":\"??????\",\"br\":\"Gab??o\",\"pt\":\"Gab??o\",\"nl\":\"Gabon\",\"hr\":\"Gabon\",\"fa\":\"????????\",\"de\":\"Gabun\",\"es\":\"Gab??n\",\"fr\":\"Gabon\",\"ja\":\"?????????\",\"it\":\"Gabon\",\"cn\":\"??????\"}', '-1.00000000', '11.75000000', '????????', 'U+1F1EC U+1F1E6', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q1000'),
(80, 'Gambia The', 'GMB', '270', 'GM', '220', 'Banjul', 'GMD', 'D', '.gm', 'Gambia', 'Africa', 'Western Africa', '[{\"zoneName\":\"Africa/Banjul\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC??00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"}]', '{\"kr\":\"?????????\",\"br\":\"G??mbia\",\"pt\":\"G??mbia\",\"nl\":\"Gambia\",\"hr\":\"Gambija\",\"fa\":\"????????????\",\"de\":\"Gambia\",\"es\":\"Gambia\",\"fr\":\"Gambie\",\"ja\":\"????????????\",\"it\":\"Gambia\",\"cn\":\"?????????\"}', '13.46666666', '-16.56666666', '????????', 'U+1F1EC U+1F1F2', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q1005'),
(81, 'Georgia', 'GEO', '268', 'GE', '995', 'Tbilisi', 'GEL', '???', '.ge', '??????????????????????????????', 'Asia', 'Western Asia', '[{\"zoneName\":\"Asia/Tbilisi\",\"gmtOffset\":14400,\"gmtOffsetName\":\"UTC+04:00\",\"abbreviation\":\"GET\",\"tzName\":\"Georgia Standard Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Ge??rgia\",\"pt\":\"Ge??rgia\",\"nl\":\"Georgi??\",\"hr\":\"Gruzija\",\"fa\":\"??????????????\",\"de\":\"Georgien\",\"es\":\"Georgia\",\"fr\":\"G??orgie\",\"ja\":\"????????????\",\"it\":\"Georgia\",\"cn\":\"????????????\"}', '42.00000000', '43.50000000', '????????', 'U+1F1EC U+1F1EA', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q230'),
(82, 'Germany', 'DEU', '276', 'DE', '49', 'Berlin', 'EUR', '???', '.de', 'Deutschland', 'Europe', 'Western Europe', '[{\"zoneName\":\"Europe/Berlin\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"},{\"zoneName\":\"Europe/Busingen\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"??????\",\"br\":\"Alemanha\",\"pt\":\"Alemanha\",\"nl\":\"Duitsland\",\"hr\":\"Njema??ka\",\"fa\":\"??????????\",\"de\":\"Deutschland\",\"es\":\"Alemania\",\"fr\":\"Allemagne\",\"ja\":\"?????????\",\"it\":\"Germania\",\"cn\":\"??????\"}', '51.00000000', '9.00000000', '????????', 'U+1F1E9 U+1F1EA', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q183'),
(83, 'Ghana', 'GHA', '288', 'GH', '233', 'Accra', 'GHS', 'GH???', '.gh', 'Ghana', 'Africa', 'Western Africa', '[{\"zoneName\":\"Africa/Accra\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC??00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"}]', '{\"kr\":\"??????\",\"br\":\"Gana\",\"pt\":\"Gana\",\"nl\":\"Ghana\",\"hr\":\"Gana\",\"fa\":\"??????\",\"de\":\"Ghana\",\"es\":\"Ghana\",\"fr\":\"Ghana\",\"ja\":\"?????????\",\"it\":\"Ghana\",\"cn\":\"??????\"}', '8.00000000', '-2.00000000', '????????', 'U+1F1EC U+1F1ED', '2018-07-20 20:11:03', '2022-03-03 22:58:52', 1, 'Q117'),
(84, 'Gibraltar', 'GIB', '292', 'GI', '350', 'Gibraltar', 'GIP', '??', '.gi', 'Gibraltar', 'Europe', 'Southern Europe', '[{\"zoneName\":\"Europe/Gibraltar\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Gibraltar\",\"pt\":\"Gibraltar\",\"nl\":\"Gibraltar\",\"hr\":\"Gibraltar\",\"fa\":\"?????????????????\",\"de\":\"Gibraltar\",\"es\":\"Gibraltar\",\"fr\":\"Gibraltar\",\"ja\":\"??????????????????\",\"it\":\"Gibilterra\",\"cn\":\"????????????\"}', '36.13333333', '-5.35000000', '????????', 'U+1F1EC U+1F1EE', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, NULL),
(85, 'Greece', 'GRC', '300', 'GR', '30', 'Athens', 'EUR', '???', '.gr', '????????????', 'Europe', 'Southern Europe', '[{\"zoneName\":\"Europe/Athens\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Gr??cia\",\"pt\":\"Gr??cia\",\"nl\":\"Griekenland\",\"hr\":\"Gr??ka\",\"fa\":\"??????????\",\"de\":\"Griechenland\",\"es\":\"Grecia\",\"fr\":\"Gr??ce\",\"ja\":\"????????????\",\"it\":\"Grecia\",\"cn\":\"??????\"}', '39.00000000', '22.00000000', '????????', 'U+1F1EC U+1F1F7', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q41'),
(86, 'Greenland', 'GRL', '304', 'GL', '299', 'Nuuk', 'DKK', 'Kr.', '.gl', 'Kalaallit Nunaat', 'Americas', 'Northern America', '[{\"zoneName\":\"America/Danmarkshavn\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC??00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"},{\"zoneName\":\"America/Nuuk\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"WGT\",\"tzName\":\"West Greenland Time\"},{\"zoneName\":\"America/Scoresbysund\",\"gmtOffset\":-3600,\"gmtOffsetName\":\"UTC-01:00\",\"abbreviation\":\"EGT\",\"tzName\":\"Eastern Greenland Time\"},{\"zoneName\":\"America/Thule\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Groel??ndia\",\"pt\":\"Gronel??ndia\",\"nl\":\"Groenland\",\"hr\":\"Grenland\",\"fa\":\"??????????????\",\"de\":\"Gr??nland\",\"es\":\"Groenlandia\",\"fr\":\"Groenland\",\"ja\":\"?????????????????????\",\"it\":\"Groenlandia\",\"cn\":\"????????????\"}', '72.00000000', '-40.00000000', '????????', 'U+1F1EC U+1F1F1', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, NULL),
(87, 'Grenada', 'GRD', '308', 'GD', '1473', 'St. George\'s', 'XCD', '$', '.gd', 'Grenada', 'Americas', 'Caribbean', '[{\"zoneName\":\"America/Grenada\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Granada\",\"pt\":\"Granada\",\"nl\":\"Grenada\",\"hr\":\"Grenada\",\"fa\":\"????????????\",\"de\":\"Grenada\",\"es\":\"Grenada\",\"fr\":\"Grenade\",\"ja\":\"????????????\",\"it\":\"Grenada\",\"cn\":\"????????????\"}', '12.11666666', '-61.66666666', '????????', 'U+1F1EC U+1F1E9', '2018-07-20 20:11:03', '2021-12-04 08:15:19', 1, 'Q769'),
(88, 'Guadeloupe', 'GLP', '312', 'GP', '590', 'Basse-Terre', 'EUR', '???', '.gp', 'Guadeloupe', 'Americas', 'Caribbean', '[{\"zoneName\":\"America/Guadeloupe\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Guadalupe\",\"pt\":\"Guadalupe\",\"nl\":\"Guadeloupe\",\"hr\":\"Gvadalupa\",\"fa\":\"?????????? ??????????????\",\"de\":\"Guadeloupe\",\"es\":\"Guadalupe\",\"fr\":\"Guadeloupe\",\"ja\":\"??????????????????\",\"it\":\"Guadeloupa\",\"cn\":\"???????????????\"}', '16.25000000', '-61.58333300', '????????', 'U+1F1EC U+1F1F5', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, NULL),
(89, 'Guam', 'GUM', '316', 'GU', '1671', 'Hagatna', 'USD', '$', '.gu', 'Guam', 'Oceania', 'Micronesia', '[{\"zoneName\":\"Pacific/Guam\",\"gmtOffset\":36000,\"gmtOffsetName\":\"UTC+10:00\",\"abbreviation\":\"CHST\",\"tzName\":\"Chamorro Standard Time\"}]', '{\"kr\":\"???\",\"br\":\"Guam\",\"pt\":\"Guame\",\"nl\":\"Guam\",\"hr\":\"Guam\",\"fa\":\"????????\",\"de\":\"Guam\",\"es\":\"Guam\",\"fr\":\"Guam\",\"ja\":\"?????????\",\"it\":\"Guam\",\"cn\":\"??????\"}', '13.46666666', '144.78333333', '????????', 'U+1F1EC U+1F1FA', '2018-07-20 20:11:03', '2021-12-04 08:15:11', 1, NULL),
(90, 'Guatemala', 'GTM', '320', 'GT', '502', 'Guatemala City', 'GTQ', 'Q', '.gt', 'Guatemala', 'Americas', 'Central America', '[{\"zoneName\":\"America/Guatemala\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"}]', '{\"kr\":\"????????????\",\"br\":\"Guatemala\",\"pt\":\"Guatemala\",\"nl\":\"Guatemala\",\"hr\":\"Gvatemala\",\"fa\":\"????????????????\",\"de\":\"Guatemala\",\"es\":\"Guatemala\",\"fr\":\"Guatemala\",\"ja\":\"???????????????\",\"it\":\"Guatemala\",\"cn\":\"????????????\"}', '15.50000000', '-90.25000000', '????????', 'U+1F1EC U+1F1F9', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q774'),
(91, 'Guernsey and Alderney', 'GGY', '831', 'GG', '441481', 'St Peter Port', 'GBP', '??', '.gg', 'Guernsey', 'Europe', 'Northern Europe', '[{\"zoneName\":\"Europe/Guernsey\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC??00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"}]', '{\"kr\":\"??????, ?????????\",\"br\":\"Guernsey\",\"pt\":\"Guernsey\",\"nl\":\"Guernsey\",\"hr\":\"Guernsey\",\"fa\":\"??????????\",\"de\":\"Guernsey\",\"es\":\"Guernsey\",\"fr\":\"Guernesey\",\"ja\":\"???????????????\",\"it\":\"Guernsey\",\"cn\":\"?????????\"}', '49.46666666', '-2.58333333', '????????', 'U+1F1EC U+1F1EC', '2018-07-20 20:11:03', '2021-12-04 08:14:59', 1, NULL),
(92, 'Guinea', 'GIN', '324', 'GN', '224', 'Conakry', 'GNF', 'FG', '.gn', 'Guin??e', 'Africa', 'Western Africa', '[{\"zoneName\":\"Africa/Conakry\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC??00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"}]', '{\"kr\":\"??????\",\"br\":\"Guin??\",\"pt\":\"Guin??\",\"nl\":\"Guinee\",\"hr\":\"Gvineja\",\"fa\":\"????????\",\"de\":\"Guinea\",\"es\":\"Guinea\",\"fr\":\"Guin??e\",\"ja\":\"?????????\",\"it\":\"Guinea\",\"cn\":\"?????????\"}', '11.00000000', '-10.00000000', '????????', 'U+1F1EC U+1F1F3', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q1006'),
(93, 'Guinea-Bissau', 'GNB', '624', 'GW', '245', 'Bissau', 'XOF', 'CFA', '.gw', 'Guin??-Bissau', 'Africa', 'Western Africa', '[{\"zoneName\":\"Africa/Bissau\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC??00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"}]', '{\"kr\":\"???????????????\",\"br\":\"Guin??-Bissau\",\"pt\":\"Guin??-Bissau\",\"nl\":\"Guinee-Bissau\",\"hr\":\"Gvineja Bisau\",\"fa\":\"???????? ????????????\",\"de\":\"Guinea-Bissau\",\"es\":\"Guinea-Bis??u\",\"fr\":\"Guin??e-Bissau\",\"ja\":\"??????????????????\",\"it\":\"Guinea-Bissau\",\"cn\":\"???????????????\"}', '12.00000000', '-15.00000000', '????????', 'U+1F1EC U+1F1FC', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q1007'),
(94, 'Guyana', 'GUY', '328', 'GY', '592', 'Georgetown', 'GYD', '$', '.gy', 'Guyana', 'Americas', 'South America', '[{\"zoneName\":\"America/Guyana\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"GYT\",\"tzName\":\"Guyana Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Guiana\",\"pt\":\"Guiana\",\"nl\":\"Guyana\",\"hr\":\"Gvajana\",\"fa\":\"??????????\",\"de\":\"Guyana\",\"es\":\"Guyana\",\"fr\":\"Guyane\",\"ja\":\"????????????\",\"it\":\"Guyana\",\"cn\":\"?????????\"}', '5.00000000', '-59.00000000', '????????', 'U+1F1EC U+1F1FE', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q734'),
(95, 'Haiti', 'HTI', '332', 'HT', '509', 'Port-au-Prince', 'HTG', 'G', '.ht', 'Ha??ti', 'Americas', 'Caribbean', '[{\"zoneName\":\"America/Port-au-Prince\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America\"}]', '{\"kr\":\"?????????\",\"br\":\"Haiti\",\"pt\":\"Haiti\",\"nl\":\"Ha??ti\",\"hr\":\"Haiti\",\"fa\":\"????????????\",\"de\":\"Haiti\",\"es\":\"Haiti\",\"fr\":\"Ha??ti\",\"ja\":\"?????????\",\"it\":\"Haiti\",\"cn\":\"??????\"}', '19.00000000', '-72.41666666', '????????', 'U+1F1ED U+1F1F9', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q790'),
(96, 'Heard Island and McDonald Islands', 'HMD', '334', 'HM', '672', '', 'AUD', '$', '.hm', 'Heard Island and McDonald Islands', '', '', '[{\"zoneName\":\"Indian/Kerguelen\",\"gmtOffset\":18000,\"gmtOffsetName\":\"UTC+05:00\",\"abbreviation\":\"TFT\",\"tzName\":\"French Southern and Antarctic Time\"}]', '{\"kr\":\"?????? ???????????? ??????\",\"br\":\"Ilha Heard e Ilhas McDonald\",\"pt\":\"Ilha Heard e Ilhas McDonald\",\"nl\":\"Heard- en McDonaldeilanden\",\"hr\":\"Otok Heard i oto??je McDonald\",\"fa\":\"?????????? ?????? ?? ?????????? ???????????????????\",\"de\":\"Heard und die McDonaldinseln\",\"es\":\"Islas Heard y McDonald\",\"fr\":\"??les Heard-et-MacDonald\",\"ja\":\"???????????????????????????????????????\",\"it\":\"Isole Heard e McDonald\",\"cn\":\"????????????????????????????????\"}', '-53.10000000', '72.51666666', '????????', 'U+1F1ED U+1F1F2', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, NULL),
(97, 'Honduras', 'HND', '340', 'HN', '504', 'Tegucigalpa', 'HNL', 'L', '.hn', 'Honduras', 'Americas', 'Central America', '[{\"zoneName\":\"America/Tegucigalpa\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"}]', '{\"kr\":\"????????????\",\"br\":\"Honduras\",\"pt\":\"Honduras\",\"nl\":\"Honduras\",\"hr\":\"Honduras\",\"fa\":\"??????????????\",\"de\":\"Honduras\",\"es\":\"Honduras\",\"fr\":\"Honduras\",\"ja\":\"??????????????????\",\"it\":\"Honduras\",\"cn\":\"????????????\"}', '15.00000000', '-86.50000000', '????????', 'U+1F1ED U+1F1F3', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q783'),
(98, 'Hong Kong S.A.R.', 'HKG', '344', 'HK', '852', 'Hong Kong', 'HKD', '$', '.hk', '??????', 'Asia', 'Eastern Asia', '[{\"zoneName\":\"Asia/Hong_Kong\",\"gmtOffset\":28800,\"gmtOffsetName\":\"UTC+08:00\",\"abbreviation\":\"HKT\",\"tzName\":\"Hong Kong Time\"}]', '{\"kr\":\"??????\",\"br\":\"Hong Kong\",\"pt\":\"Hong Kong\",\"nl\":\"Hongkong\",\"hr\":\"Hong Kong\",\"fa\":\"???????????????\",\"de\":\"Hong Kong\",\"es\":\"Hong Kong\",\"fr\":\"Hong Kong\",\"ja\":\"??????\",\"it\":\"Hong Kong\",\"cn\":\"????????????\"}', '22.25000000', '114.16666666', '????????', 'U+1F1ED U+1F1F0', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q8646'),
(99, 'Hungary', 'HUN', '348', 'HU', '36', 'Budapest', 'HUF', 'Ft', '.hu', 'Magyarorsz??g', 'Europe', 'Eastern Europe', '[{\"zoneName\":\"Europe/Budapest\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Hungria\",\"pt\":\"Hungria\",\"nl\":\"Hongarije\",\"hr\":\"Ma??arska\",\"fa\":\"????????????????\",\"de\":\"Ungarn\",\"es\":\"Hungr??a\",\"fr\":\"Hongrie\",\"ja\":\"???????????????\",\"it\":\"Ungheria\",\"cn\":\"?????????\"}', '47.00000000', '20.00000000', '????????', 'U+1F1ED U+1F1FA', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q28'),
(100, 'Iceland', 'ISL', '352', 'IS', '354', 'Reykjavik', 'ISK', 'kr', '.is', '??sland', 'Europe', 'Northern Europe', '[{\"zoneName\":\"Atlantic/Reykjavik\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC??00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"}]', '{\"kr\":\"???????????????\",\"br\":\"Isl??ndia\",\"pt\":\"Isl??ndia\",\"nl\":\"IJsland\",\"hr\":\"Island\",\"fa\":\"????????????\",\"de\":\"Island\",\"es\":\"Islandia\",\"fr\":\"Islande\",\"ja\":\"??????????????????\",\"it\":\"Islanda\",\"cn\":\"??????\"}', '65.00000000', '-18.00000000', '????????', 'U+1F1EE U+1F1F8', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q189'),
(101, 'India', 'IND', '356', 'IN', '91', 'New Delhi', 'INR', '???', '.in', '????????????', 'Asia', 'Southern Asia', '[{\"zoneName\":\"Asia/Kolkata\",\"gmtOffset\":19800,\"gmtOffsetName\":\"UTC+05:30\",\"abbreviation\":\"IST\",\"tzName\":\"Indian Standard Time\"}]', '{\"kr\":\"??????\",\"br\":\"??ndia\",\"pt\":\"??ndia\",\"nl\":\"India\",\"hr\":\"Indija\",\"fa\":\"??????\",\"de\":\"Indien\",\"es\":\"India\",\"fr\":\"Inde\",\"ja\":\"?????????\",\"it\":\"India\",\"cn\":\"??????\"}', '20.00000000', '77.00000000', '????????', 'U+1F1EE U+1F1F3', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q668'),
(102, 'Indonesia', 'IDN', '360', 'ID', '62', 'Jakarta', 'IDR', 'Rp', '.id', 'Indonesia', 'Asia', 'South-Eastern Asia', '[{\"zoneName\":\"Asia/Jakarta\",\"gmtOffset\":25200,\"gmtOffsetName\":\"UTC+07:00\",\"abbreviation\":\"WIB\",\"tzName\":\"Western Indonesian Time\"},{\"zoneName\":\"Asia/Jayapura\",\"gmtOffset\":32400,\"gmtOffsetName\":\"UTC+09:00\",\"abbreviation\":\"WIT\",\"tzName\":\"Eastern Indonesian Time\"},{\"zoneName\":\"Asia/Makassar\",\"gmtOffset\":28800,\"gmtOffsetName\":\"UTC+08:00\",\"abbreviation\":\"WITA\",\"tzName\":\"Central Indonesia Time\"},{\"zoneName\":\"Asia/Pontianak\",\"gmtOffset\":25200,\"gmtOffsetName\":\"UTC+07:00\",\"abbreviation\":\"WIB\",\"tzName\":\"Western Indonesian Time\"}]', '{\"kr\":\"???????????????\",\"br\":\"Indon??sia\",\"pt\":\"Indon??sia\",\"nl\":\"Indonesi??\",\"hr\":\"Indonezija\",\"fa\":\"??????????????\",\"de\":\"Indonesien\",\"es\":\"Indonesia\",\"fr\":\"Indon??sie\",\"ja\":\"??????????????????\",\"it\":\"Indonesia\",\"cn\":\"???????????????\"}', '-5.00000000', '120.00000000', '????????', 'U+1F1EE U+1F1E9', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q252'),
(103, 'Iran', 'IRN', '364', 'IR', '98', 'Tehran', 'IRR', '???', '.ir', '??????????', 'Asia', 'Southern Asia', '[{\"zoneName\":\"Asia/Tehran\",\"gmtOffset\":12600,\"gmtOffsetName\":\"UTC+03:30\",\"abbreviation\":\"IRDT\",\"tzName\":\"Iran Daylight Time\"}]', '{\"kr\":\"??????\",\"br\":\"Ir??\",\"pt\":\"Ir??o\",\"nl\":\"Iran\",\"hr\":\"Iran\",\"fa\":\"??????????\",\"de\":\"Iran\",\"es\":\"Iran\",\"fr\":\"Iran\",\"ja\":\"?????????????????????????????????\",\"cn\":\"??????\"}', '32.00000000', '53.00000000', '????????', 'U+1F1EE U+1F1F7', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q794'),
(104, 'Iraq', 'IRQ', '368', 'IQ', '964', 'Baghdad', 'IQD', '??.??', '.iq', '????????????', 'Asia', 'Western Asia', '[{\"zoneName\":\"Asia/Baghdad\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"AST\",\"tzName\":\"Arabia Standard Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Iraque\",\"pt\":\"Iraque\",\"nl\":\"Irak\",\"hr\":\"Irak\",\"fa\":\"????????\",\"de\":\"Irak\",\"es\":\"Irak\",\"fr\":\"Irak\",\"ja\":\"?????????\",\"it\":\"Iraq\",\"cn\":\"?????????\"}', '33.00000000', '44.00000000', '????????', 'U+1F1EE U+1F1F6', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q796'),
(105, 'Ireland', 'IRL', '372', 'IE', '353', 'Dublin', 'EUR', '???', '.ie', '??ire', 'Europe', 'Northern Europe', '[{\"zoneName\":\"Europe/Dublin\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC??00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Irlanda\",\"pt\":\"Irlanda\",\"nl\":\"Ierland\",\"hr\":\"Irska\",\"fa\":\"????????????\",\"de\":\"Irland\",\"es\":\"Irlanda\",\"fr\":\"Irlande\",\"ja\":\"??????????????????\",\"it\":\"Irlanda\",\"cn\":\"?????????\"}', '53.00000000', '-8.00000000', '????????', 'U+1F1EE U+1F1EA', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q27'),
(106, 'Israel', 'ISR', '376', 'IL', '972', 'Jerusalem', 'ILS', '???', '.il', '????????????????????', 'Asia', 'Western Asia', '[{\"zoneName\":\"Asia/Jerusalem\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"IST\",\"tzName\":\"Israel Standard Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Israel\",\"pt\":\"Israel\",\"nl\":\"Isra??l\",\"hr\":\"Izrael\",\"fa\":\"??????????????\",\"de\":\"Israel\",\"es\":\"Israel\",\"fr\":\"Isra??l\",\"ja\":\"???????????????\",\"it\":\"Israele\",\"cn\":\"?????????\"}', '31.50000000', '34.75000000', '????????', 'U+1F1EE U+1F1F1', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q801'),
(107, 'Italy', 'ITA', '380', 'IT', '39', 'Rome', 'EUR', '???', '.it', 'Italia', 'Europe', 'Southern Europe', '[{\"zoneName\":\"Europe/Rome\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"????????????\",\"br\":\"It??lia\",\"pt\":\"It??lia\",\"nl\":\"Itali??\",\"hr\":\"Italija\",\"fa\":\"??????????????\",\"de\":\"Italien\",\"es\":\"Italia\",\"fr\":\"Italie\",\"ja\":\"????????????\",\"it\":\"Italia\",\"cn\":\"?????????\"}', '42.83333333', '12.83333333', '????????', 'U+1F1EE U+1F1F9', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q38'),
(108, 'Jamaica', 'JAM', '388', 'JM', '1876', 'Kingston', 'JMD', 'J$', '.jm', 'Jamaica', 'Americas', 'Caribbean', '[{\"zoneName\":\"America/Jamaica\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America\"}]', '{\"kr\":\"????????????\",\"br\":\"Jamaica\",\"pt\":\"Jamaica\",\"nl\":\"Jamaica\",\"hr\":\"Jamajka\",\"fa\":\"????????????????\",\"de\":\"Jamaika\",\"es\":\"Jamaica\",\"fr\":\"Jama??que\",\"ja\":\"???????????????\",\"it\":\"Giamaica\",\"cn\":\"?????????\"}', '18.25000000', '-77.50000000', '????????', 'U+1F1EF U+1F1F2', '2018-07-20 20:11:03', '2021-12-04 08:14:46', 1, 'Q766'),
(109, 'Japan', 'JPN', '392', 'JP', '81', 'Tokyo', 'JPY', '??', '.jp', '??????', 'Asia', 'Eastern Asia', '[{\"zoneName\":\"Asia/Tokyo\",\"gmtOffset\":32400,\"gmtOffsetName\":\"UTC+09:00\",\"abbreviation\":\"JST\",\"tzName\":\"Japan Standard Time\"}]', '{\"kr\":\"??????\",\"br\":\"Jap??o\",\"pt\":\"Jap??o\",\"nl\":\"Japan\",\"hr\":\"Japan\",\"fa\":\"????????\",\"de\":\"Japan\",\"es\":\"Jap??n\",\"fr\":\"Japon\",\"ja\":\"??????\",\"it\":\"Giappone\",\"cn\":\"??????\"}', '36.00000000', '138.00000000', '????????', 'U+1F1EF U+1F1F5', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q17'),
(110, 'Jersey', 'JEY', '832', 'JE', '441534', 'Saint Helier', 'GBP', '??', '.je', 'Jersey', 'Europe', 'Northern Europe', '[{\"zoneName\":\"Europe/Jersey\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC??00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"}]', '{\"kr\":\"?????? ???\",\"br\":\"Jersey\",\"pt\":\"Jersey\",\"nl\":\"Jersey\",\"hr\":\"Jersey\",\"fa\":\"????????\",\"de\":\"Jersey\",\"es\":\"Jersey\",\"fr\":\"Jersey\",\"ja\":\"???????????????\",\"it\":\"Isola di Jersey\",\"cn\":\"?????????\"}', '49.25000000', '-2.16666666', '????????', 'U+1F1EF U+1F1EA', '2018-07-20 20:11:03', '2021-12-04 08:14:40', 1, 'Q785'),
(111, 'Jordan', 'JOR', '400', 'JO', '962', 'Amman', 'JOD', '??.??', '.jo', '????????????', 'Asia', 'Western Asia', '[{\"zoneName\":\"Asia/Amman\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Jord??nia\",\"pt\":\"Jord??nia\",\"nl\":\"Jordani??\",\"hr\":\"Jordan\",\"fa\":\"????????\",\"de\":\"Jordanien\",\"es\":\"Jordania\",\"fr\":\"Jordanie\",\"ja\":\"????????????\",\"it\":\"Giordania\",\"cn\":\"??????\"}', '31.00000000', '36.00000000', '????????', 'U+1F1EF U+1F1F4', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q810'),
(112, 'Kazakhstan', 'KAZ', '398', 'KZ', '7', 'Astana', 'KZT', '????', '.kz', '??????????????????', 'Asia', 'Central Asia', '[{\"zoneName\":\"Asia/Almaty\",\"gmtOffset\":21600,\"gmtOffsetName\":\"UTC+06:00\",\"abbreviation\":\"ALMT\",\"tzName\":\"Alma-Ata Time[1\"},{\"zoneName\":\"Asia/Aqtau\",\"gmtOffset\":18000,\"gmtOffsetName\":\"UTC+05:00\",\"abbreviation\":\"AQTT\",\"tzName\":\"Aqtobe Time\"},{\"zoneName\":\"Asia/Aqtobe\",\"gmtOffset\":18000,\"gmtOffsetName\":\"UTC+05:00\",\"abbreviation\":\"AQTT\",\"tzName\":\"Aqtobe Time\"},{\"zoneName\":\"Asia/Atyrau\",\"gmtOffset\":18000,\"gmtOffsetName\":\"UTC+05:00\",\"abbreviation\":\"MSD+1\",\"tzName\":\"Moscow Daylight Time+1\"},{\"zoneName\":\"Asia/Oral\",\"gmtOffset\":18000,\"gmtOffsetName\":\"UTC+05:00\",\"abbreviation\":\"ORAT\",\"tzName\":\"Oral Time\"},{\"zoneName\":\"Asia/Qostanay\",\"gmtOffset\":21600,\"gmtOffsetName\":\"UTC+06:00\",\"abbreviation\":\"QYZST\",\"tzName\":\"Qyzylorda Summer Time\"},{\"zoneName\":\"Asia/Qyzylorda\",\"gmtOffset\":18000,\"gmtOffsetName\":\"UTC+05:00\",\"abbreviation\":\"QYZT\",\"tzName\":\"Qyzylorda Summer Time\"}]', '{\"kr\":\"???????????????\",\"br\":\"Cazaquist??o\",\"pt\":\"Cazaquist??o\",\"nl\":\"Kazachstan\",\"hr\":\"Kazahstan\",\"fa\":\"????????????????\",\"de\":\"Kasachstan\",\"es\":\"Kazajist??n\",\"fr\":\"Kazakhstan\",\"ja\":\"??????????????????\",\"it\":\"Kazakistan\",\"cn\":\"???????????????\"}', '48.00000000', '68.00000000', '????????', 'U+1F1F0 U+1F1FF', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q232'),
(113, 'Kenya', 'KEN', '404', 'KE', '254', 'Nairobi', 'KES', 'KSh', '.ke', 'Kenya', 'Africa', 'Eastern Africa', '[{\"zoneName\":\"Africa/Nairobi\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"EAT\",\"tzName\":\"East Africa Time\"}]', '{\"kr\":\"??????\",\"br\":\"Qu??nia\",\"pt\":\"Qu??nia\",\"nl\":\"Kenia\",\"hr\":\"Kenija\",\"fa\":\"????????\",\"de\":\"Kenia\",\"es\":\"Kenia\",\"fr\":\"Kenya\",\"ja\":\"?????????\",\"it\":\"Kenya\",\"cn\":\"?????????\"}', '1.00000000', '38.00000000', '????????', 'U+1F1F0 U+1F1EA', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q114'),
(114, 'Kiribati', 'KIR', '296', 'KI', '686', 'Tarawa', 'AUD', '$', '.ki', 'Kiribati', 'Oceania', 'Micronesia', '[{\"zoneName\":\"Pacific/Enderbury\",\"gmtOffset\":46800,\"gmtOffsetName\":\"UTC+13:00\",\"abbreviation\":\"PHOT\",\"tzName\":\"Phoenix Island Time\"},{\"zoneName\":\"Pacific/Kiritimati\",\"gmtOffset\":50400,\"gmtOffsetName\":\"UTC+14:00\",\"abbreviation\":\"LINT\",\"tzName\":\"Line Islands Time\"},{\"zoneName\":\"Pacific/Tarawa\",\"gmtOffset\":43200,\"gmtOffsetName\":\"UTC+12:00\",\"abbreviation\":\"GILT\",\"tzName\":\"Gilbert Island Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Kiribati\",\"pt\":\"Quirib??ti\",\"nl\":\"Kiribati\",\"hr\":\"Kiribati\",\"fa\":\"????????????????\",\"de\":\"Kiribati\",\"es\":\"Kiribati\",\"fr\":\"Kiribati\",\"ja\":\"????????????\",\"it\":\"Kiribati\",\"cn\":\"????????????\"}', '1.41666666', '173.00000000', '????????', 'U+1F1F0 U+1F1EE', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q710'),
(115, 'North Korea', 'PRK', '408', 'KP', '850', 'Pyongyang', 'KPW', '???', '.kp', '??????', 'Asia', 'Eastern Asia', '[{\"zoneName\":\"Asia/Pyongyang\",\"gmtOffset\":32400,\"gmtOffsetName\":\"UTC+09:00\",\"abbreviation\":\"KST\",\"tzName\":\"Korea Standard Time\"}]', '{\"kr\":\"?????????????????????????????????\",\"br\":\"Coreia do Norte\",\"pt\":\"Coreia do Norte\",\"nl\":\"Noord-Korea\",\"hr\":\"Sjeverna Koreja\",\"fa\":\"?????? ??????????\",\"de\":\"Nordkorea\",\"es\":\"Corea del Norte\",\"fr\":\"Cor??e du Nord\",\"ja\":\"?????????????????????????????????\",\"it\":\"Corea del Nord\",\"cn\":\"??????\"}', '40.00000000', '127.00000000', '????????', 'U+1F1F0 U+1F1F5', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q423'),
(116, 'South Korea', 'KOR', '410', 'KR', '82', 'Seoul', 'KRW', '???', '.kr', '????????????', 'Asia', 'Eastern Asia', '[{\"zoneName\":\"Asia/Seoul\",\"gmtOffset\":32400,\"gmtOffsetName\":\"UTC+09:00\",\"abbreviation\":\"KST\",\"tzName\":\"Korea Standard Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Coreia do Sul\",\"pt\":\"Coreia do Sul\",\"nl\":\"Zuid-Korea\",\"hr\":\"Ju??na Koreja\",\"fa\":\"?????? ??????????\",\"de\":\"S??dkorea\",\"es\":\"Corea del Sur\",\"fr\":\"Cor??e du Sud\",\"ja\":\"????????????\",\"it\":\"Corea del Sud\",\"cn\":\"??????\"}', '37.00000000', '127.50000000', '????????', 'U+1F1F0 U+1F1F7', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q884'),
(117, 'Kuwait', 'KWT', '414', 'KW', '965', 'Kuwait City', 'KWD', '??.??', '.kw', '????????????', 'Asia', 'Western Asia', '[{\"zoneName\":\"Asia/Kuwait\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"AST\",\"tzName\":\"Arabia Standard Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Kuwait\",\"pt\":\"Kuwait\",\"nl\":\"Koeweit\",\"hr\":\"Kuvajt\",\"fa\":\"????????\",\"de\":\"Kuwait\",\"es\":\"Kuwait\",\"fr\":\"Kowe??t\",\"ja\":\"???????????????\",\"it\":\"Kuwait\",\"cn\":\"?????????\"}', '29.50000000', '45.75000000', '????????', 'U+1F1F0 U+1F1FC', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q817'),
(118, 'Kyrgyzstan', 'KGZ', '417', 'KG', '996', 'Bishkek', 'KGS', '????', '.kg', '????????????????????', 'Asia', 'Central Asia', '[{\"zoneName\":\"Asia/Bishkek\",\"gmtOffset\":21600,\"gmtOffsetName\":\"UTC+06:00\",\"abbreviation\":\"KGT\",\"tzName\":\"Kyrgyzstan Time\"}]', '{\"kr\":\"??????????????????\",\"br\":\"Quirguist??o\",\"pt\":\"Quirguizist??o\",\"nl\":\"Kirgizi??\",\"hr\":\"Kirgistan\",\"fa\":\"??????????????????\",\"de\":\"Kirgisistan\",\"es\":\"Kirguizist??n\",\"fr\":\"Kirghizistan\",\"ja\":\"????????????\",\"it\":\"Kirghizistan\",\"cn\":\"??????????????????\"}', '41.00000000', '75.00000000', '????????', 'U+1F1F0 U+1F1EC', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q813'),
(119, 'Laos', 'LAO', '418', 'LA', '856', 'Vientiane', 'LAK', '???', '.la', '??????????????????', 'Asia', 'South-Eastern Asia', '[{\"zoneName\":\"Asia/Vientiane\",\"gmtOffset\":25200,\"gmtOffsetName\":\"UTC+07:00\",\"abbreviation\":\"ICT\",\"tzName\":\"Indochina Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Laos\",\"pt\":\"Laos\",\"nl\":\"Laos\",\"hr\":\"Laos\",\"fa\":\"??????????\",\"de\":\"Laos\",\"es\":\"Laos\",\"fr\":\"Laos\",\"ja\":\"??????????????????????????????\",\"it\":\"Laos\",\"cn\":\"????????????????????????\"}', '18.00000000', '105.00000000', '????????', 'U+1F1F1 U+1F1E6', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q819'),
(120, 'Latvia', 'LVA', '428', 'LV', '371', 'Riga', 'EUR', '???', '.lv', 'Latvija', 'Europe', 'Northern Europe', '[{\"zoneName\":\"Europe/Riga\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Let??nia\",\"pt\":\"Let??nia\",\"nl\":\"Letland\",\"hr\":\"Latvija\",\"fa\":\"??????????\",\"de\":\"Lettland\",\"es\":\"Letonia\",\"fr\":\"Lettonie\",\"ja\":\"????????????\",\"it\":\"Lettonia\",\"cn\":\"????????????\"}', '57.00000000', '25.00000000', '????????', 'U+1F1F1 U+1F1FB', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q211'),
(121, 'Lebanon', 'LBN', '422', 'LB', '961', 'Beirut', 'LBP', '??', '.lb', '??????????', 'Asia', 'Western Asia', '[{\"zoneName\":\"Asia/Beirut\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"}]', '{\"kr\":\"?????????\",\"br\":\"L??bano\",\"pt\":\"L??bano\",\"nl\":\"Libanon\",\"hr\":\"Libanon\",\"fa\":\"??????????\",\"de\":\"Libanon\",\"es\":\"L??bano\",\"fr\":\"Liban\",\"ja\":\"????????????\",\"it\":\"Libano\",\"cn\":\"?????????\"}', '33.83333333', '35.83333333', '????????', 'U+1F1F1 U+1F1E7', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q822'),
(122, 'Lesotho', 'LSO', '426', 'LS', '266', 'Maseru', 'LSL', 'L', '.ls', 'Lesotho', 'Africa', 'Southern Africa', '[{\"zoneName\":\"Africa/Maseru\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"SAST\",\"tzName\":\"South African Standard Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Lesoto\",\"pt\":\"Lesoto\",\"nl\":\"Lesotho\",\"hr\":\"Lesoto\",\"fa\":\"??????????\",\"de\":\"Lesotho\",\"es\":\"Lesotho\",\"fr\":\"Lesotho\",\"ja\":\"?????????\",\"it\":\"Lesotho\",\"cn\":\"?????????\"}', '-29.50000000', '28.50000000', '????????', 'U+1F1F1 U+1F1F8', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q1013'),
(123, 'Liberia', 'LBR', '430', 'LR', '231', 'Monrovia', 'LRD', '$', '.lr', 'Liberia', 'Africa', 'Western Africa', '[{\"zoneName\":\"Africa/Monrovia\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC??00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"}]', '{\"kr\":\"???????????????\",\"br\":\"Lib??ria\",\"pt\":\"Lib??ria\",\"nl\":\"Liberia\",\"hr\":\"Liberija\",\"fa\":\"????????????\",\"de\":\"Liberia\",\"es\":\"Liberia\",\"fr\":\"Liberia\",\"ja\":\"????????????\",\"it\":\"Liberia\",\"cn\":\"????????????\"}', '6.50000000', '-9.50000000', '????????', 'U+1F1F1 U+1F1F7', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q1014'),
(124, 'Libya', 'LBY', '434', 'LY', '218', 'Tripolis', 'LYD', '??.??', '.ly', '?????????????', 'Africa', 'Northern Africa', '[{\"zoneName\":\"Africa/Tripoli\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"}]', '{\"kr\":\"?????????\",\"br\":\"L??bia\",\"pt\":\"L??bia\",\"nl\":\"Libi??\",\"hr\":\"Libija\",\"fa\":\"????????\",\"de\":\"Libyen\",\"es\":\"Libia\",\"fr\":\"Libye\",\"ja\":\"?????????\",\"it\":\"Libia\",\"cn\":\"?????????\"}', '25.00000000', '17.00000000', '????????', 'U+1F1F1 U+1F1FE', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q1016'),
(125, 'Liechtenstein', 'LIE', '438', 'LI', '423', 'Vaduz', 'CHF', 'CHf', '.li', 'Liechtenstein', 'Europe', 'Western Europe', '[{\"zoneName\":\"Europe/Vaduz\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"??????????????????\",\"br\":\"Liechtenstein\",\"pt\":\"Listenstaine\",\"nl\":\"Liechtenstein\",\"hr\":\"Lihten??tajn\",\"fa\":\"?????????????????????????\",\"de\":\"Liechtenstein\",\"es\":\"Liechtenstein\",\"fr\":\"Liechtenstein\",\"ja\":\"???????????????????????????\",\"it\":\"Liechtenstein\",\"cn\":\"???????????????\"}', '47.26666666', '9.53333333', '????????', 'U+1F1F1 U+1F1EE', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q347'),
(126, 'Lithuania', 'LTU', '440', 'LT', '370', 'Vilnius', 'EUR', '???', '.lt', 'Lietuva', 'Europe', 'Northern Europe', '[{\"zoneName\":\"Europe/Vilnius\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"}]', '{\"kr\":\"???????????????\",\"br\":\"Litu??nia\",\"pt\":\"Litu??nia\",\"nl\":\"Litouwen\",\"hr\":\"Litva\",\"fa\":\"??????????????\",\"de\":\"Litauen\",\"es\":\"Lituania\",\"fr\":\"Lituanie\",\"ja\":\"???????????????\",\"it\":\"Lituania\",\"cn\":\"?????????\"}', '56.00000000', '24.00000000', '????????', 'U+1F1F1 U+1F1F9', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q37'),
(127, 'Luxembourg', 'LUX', '442', 'LU', '352', 'Luxembourg', 'EUR', '???', '.lu', 'Luxembourg', 'Europe', 'Western Europe', '[{\"zoneName\":\"Europe/Luxembourg\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"???????????????\",\"br\":\"Luxemburgo\",\"pt\":\"Luxemburgo\",\"nl\":\"Luxemburg\",\"hr\":\"Luksemburg\",\"fa\":\"????????????????????\",\"de\":\"Luxemburg\",\"es\":\"Luxemburgo\",\"fr\":\"Luxembourg\",\"ja\":\"?????????????????????\",\"it\":\"Lussemburgo\",\"cn\":\"?????????\"}', '49.75000000', '6.16666666', '????????', 'U+1F1F1 U+1F1FA', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q32'),
(128, 'Macau S.A.R.', 'MAC', '446', 'MO', '853', 'Macao', 'MOP', '$', '.mo', '??????', 'Asia', 'Eastern Asia', '[{\"zoneName\":\"Asia/Macau\",\"gmtOffset\":28800,\"gmtOffsetName\":\"UTC+08:00\",\"abbreviation\":\"CST\",\"tzName\":\"China Standard Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Macau\",\"pt\":\"Macau\",\"nl\":\"Macao\",\"hr\":\"Makao\",\"fa\":\"??????????\",\"de\":\"Macao\",\"es\":\"Macao\",\"fr\":\"Macao\",\"ja\":\"?????????\",\"it\":\"Macao\",\"cn\":\"????????????\"}', '22.16666666', '113.55000000', '????????', 'U+1F1F2 U+1F1F4', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, NULL),
(129, 'Macedonia', 'MKD', '807', 'MK', '389', 'Skopje', 'MKD', '??????', '.mk', '?????????????? ????????????????????', 'Europe', 'Southern Europe', '[{\"zoneName\":\"Europe/Skopje\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"???????????????\",\"br\":\"Maced??nia\",\"pt\":\"Maced??nia\",\"nl\":\"Macedoni??\",\"hr\":\"Makedonija\",\"fa\":\"\",\"de\":\"Mazedonien\",\"es\":\"Macedonia\",\"fr\":\"Mac??doine\",\"ja\":\"????????????????????????????????????????????????\",\"it\":\"Macedonia\",\"cn\":\"?????????\"}', '41.83333333', '22.00000000', '????????', 'U+1F1F2 U+1F1F0', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q221'),
(130, 'Madagascar', 'MDG', '450', 'MG', '261', 'Antananarivo', 'MGA', 'Ar', '.mg', 'Madagasikara', 'Africa', 'Eastern Africa', '[{\"zoneName\":\"Indian/Antananarivo\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"EAT\",\"tzName\":\"East Africa Time\"}]', '{\"kr\":\"??????????????????\",\"br\":\"Madagascar\",\"pt\":\"Madag??scar\",\"nl\":\"Madagaskar\",\"hr\":\"Madagaskar\",\"fa\":\"????????????????????\",\"de\":\"Madagaskar\",\"es\":\"Madagascar\",\"fr\":\"Madagascar\",\"ja\":\"??????????????????\",\"it\":\"Madagascar\",\"cn\":\"???????????????\"}', '-20.00000000', '47.00000000', '????????', 'U+1F1F2 U+1F1EC', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q1019'),
(131, 'Malawi', 'MWI', '454', 'MW', '265', 'Lilongwe', 'MWK', 'MK', '.mw', 'Malawi', 'Africa', 'Eastern Africa', '[{\"zoneName\":\"Africa/Blantyre\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"CAT\",\"tzName\":\"Central Africa Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Malawi\",\"pt\":\"Mal??vi\",\"nl\":\"Malawi\",\"hr\":\"Malavi\",\"fa\":\"????????????\",\"de\":\"Malawi\",\"es\":\"Malawi\",\"fr\":\"Malawi\",\"ja\":\"????????????\",\"it\":\"Malawi\",\"cn\":\"?????????\"}', '-13.50000000', '34.00000000', '????????', 'U+1F1F2 U+1F1FC', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q1020'),
(132, 'Malaysia', 'MYS', '458', 'MY', '60', 'Kuala Lumpur', 'MYR', 'RM', '.my', 'Malaysia', 'Asia', 'South-Eastern Asia', '[{\"zoneName\":\"Asia/Kuala_Lumpur\",\"gmtOffset\":28800,\"gmtOffsetName\":\"UTC+08:00\",\"abbreviation\":\"MYT\",\"tzName\":\"Malaysia Time\"},{\"zoneName\":\"Asia/Kuching\",\"gmtOffset\":28800,\"gmtOffsetName\":\"UTC+08:00\",\"abbreviation\":\"MYT\",\"tzName\":\"Malaysia Time\"}]', '{\"kr\":\"???????????????\",\"br\":\"Mal??sia\",\"pt\":\"Mal??sia\",\"nl\":\"Maleisi??\",\"hr\":\"Malezija\",\"fa\":\"??????????\",\"de\":\"Malaysia\",\"es\":\"Malasia\",\"fr\":\"Malaisie\",\"ja\":\"???????????????\",\"it\":\"Malesia\",\"cn\":\"????????????\"}', '2.50000000', '112.50000000', '????????', 'U+1F1F2 U+1F1FE', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q833'),
(133, 'Maldives', 'MDV', '462', 'MV', '960', 'Male', 'MVR', 'Rf', '.mv', 'Maldives', 'Asia', 'Southern Asia', '[{\"zoneName\":\"Indian/Maldives\",\"gmtOffset\":18000,\"gmtOffsetName\":\"UTC+05:00\",\"abbreviation\":\"MVT\",\"tzName\":\"Maldives Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Maldivas\",\"pt\":\"Maldivas\",\"nl\":\"Maldiven\",\"hr\":\"Maldivi\",\"fa\":\"????????????\",\"de\":\"Malediven\",\"es\":\"Maldivas\",\"fr\":\"Maldives\",\"ja\":\"???????????????\",\"it\":\"Maldive\",\"cn\":\"????????????\"}', '3.25000000', '73.00000000', '????????', 'U+1F1F2 U+1F1FB', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q826'),
(134, 'Mali', 'MLI', '466', 'ML', '223', 'Bamako', 'XOF', 'CFA', '.ml', 'Mali', 'Africa', 'Western Africa', '[{\"zoneName\":\"Africa/Bamako\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC??00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"}]', '{\"kr\":\"??????\",\"br\":\"Mali\",\"pt\":\"Mali\",\"nl\":\"Mali\",\"hr\":\"Mali\",\"fa\":\"????????\",\"de\":\"Mali\",\"es\":\"Mali\",\"fr\":\"Mali\",\"ja\":\"??????\",\"it\":\"Mali\",\"cn\":\"??????\"}', '17.00000000', '-4.00000000', '????????', 'U+1F1F2 U+1F1F1', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q912');
INSERT INTO `countries` (`id`, `name`, `iso3`, `numeric_code`, `iso2`, `phonecode`, `capital`, `currency`, `currency_symbol`, `tld`, `native`, `region`, `subregion`, `timezones`, `translations`, `latitude`, `longitude`, `emoji`, `emojiU`, `created_at`, `updated_at`, `flag`, `wikiDataId`) VALUES
(135, 'Malta', 'MLT', '470', 'MT', '356', 'Valletta', 'EUR', '???', '.mt', 'Malta', 'Europe', 'Southern Europe', '[{\"zoneName\":\"Europe/Malta\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"??????\",\"br\":\"Malta\",\"pt\":\"Malta\",\"nl\":\"Malta\",\"hr\":\"Malta\",\"fa\":\"????????\",\"de\":\"Malta\",\"es\":\"Malta\",\"fr\":\"Malte\",\"ja\":\"?????????\",\"it\":\"Malta\",\"cn\":\"?????????\"}', '35.83333333', '14.58333333', '????????', 'U+1F1F2 U+1F1F9', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q233'),
(136, 'Man (Isle of)', 'IMN', '833', 'IM', '441624', 'Douglas, Isle of Man', 'GBP', '??', '.im', 'Isle of Man', 'Europe', 'Northern Europe', '[{\"zoneName\":\"Europe/Isle_of_Man\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC??00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"}]', '{\"kr\":\"??? ???\",\"br\":\"Ilha de Man\",\"pt\":\"Ilha de Man\",\"nl\":\"Isle of Man\",\"hr\":\"Otok Man\",\"fa\":\"?????????? ????\",\"de\":\"Insel Man\",\"es\":\"Isla de Man\",\"fr\":\"??le de Man\",\"ja\":\"?????????\",\"it\":\"Isola di Man\",\"cn\":\"?????????\"}', '54.25000000', '-4.50000000', '????????', 'U+1F1EE U+1F1F2', '2018-07-20 20:11:03', '2021-12-04 08:14:27', 1, NULL),
(137, 'Marshall Islands', 'MHL', '584', 'MH', '692', 'Majuro', 'USD', '$', '.mh', 'M??aje??', 'Oceania', 'Micronesia', '[{\"zoneName\":\"Pacific/Kwajalein\",\"gmtOffset\":43200,\"gmtOffsetName\":\"UTC+12:00\",\"abbreviation\":\"MHT\",\"tzName\":\"Marshall Islands Time\"},{\"zoneName\":\"Pacific/Majuro\",\"gmtOffset\":43200,\"gmtOffsetName\":\"UTC+12:00\",\"abbreviation\":\"MHT\",\"tzName\":\"Marshall Islands Time\"}]', '{\"kr\":\"?????? ??????\",\"br\":\"Ilhas Marshall\",\"pt\":\"Ilhas Marshall\",\"nl\":\"Marshalleilanden\",\"hr\":\"Mar??alovi Otoci\",\"fa\":\"?????????? ????????????\",\"de\":\"Marshallinseln\",\"es\":\"Islas Marshall\",\"fr\":\"??les Marshall\",\"ja\":\"?????????????????????\",\"it\":\"Isole Marshall\",\"cn\":\"???????????????\"}', '9.00000000', '168.00000000', '????????', 'U+1F1F2 U+1F1ED', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q709'),
(138, 'Martinique', 'MTQ', '474', 'MQ', '596', 'Fort-de-France', 'EUR', '???', '.mq', 'Martinique', 'Americas', 'Caribbean', '[{\"zoneName\":\"America/Martinique\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]', '{\"kr\":\"???????????????\",\"br\":\"Martinica\",\"pt\":\"Martinica\",\"nl\":\"Martinique\",\"hr\":\"Martinique\",\"fa\":\"????????????????\",\"de\":\"Martinique\",\"es\":\"Martinica\",\"fr\":\"Martinique\",\"ja\":\"?????????????????????\",\"it\":\"Martinica\",\"cn\":\"???????????????\"}', '14.66666700', '-61.00000000', '????????', 'U+1F1F2 U+1F1F6', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, NULL),
(139, 'Mauritania', 'MRT', '478', 'MR', '222', 'Nouakchott', 'MRO', 'MRU', '.mr', '??????????????????', 'Africa', 'Western Africa', '[{\"zoneName\":\"Africa/Nouakchott\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC??00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Maurit??nia\",\"pt\":\"Maurit??nia\",\"nl\":\"Mauritani??\",\"hr\":\"Mauritanija\",\"fa\":\"????????????????\",\"de\":\"Mauretanien\",\"es\":\"Mauritania\",\"fr\":\"Mauritanie\",\"ja\":\"??????????????????\",\"it\":\"Mauritania\",\"cn\":\"???????????????\"}', '20.00000000', '-12.00000000', '????????', 'U+1F1F2 U+1F1F7', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q1025'),
(140, 'Mauritius', 'MUS', '480', 'MU', '230', 'Port Louis', 'MUR', '???', '.mu', 'Maurice', 'Africa', 'Eastern Africa', '[{\"zoneName\":\"Indian/Mauritius\",\"gmtOffset\":14400,\"gmtOffsetName\":\"UTC+04:00\",\"abbreviation\":\"MUT\",\"tzName\":\"Mauritius Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Maur??cio\",\"pt\":\"Maur??cia\",\"nl\":\"Mauritius\",\"hr\":\"Mauricijus\",\"fa\":\"??????????\",\"de\":\"Mauritius\",\"es\":\"Mauricio\",\"fr\":\"??le Maurice\",\"ja\":\"??????????????????\",\"it\":\"Mauritius\",\"cn\":\"????????????\"}', '-20.28333333', '57.55000000', '????????', 'U+1F1F2 U+1F1FA', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q1027'),
(141, 'Mayotte', 'MYT', '175', 'YT', '262', 'Mamoudzou', 'EUR', '???', '.yt', 'Mayotte', 'Africa', 'Eastern Africa', '[{\"zoneName\":\"Indian/Mayotte\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"EAT\",\"tzName\":\"East Africa Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Mayotte\",\"pt\":\"Mayotte\",\"nl\":\"Mayotte\",\"hr\":\"Mayotte\",\"fa\":\"??????????\",\"de\":\"Mayotte\",\"es\":\"Mayotte\",\"fr\":\"Mayotte\",\"ja\":\"????????????\",\"it\":\"Mayotte\",\"cn\":\"?????????\"}', '-12.83333333', '45.16666666', '????????', 'U+1F1FE U+1F1F9', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, NULL),
(142, 'Mexico', 'MEX', '484', 'MX', '52', 'Mexico City', 'MXN', '$', '.mx', 'M??xico', 'Americas', 'Central America', '[{\"zoneName\":\"America/Bahia_Banderas\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"},{\"zoneName\":\"America/Cancun\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America\"},{\"zoneName\":\"America/Chihuahua\",\"gmtOffset\":-25200,\"gmtOffsetName\":\"UTC-07:00\",\"abbreviation\":\"MST\",\"tzName\":\"Mountain Standard Time (North America\"},{\"zoneName\":\"America/Hermosillo\",\"gmtOffset\":-25200,\"gmtOffsetName\":\"UTC-07:00\",\"abbreviation\":\"MST\",\"tzName\":\"Mountain Standard Time (North America\"},{\"zoneName\":\"America/Matamoros\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"},{\"zoneName\":\"America/Mazatlan\",\"gmtOffset\":-25200,\"gmtOffsetName\":\"UTC-07:00\",\"abbreviation\":\"MST\",\"tzName\":\"Mountain Standard Time (North America\"},{\"zoneName\":\"America/Merida\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"},{\"zoneName\":\"America/Mexico_City\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"},{\"zoneName\":\"America/Monterrey\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"},{\"zoneName\":\"America/Ojinaga\",\"gmtOffset\":-25200,\"gmtOffsetName\":\"UTC-07:00\",\"abbreviation\":\"MST\",\"tzName\":\"Mountain Standard Time (North America\"},{\"zoneName\":\"America/Tijuana\",\"gmtOffset\":-28800,\"gmtOffsetName\":\"UTC-08:00\",\"abbreviation\":\"PST\",\"tzName\":\"Pacific Standard Time (North America\"}]', '{\"kr\":\"?????????\",\"br\":\"M??xico\",\"pt\":\"M??xico\",\"nl\":\"Mexico\",\"hr\":\"Meksiko\",\"fa\":\"??????????\",\"de\":\"Mexiko\",\"es\":\"M??xico\",\"fr\":\"Mexique\",\"ja\":\"????????????\",\"it\":\"Messico\",\"cn\":\"?????????\"}', '23.00000000', '-102.00000000', '????????', 'U+1F1F2 U+1F1FD', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q96'),
(143, 'Micronesia', 'FSM', '583', 'FM', '691', 'Palikir', 'USD', '$', '.fm', 'Micronesia', 'Oceania', 'Micronesia', '[{\"zoneName\":\"Pacific/Chuuk\",\"gmtOffset\":36000,\"gmtOffsetName\":\"UTC+10:00\",\"abbreviation\":\"CHUT\",\"tzName\":\"Chuuk Time\"},{\"zoneName\":\"Pacific/Kosrae\",\"gmtOffset\":39600,\"gmtOffsetName\":\"UTC+11:00\",\"abbreviation\":\"KOST\",\"tzName\":\"Kosrae Time\"},{\"zoneName\":\"Pacific/Pohnpei\",\"gmtOffset\":39600,\"gmtOffsetName\":\"UTC+11:00\",\"abbreviation\":\"PONT\",\"tzName\":\"Pohnpei Standard Time\"}]', '{\"kr\":\"?????????????????? ??????\",\"br\":\"Micron??sia\",\"pt\":\"Micron??sia\",\"nl\":\"Micronesi??\",\"hr\":\"Mikronezija\",\"fa\":\"???????????? ?????????? ????????????????\",\"de\":\"Mikronesien\",\"es\":\"Micronesia\",\"fr\":\"Micron??sie\",\"ja\":\"????????????????????????\",\"it\":\"Micronesia\",\"cn\":\"??????????????????\"}', '6.91666666', '158.25000000', '????????', 'U+1F1EB U+1F1F2', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q702'),
(144, 'Moldova', 'MDA', '498', 'MD', '373', 'Chisinau', 'MDL', 'L', '.md', 'Moldova', 'Europe', 'Eastern Europe', '[{\"zoneName\":\"Europe/Chisinau\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Mold??via\",\"pt\":\"Mold??via\",\"nl\":\"Moldavi??\",\"hr\":\"Moldova\",\"fa\":\"??????????????\",\"de\":\"Moldawie\",\"es\":\"Moldavia\",\"fr\":\"Moldavie\",\"ja\":\"?????????????????????\",\"it\":\"Moldavia\",\"cn\":\"????????????\"}', '47.00000000', '29.00000000', '????????', 'U+1F1F2 U+1F1E9', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q217'),
(145, 'Monaco', 'MCO', '492', 'MC', '377', 'Monaco', 'EUR', '???', '.mc', 'Monaco', 'Europe', 'Western Europe', '[{\"zoneName\":\"Europe/Monaco\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"?????????\",\"br\":\"M??naco\",\"pt\":\"M??naco\",\"nl\":\"Monaco\",\"hr\":\"Monako\",\"fa\":\"????????????\",\"de\":\"Monaco\",\"es\":\"M??naco\",\"fr\":\"Monaco\",\"ja\":\"?????????\",\"it\":\"Principato di Monaco\",\"cn\":\"?????????\"}', '43.73333333', '7.40000000', '????????', 'U+1F1F2 U+1F1E8', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q235'),
(146, 'Mongolia', 'MNG', '496', 'MN', '976', 'Ulan Bator', 'MNT', '???', '.mn', '???????????? ??????', 'Asia', 'Eastern Asia', '[{\"zoneName\":\"Asia/Choibalsan\",\"gmtOffset\":28800,\"gmtOffsetName\":\"UTC+08:00\",\"abbreviation\":\"CHOT\",\"tzName\":\"Choibalsan Standard Time\"},{\"zoneName\":\"Asia/Hovd\",\"gmtOffset\":25200,\"gmtOffsetName\":\"UTC+07:00\",\"abbreviation\":\"HOVT\",\"tzName\":\"Hovd Time\"},{\"zoneName\":\"Asia/Ulaanbaatar\",\"gmtOffset\":28800,\"gmtOffsetName\":\"UTC+08:00\",\"abbreviation\":\"ULAT\",\"tzName\":\"Ulaanbaatar Standard Time\"}]', '{\"kr\":\"??????\",\"br\":\"Mong??lia\",\"pt\":\"Mong??lia\",\"nl\":\"Mongoli??\",\"hr\":\"Mongolija\",\"fa\":\"????????????????\",\"de\":\"Mongolei\",\"es\":\"Mongolia\",\"fr\":\"Mongolie\",\"ja\":\"????????????\",\"it\":\"Mongolia\",\"cn\":\"??????\"}', '46.00000000', '105.00000000', '????????', 'U+1F1F2 U+1F1F3', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q711'),
(147, 'Montenegro', 'MNE', '499', 'ME', '382', 'Podgorica', 'EUR', '???', '.me', '???????? ????????', 'Europe', 'Southern Europe', '[{\"zoneName\":\"Europe/Podgorica\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"???????????????\",\"br\":\"Montenegro\",\"pt\":\"Montenegro\",\"nl\":\"Montenegro\",\"hr\":\"Crna Gora\",\"fa\":\"?????????????????????\",\"de\":\"Montenegro\",\"es\":\"Montenegro\",\"fr\":\"Mont??n??gro\",\"ja\":\"??????????????????\",\"it\":\"Montenegro\",\"cn\":\"??????\"}', '42.50000000', '19.30000000', '????????', 'U+1F1F2 U+1F1EA', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q236'),
(148, 'Montserrat', 'MSR', '500', 'MS', '1664', 'Plymouth', 'XCD', '$', '.ms', 'Montserrat', 'Americas', 'Caribbean', '[{\"zoneName\":\"America/Montserrat\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Montserrat\",\"pt\":\"Monserrate\",\"nl\":\"Montserrat\",\"hr\":\"Montserrat\",\"fa\":\"??????????\",\"de\":\"Montserrat\",\"es\":\"Montserrat\",\"fr\":\"Montserrat\",\"ja\":\"??????????????????\",\"it\":\"Montserrat\",\"cn\":\"???????????????\"}', '16.75000000', '-62.20000000', '????????', 'U+1F1F2 U+1F1F8', '2018-07-20 20:11:03', '2021-12-04 08:14:15', 1, NULL),
(149, 'Morocco', 'MAR', '504', 'MA', '212', 'Rabat', 'MAD', 'DH', '.ma', '????????????', 'Africa', 'Northern Africa', '[{\"zoneName\":\"Africa/Casablanca\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"WEST\",\"tzName\":\"Western European Summer Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Marrocos\",\"pt\":\"Marrocos\",\"nl\":\"Marokko\",\"hr\":\"Maroko\",\"fa\":\"??????????\",\"de\":\"Marokko\",\"es\":\"Marruecos\",\"fr\":\"Maroc\",\"ja\":\"????????????\",\"it\":\"Marocco\",\"cn\":\"?????????\"}', '32.00000000', '-5.00000000', '????????', 'U+1F1F2 U+1F1E6', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q1028'),
(150, 'Mozambique', 'MOZ', '508', 'MZ', '258', 'Maputo', 'MZN', 'MT', '.mz', 'Mo??ambique', 'Africa', 'Eastern Africa', '[{\"zoneName\":\"Africa/Maputo\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"CAT\",\"tzName\":\"Central Africa Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Mo??ambique\",\"pt\":\"Mo??ambique\",\"nl\":\"Mozambique\",\"hr\":\"Mozambik\",\"fa\":\"????????????????\",\"de\":\"Mosambik\",\"es\":\"Mozambique\",\"fr\":\"Mozambique\",\"ja\":\"??????????????????\",\"it\":\"Mozambico\",\"cn\":\"????????????\"}', '-18.25000000', '35.00000000', '????????', 'U+1F1F2 U+1F1FF', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q1029'),
(151, 'Myanmar', 'MMR', '104', 'MM', '95', 'Nay Pyi Taw', 'MMK', 'K', '.mm', '??????????????????', 'Asia', 'South-Eastern Asia', '[{\"zoneName\":\"Asia/Yangon\",\"gmtOffset\":23400,\"gmtOffsetName\":\"UTC+06:30\",\"abbreviation\":\"MMT\",\"tzName\":\"Myanmar Standard Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Myanmar\",\"pt\":\"Myanmar\",\"nl\":\"Myanmar\",\"hr\":\"Mijanmar\",\"fa\":\"??????????????\",\"de\":\"Myanmar\",\"es\":\"Myanmar\",\"fr\":\"Myanmar\",\"ja\":\"???????????????\",\"it\":\"Birmania\",\"cn\":\"??????\"}', '22.00000000', '98.00000000', '????????', 'U+1F1F2 U+1F1F2', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q836'),
(152, 'Namibia', 'NAM', '516', 'NA', '264', 'Windhoek', 'NAD', '$', '.na', 'Namibia', 'Africa', 'Southern Africa', '[{\"zoneName\":\"Africa/Windhoek\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"WAST\",\"tzName\":\"West Africa Summer Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Nam??bia\",\"pt\":\"Nam??bia\",\"nl\":\"Namibi??\",\"hr\":\"Namibija\",\"fa\":\"??????????????\",\"de\":\"Namibia\",\"es\":\"Namibia\",\"fr\":\"Namibie\",\"ja\":\"????????????\",\"it\":\"Namibia\",\"cn\":\"????????????\"}', '-22.00000000', '17.00000000', '????????', 'U+1F1F3 U+1F1E6', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q1030'),
(153, 'Nauru', 'NRU', '520', 'NR', '674', 'Yaren', 'AUD', '$', '.nr', 'Nauru', 'Oceania', 'Micronesia', '[{\"zoneName\":\"Pacific/Nauru\",\"gmtOffset\":43200,\"gmtOffsetName\":\"UTC+12:00\",\"abbreviation\":\"NRT\",\"tzName\":\"Nauru Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Nauru\",\"pt\":\"Nauru\",\"nl\":\"Nauru\",\"hr\":\"Nauru\",\"fa\":\"????????????\",\"de\":\"Nauru\",\"es\":\"Nauru\",\"fr\":\"Nauru\",\"ja\":\"?????????\",\"it\":\"Nauru\",\"cn\":\"??????\"}', '-0.53333333', '166.91666666', '????????', 'U+1F1F3 U+1F1F7', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q697'),
(154, 'Nepal', 'NPL', '524', 'NP', '977', 'Kathmandu', 'NPR', '???', '.np', '?????????', 'Asia', 'Southern Asia', '[{\"zoneName\":\"Asia/Kathmandu\",\"gmtOffset\":20700,\"gmtOffsetName\":\"UTC+05:45\",\"abbreviation\":\"NPT\",\"tzName\":\"Nepal Time\"}]', '{\"kr\":\"??????\",\"br\":\"Nepal\",\"pt\":\"Nepal\",\"nl\":\"Nepal\",\"hr\":\"Nepal\",\"fa\":\"????????\",\"de\":\"N??pal\",\"es\":\"Nepal\",\"fr\":\"N??pal\",\"ja\":\"????????????\",\"it\":\"Nepal\",\"cn\":\"?????????\"}', '28.00000000', '84.00000000', '????????', 'U+1F1F3 U+1F1F5', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q837'),
(155, 'Bonaire, Sint Eustatius and Saba', 'BES', '535', 'BQ', '599', 'Kralendijk', 'USD', '$', '.an', 'Caribisch Nederland', 'Americas', 'Caribbean', '[{\"zoneName\":\"America/Anguilla\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]', '{\"kr\":\"????????? ???\",\"br\":\"Bonaire\",\"pt\":\"Bonaire\",\"fa\":\"??????????\",\"de\":\"Bonaire, Sint Eustatius und Saba\",\"fr\":\"Bonaire, Saint-Eustache et Saba\",\"it\":\"Bonaire, Saint-Eustache e Saba\",\"cn\":\"?????????????????????????????????????????????\"}', '12.15000000', '-68.26666700', '????????', 'U+1F1E7 U+1F1F6', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q27561'),
(156, 'Netherlands', 'NLD', '528', 'NL', '31', 'Amsterdam', 'EUR', '???', '.nl', 'Nederland', 'Europe', 'Western Europe', '[{\"zoneName\":\"Europe/Amsterdam\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"???????????? \",\"br\":\"Holanda\",\"pt\":\"Pa??ses Baixos\",\"nl\":\"Nederland\",\"hr\":\"Nizozemska\",\"fa\":\"?????????????? ????????\",\"de\":\"Niederlande\",\"es\":\"Pa??ses Bajos\",\"fr\":\"Pays-Bas\",\"ja\":\"????????????\",\"it\":\"Paesi Bassi\",\"cn\":\"??????\"}', '52.50000000', '5.75000000', '????????', 'U+1F1F3 U+1F1F1', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q55'),
(157, 'New Caledonia', 'NCL', '540', 'NC', '687', 'Noumea', 'XPF', '???', '.nc', 'Nouvelle-Cal??donie', 'Oceania', 'Melanesia', '[{\"zoneName\":\"Pacific/Noumea\",\"gmtOffset\":39600,\"gmtOffsetName\":\"UTC+11:00\",\"abbreviation\":\"NCT\",\"tzName\":\"New Caledonia Time\"}]', '{\"kr\":\"??????????????????\",\"br\":\"Nova Caled??nia\",\"pt\":\"Nova Caled??nia\",\"nl\":\"Nieuw-Caledoni??\",\"hr\":\"Nova Kaledonija\",\"fa\":\"?????????????????? ????????\",\"de\":\"Neukaledonien\",\"es\":\"Nueva Caledonia\",\"fr\":\"Nouvelle-Cal??donie\",\"ja\":\"????????????????????????\",\"it\":\"Nuova Caledonia\",\"cn\":\"??????????????????\"}', '-21.50000000', '165.50000000', '????????', 'U+1F1F3 U+1F1E8', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, NULL),
(158, 'New Zealand', 'NZL', '554', 'NZ', '64', 'Wellington', 'NZD', '$', '.nz', 'New Zealand', 'Oceania', 'Australia and New Zealand', '[{\"zoneName\":\"Pacific/Auckland\",\"gmtOffset\":46800,\"gmtOffsetName\":\"UTC+13:00\",\"abbreviation\":\"NZDT\",\"tzName\":\"New Zealand Daylight Time\"},{\"zoneName\":\"Pacific/Chatham\",\"gmtOffset\":49500,\"gmtOffsetName\":\"UTC+13:45\",\"abbreviation\":\"CHAST\",\"tzName\":\"Chatham Standard Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Nova Zel??ndia\",\"pt\":\"Nova Zel??ndia\",\"nl\":\"Nieuw-Zeeland\",\"hr\":\"Novi Zeland\",\"fa\":\"????????????????\",\"de\":\"Neuseeland\",\"es\":\"Nueva Zelanda\",\"fr\":\"Nouvelle-Z??lande\",\"ja\":\"????????????????????????\",\"it\":\"Nuova Zelanda\",\"cn\":\"?????????\"}', '-41.00000000', '174.00000000', '????????', 'U+1F1F3 U+1F1FF', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q664'),
(159, 'Nicaragua', 'NIC', '558', 'NI', '505', 'Managua', 'NIO', 'C$', '.ni', 'Nicaragua', 'Americas', 'Central America', '[{\"zoneName\":\"America/Managua\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"}]', '{\"kr\":\"????????????\",\"br\":\"Nicar??gua\",\"pt\":\"Nicar??gua\",\"nl\":\"Nicaragua\",\"hr\":\"Nikaragva\",\"fa\":\"????????????????????\",\"de\":\"Nicaragua\",\"es\":\"Nicaragua\",\"fr\":\"Nicaragua\",\"ja\":\"???????????????\",\"it\":\"Nicaragua\",\"cn\":\"????????????\"}', '13.00000000', '-85.00000000', '????????', 'U+1F1F3 U+1F1EE', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q811'),
(160, 'Niger', 'NER', '562', 'NE', '227', 'Niamey', 'XOF', 'CFA', '.ne', 'Niger', 'Africa', 'Western Africa', '[{\"zoneName\":\"Africa/Niamey\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"WAT\",\"tzName\":\"West Africa Time\"}]', '{\"kr\":\"?????????\",\"br\":\"N??ger\",\"pt\":\"N??ger\",\"nl\":\"Niger\",\"hr\":\"Niger\",\"fa\":\"????????\",\"de\":\"Niger\",\"es\":\"N??ger\",\"fr\":\"Niger\",\"ja\":\"???????????????\",\"it\":\"Niger\",\"cn\":\"?????????\"}', '16.00000000', '8.00000000', '????????', 'U+1F1F3 U+1F1EA', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q1032'),
(161, 'Nigeria', 'NGA', '566', 'NG', '234', 'Abuja', 'NGN', '???', '.ng', 'Nigeria', 'Africa', 'Western Africa', '[{\"zoneName\":\"Africa/Lagos\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"WAT\",\"tzName\":\"West Africa Time\"}]', '{\"kr\":\"???????????????\",\"br\":\"Nig??ria\",\"pt\":\"Nig??ria\",\"nl\":\"Nigeria\",\"hr\":\"Nigerija\",\"fa\":\"????????????\",\"de\":\"Nigeria\",\"es\":\"Nigeria\",\"fr\":\"Nig??ria\",\"ja\":\"??????????????????\",\"it\":\"Nigeria\",\"cn\":\"????????????\"}', '10.00000000', '8.00000000', '????????', 'U+1F1F3 U+1F1EC', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q1033'),
(162, 'Niue', 'NIU', '570', 'NU', '683', 'Alofi', 'NZD', '$', '.nu', 'Niu??', 'Oceania', 'Polynesia', '[{\"zoneName\":\"Pacific/Niue\",\"gmtOffset\":-39600,\"gmtOffsetName\":\"UTC-11:00\",\"abbreviation\":\"NUT\",\"tzName\":\"Niue Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Niue\",\"pt\":\"Niue\",\"nl\":\"Niue\",\"hr\":\"Niue\",\"fa\":\"??????????\",\"de\":\"Niue\",\"es\":\"Niue\",\"fr\":\"Niue\",\"ja\":\"?????????\",\"it\":\"Niue\",\"cn\":\"??????\"}', '-19.03333333', '-169.86666666', '????????', 'U+1F1F3 U+1F1FA', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q34020'),
(163, 'Norfolk Island', 'NFK', '574', 'NF', '672', 'Kingston', 'AUD', '$', '.nf', 'Norfolk Island', 'Oceania', 'Australia and New Zealand', '[{\"zoneName\":\"Pacific/Norfolk\",\"gmtOffset\":43200,\"gmtOffsetName\":\"UTC+12:00\",\"abbreviation\":\"NFT\",\"tzName\":\"Norfolk Time\"}]', '{\"kr\":\"?????? ???\",\"br\":\"Ilha Norfolk\",\"pt\":\"Ilha Norfolk\",\"nl\":\"Norfolkeiland\",\"hr\":\"Otok Norfolk\",\"fa\":\"?????????? ??????????\",\"de\":\"Norfolkinsel\",\"es\":\"Isla de Norfolk\",\"fr\":\"??le de Norfolk\",\"ja\":\"?????????????????????\",\"it\":\"Isola Norfolk\",\"cn\":\"????????????\"}', '-29.03333333', '167.95000000', '????????', 'U+1F1F3 U+1F1EB', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, NULL),
(164, 'Northern Mariana Islands', 'MNP', '580', 'MP', '1670', 'Saipan', 'USD', '$', '.mp', 'Northern Mariana Islands', 'Oceania', 'Micronesia', '[{\"zoneName\":\"Pacific/Saipan\",\"gmtOffset\":36000,\"gmtOffsetName\":\"UTC+10:00\",\"abbreviation\":\"ChST\",\"tzName\":\"Chamorro Standard Time\"}]', '{\"kr\":\"??????????????? ??????\",\"br\":\"Ilhas Marianas\",\"pt\":\"Ilhas Marianas\",\"nl\":\"Noordelijke Marianeneilanden\",\"hr\":\"Sjevernomarijanski otoci\",\"fa\":\"?????????? ???????????????? ??????????\",\"de\":\"N??rdliche Marianen\",\"es\":\"Islas Marianas del Norte\",\"fr\":\"??les Mariannes du Nord\",\"ja\":\"?????????????????????\",\"it\":\"Isole Marianne Settentrionali\",\"cn\":\"?????????????????????\"}', '15.20000000', '145.75000000', '????????', 'U+1F1F2 U+1F1F5', '2018-07-20 20:11:03', '2021-12-04 08:14:06', 1, NULL),
(165, 'Norway', 'NOR', '578', 'NO', '47', 'Oslo', 'NOK', 'kr', '.no', 'Norge', 'Europe', 'Northern Europe', '[{\"zoneName\":\"Europe/Oslo\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Noruega\",\"pt\":\"Noruega\",\"nl\":\"Noorwegen\",\"hr\":\"Norve??ka\",\"fa\":\"????????\",\"de\":\"Norwegen\",\"es\":\"Noruega\",\"fr\":\"Norv??ge\",\"ja\":\"???????????????\",\"it\":\"Norvegia\",\"cn\":\"??????\"}', '62.00000000', '10.00000000', '????????', 'U+1F1F3 U+1F1F4', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q20'),
(166, 'Oman', 'OMN', '512', 'OM', '968', 'Muscat', 'OMR', '.??.??', '.om', '????????', 'Asia', 'Western Asia', '[{\"zoneName\":\"Asia/Muscat\",\"gmtOffset\":14400,\"gmtOffsetName\":\"UTC+04:00\",\"abbreviation\":\"GST\",\"tzName\":\"Gulf Standard Time\"}]', '{\"kr\":\"??????\",\"br\":\"Om??\",\"pt\":\"Om??\",\"nl\":\"Oman\",\"hr\":\"Oman\",\"fa\":\"????????\",\"de\":\"Oman\",\"es\":\"Om??n\",\"fr\":\"Oman\",\"ja\":\"????????????\",\"it\":\"oman\",\"cn\":\"??????\"}', '21.00000000', '57.00000000', '????????', 'U+1F1F4 U+1F1F2', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q842'),
(167, 'Pakistan', 'PAK', '586', 'PK', '92', 'Islamabad', 'PKR', '???', '.pk', 'Pakistan', 'Asia', 'Southern Asia', '[{\"zoneName\":\"Asia/Karachi\",\"gmtOffset\":18000,\"gmtOffsetName\":\"UTC+05:00\",\"abbreviation\":\"PKT\",\"tzName\":\"Pakistan Standard Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Paquist??o\",\"pt\":\"Paquist??o\",\"nl\":\"Pakistan\",\"hr\":\"Pakistan\",\"fa\":\"??????????????\",\"de\":\"Pakistan\",\"es\":\"Pakist??n\",\"fr\":\"Pakistan\",\"ja\":\"???????????????\",\"it\":\"Pakistan\",\"cn\":\"????????????\"}', '30.00000000', '70.00000000', '????????', 'U+1F1F5 U+1F1F0', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q843'),
(168, 'Palau', 'PLW', '585', 'PW', '680', 'Melekeok', 'USD', '$', '.pw', 'Palau', 'Oceania', 'Micronesia', '[{\"zoneName\":\"Pacific/Palau\",\"gmtOffset\":32400,\"gmtOffsetName\":\"UTC+09:00\",\"abbreviation\":\"PWT\",\"tzName\":\"Palau Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Palau\",\"pt\":\"Palau\",\"nl\":\"Palau\",\"hr\":\"Palau\",\"fa\":\"????????????\",\"de\":\"Palau\",\"es\":\"Palau\",\"fr\":\"Palaos\",\"ja\":\"?????????\",\"it\":\"Palau\",\"cn\":\"??????\"}', '7.50000000', '134.50000000', '????????', 'U+1F1F5 U+1F1FC', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q695'),
(169, 'Palestinian Territory Occupied', 'PSE', '275', 'PS', '970', 'East Jerusalem', 'ILS', '???', '.ps', '????????????', 'Asia', 'Western Asia', '[{\"zoneName\":\"Asia/Gaza\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"},{\"zoneName\":\"Asia/Hebron\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"}]', '{\"kr\":\"??????????????? ??????\",\"br\":\"Palestina\",\"pt\":\"Palestina\",\"nl\":\"Palestijnse gebieden\",\"hr\":\"Palestina\",\"fa\":\"????????????\",\"de\":\"Pal??stina\",\"es\":\"Palestina\",\"fr\":\"Palestine\",\"ja\":\"???????????????\",\"it\":\"Palestina\",\"cn\":\"????????????\"}', '31.90000000', '35.20000000', '????????', 'U+1F1F5 U+1F1F8', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, NULL),
(170, 'Panama', 'PAN', '591', 'PA', '507', 'Panama City', 'PAB', 'B/.', '.pa', 'Panam??', 'Americas', 'Central America', '[{\"zoneName\":\"America/Panama\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America\"}]', '{\"kr\":\"?????????\",\"br\":\"Panam??\",\"pt\":\"Panam??\",\"nl\":\"Panama\",\"hr\":\"Panama\",\"fa\":\"????????????\",\"de\":\"Panama\",\"es\":\"Panam??\",\"fr\":\"Panama\",\"ja\":\"?????????\",\"it\":\"Panama\",\"cn\":\"?????????\"}', '9.00000000', '-80.00000000', '????????', 'U+1F1F5 U+1F1E6', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q804'),
(171, 'Papua new Guinea', 'PNG', '598', 'PG', '675', 'Port Moresby', 'PGK', 'K', '.pg', 'Papua Niugini', 'Oceania', 'Melanesia', '[{\"zoneName\":\"Pacific/Bougainville\",\"gmtOffset\":39600,\"gmtOffsetName\":\"UTC+11:00\",\"abbreviation\":\"BST\",\"tzName\":\"Bougainville Standard Time[6\"},{\"zoneName\":\"Pacific/Port_Moresby\",\"gmtOffset\":36000,\"gmtOffsetName\":\"UTC+10:00\",\"abbreviation\":\"PGT\",\"tzName\":\"Papua New Guinea Time\"}]', '{\"kr\":\"??????????????????\",\"br\":\"Papua Nova Guin??\",\"pt\":\"Papua Nova Guin??\",\"nl\":\"Papoea-Nieuw-Guinea\",\"hr\":\"Papua Nova Gvineja\",\"fa\":\"?????????? ???????? ????\",\"de\":\"Papua-Neuguinea\",\"es\":\"Pap??a Nueva Guinea\",\"fr\":\"Papouasie-Nouvelle-Guin??e\",\"ja\":\"???????????????????????????\",\"it\":\"Papua Nuova Guinea\",\"cn\":\"?????????????????????\"}', '-6.00000000', '147.00000000', '????????', 'U+1F1F5 U+1F1EC', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q691'),
(172, 'Paraguay', 'PRY', '600', 'PY', '595', 'Asuncion', 'PYG', '???', '.py', 'Paraguay', 'Americas', 'South America', '[{\"zoneName\":\"America/Asuncion\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"PYST\",\"tzName\":\"Paraguay Summer Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Paraguai\",\"pt\":\"Paraguai\",\"nl\":\"Paraguay\",\"hr\":\"Paragvaj\",\"fa\":\"????????????????\",\"de\":\"Paraguay\",\"es\":\"Paraguay\",\"fr\":\"Paraguay\",\"ja\":\"???????????????\",\"it\":\"Paraguay\",\"cn\":\"?????????\"}', '-23.00000000', '-58.00000000', '????????', 'U+1F1F5 U+1F1FE', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q733'),
(173, 'Peru', 'PER', '604', 'PE', '51', 'Lima', 'PEN', 'S/.', '.pe', 'Per??', 'Americas', 'South America', '[{\"zoneName\":\"America/Lima\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"PET\",\"tzName\":\"Peru Time\"}]', '{\"kr\":\"??????\",\"br\":\"Peru\",\"pt\":\"Peru\",\"nl\":\"Peru\",\"hr\":\"Peru\",\"fa\":\"??????\",\"de\":\"Peru\",\"es\":\"Per??\",\"fr\":\"P??rou\",\"ja\":\"?????????\",\"it\":\"Per??\",\"cn\":\"??????\"}', '-10.00000000', '-76.00000000', '????????', 'U+1F1F5 U+1F1EA', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q419'),
(174, 'Philippines', 'PHL', '608', 'PH', '63', 'Manila', 'PHP', '???', '.ph', 'Pilipinas', 'Asia', 'South-Eastern Asia', '[{\"zoneName\":\"Asia/Manila\",\"gmtOffset\":28800,\"gmtOffsetName\":\"UTC+08:00\",\"abbreviation\":\"PHT\",\"tzName\":\"Philippine Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Filipinas\",\"pt\":\"Filipinas\",\"nl\":\"Filipijnen\",\"hr\":\"Filipini\",\"fa\":\"?????????? ??????????????????????\",\"de\":\"Philippinen\",\"es\":\"Filipinas\",\"fr\":\"Philippines\",\"ja\":\"???????????????\",\"it\":\"Filippine\",\"cn\":\"?????????\"}', '13.00000000', '122.00000000', '????????', 'U+1F1F5 U+1F1ED', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q928'),
(175, 'Pitcairn Island', 'PCN', '612', 'PN', '870', 'Adamstown', 'NZD', '$', '.pn', 'Pitcairn Islands', 'Oceania', 'Polynesia', '[{\"zoneName\":\"Pacific/Pitcairn\",\"gmtOffset\":-28800,\"gmtOffsetName\":\"UTC-08:00\",\"abbreviation\":\"PST\",\"tzName\":\"Pacific Standard Time (North America\"}]', '{\"kr\":\"????????? ??????\",\"br\":\"Ilhas Pitcairn\",\"pt\":\"Ilhas Pic??rnia\",\"nl\":\"Pitcairneilanden\",\"hr\":\"Pitcairnovo oto??je\",\"fa\":\"????????????\",\"de\":\"Pitcairn\",\"es\":\"Islas Pitcairn\",\"fr\":\"??les Pitcairn\",\"ja\":\"???????????????\",\"it\":\"Isole Pitcairn\",\"cn\":\"??????????????????\"}', '-25.06666666', '-130.10000000', '????????', 'U+1F1F5 U+1F1F3', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, NULL),
(176, 'Poland', 'POL', '616', 'PL', '48', 'Warsaw', 'PLN', 'z??', '.pl', 'Polska', 'Europe', 'Eastern Europe', '[{\"zoneName\":\"Europe/Warsaw\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Pol??nia\",\"pt\":\"Pol??nia\",\"nl\":\"Polen\",\"hr\":\"Poljska\",\"fa\":\"????????????\",\"de\":\"Polen\",\"es\":\"Polonia\",\"fr\":\"Pologne\",\"ja\":\"???????????????\",\"it\":\"Polonia\",\"cn\":\"??????\"}', '52.00000000', '20.00000000', '????????', 'U+1F1F5 U+1F1F1', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q36'),
(177, 'Portugal', 'PRT', '620', 'PT', '351', 'Lisbon', 'EUR', '???', '.pt', 'Portugal', 'Europe', 'Southern Europe', '[{\"zoneName\":\"Atlantic/Azores\",\"gmtOffset\":-3600,\"gmtOffsetName\":\"UTC-01:00\",\"abbreviation\":\"AZOT\",\"tzName\":\"Azores Standard Time\"},{\"zoneName\":\"Atlantic/Madeira\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC??00\",\"abbreviation\":\"WET\",\"tzName\":\"Western European Time\"},{\"zoneName\":\"Europe/Lisbon\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC??00\",\"abbreviation\":\"WET\",\"tzName\":\"Western European Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Portugal\",\"pt\":\"Portugal\",\"nl\":\"Portugal\",\"hr\":\"Portugal\",\"fa\":\"????????????\",\"de\":\"Portugal\",\"es\":\"Portugal\",\"fr\":\"Portugal\",\"ja\":\"???????????????\",\"it\":\"Portogallo\",\"cn\":\"?????????\"}', '39.50000000', '-8.00000000', '????????', 'U+1F1F5 U+1F1F9', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q45'),
(178, 'Puerto Rico', 'PRI', '630', 'PR', '1787', 'San Juan', 'USD', '$', '.pr', 'Puerto Rico', 'Americas', 'Caribbean', '[{\"zoneName\":\"America/Puerto_Rico\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]', '{\"kr\":\"??????????????????\",\"br\":\"Porto Rico\",\"pt\":\"Porto Rico\",\"nl\":\"Puerto Rico\",\"hr\":\"Portoriko\",\"fa\":\"?????????? ????????\",\"de\":\"Puerto Rico\",\"es\":\"Puerto Rico\",\"fr\":\"Porto Rico\",\"ja\":\"??????????????????\",\"it\":\"Porto Rico\",\"cn\":\"????????????\"}', '18.25000000', '-66.50000000', '????????', 'U+1F1F5 U+1F1F7', '2018-07-20 20:11:03', '2021-12-04 08:13:52', 1, NULL),
(179, 'Qatar', 'QAT', '634', 'QA', '974', 'Doha', 'QAR', '??.??', '.qa', '??????', 'Asia', 'Western Asia', '[{\"zoneName\":\"Asia/Qatar\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"AST\",\"tzName\":\"Arabia Standard Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Catar\",\"pt\":\"Catar\",\"nl\":\"Qatar\",\"hr\":\"Katar\",\"fa\":\"??????\",\"de\":\"Katar\",\"es\":\"Catar\",\"fr\":\"Qatar\",\"ja\":\"????????????\",\"it\":\"Qatar\",\"cn\":\"?????????\"}', '25.50000000', '51.25000000', '????????', 'U+1F1F6 U+1F1E6', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q846'),
(180, 'Reunion', 'REU', '638', 'RE', '262', 'Saint-Denis', 'EUR', '???', '.re', 'La R??union', 'Africa', 'Eastern Africa', '[{\"zoneName\":\"Indian/Reunion\",\"gmtOffset\":14400,\"gmtOffsetName\":\"UTC+04:00\",\"abbreviation\":\"RET\",\"tzName\":\"R??union Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Reuni??o\",\"pt\":\"Reuni??o\",\"nl\":\"R??union\",\"hr\":\"R??union\",\"fa\":\"??????????????\",\"de\":\"R??union\",\"es\":\"Reuni??n\",\"fr\":\"R??union\",\"ja\":\"???????????????\",\"it\":\"Riunione\",\"cn\":\"????????????\"}', '-21.15000000', '55.50000000', '????????', 'U+1F1F7 U+1F1EA', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, NULL),
(181, 'Romania', 'ROU', '642', 'RO', '40', 'Bucharest', 'RON', 'lei', '.ro', 'Rom??nia', 'Europe', 'Eastern Europe', '[{\"zoneName\":\"Europe/Bucharest\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Rom??nia\",\"pt\":\"Rom??nia\",\"nl\":\"Roemeni??\",\"hr\":\"Rumunjska\",\"fa\":\"????????????\",\"de\":\"Rum??nien\",\"es\":\"Rumania\",\"fr\":\"Roumanie\",\"ja\":\"???????????????\",\"it\":\"Romania\",\"cn\":\"????????????\"}', '46.00000000', '25.00000000', '????????', 'U+1F1F7 U+1F1F4', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q218'),
(182, 'Russia', 'RUS', '643', 'RU', '7', 'Moscow', 'RUB', '???', '.ru', '????????????', 'Europe', 'Eastern Europe', '[{\"zoneName\":\"Asia/Anadyr\",\"gmtOffset\":43200,\"gmtOffsetName\":\"UTC+12:00\",\"abbreviation\":\"ANAT\",\"tzName\":\"Anadyr Time[4\"},{\"zoneName\":\"Asia/Barnaul\",\"gmtOffset\":25200,\"gmtOffsetName\":\"UTC+07:00\",\"abbreviation\":\"KRAT\",\"tzName\":\"Krasnoyarsk Time\"},{\"zoneName\":\"Asia/Chita\",\"gmtOffset\":32400,\"gmtOffsetName\":\"UTC+09:00\",\"abbreviation\":\"YAKT\",\"tzName\":\"Yakutsk Time\"},{\"zoneName\":\"Asia/Irkutsk\",\"gmtOffset\":28800,\"gmtOffsetName\":\"UTC+08:00\",\"abbreviation\":\"IRKT\",\"tzName\":\"Irkutsk Time\"},{\"zoneName\":\"Asia/Kamchatka\",\"gmtOffset\":43200,\"gmtOffsetName\":\"UTC+12:00\",\"abbreviation\":\"PETT\",\"tzName\":\"Kamchatka Time\"},{\"zoneName\":\"Asia/Khandyga\",\"gmtOffset\":32400,\"gmtOffsetName\":\"UTC+09:00\",\"abbreviation\":\"YAKT\",\"tzName\":\"Yakutsk Time\"},{\"zoneName\":\"Asia/Krasnoyarsk\",\"gmtOffset\":25200,\"gmtOffsetName\":\"UTC+07:00\",\"abbreviation\":\"KRAT\",\"tzName\":\"Krasnoyarsk Time\"},{\"zoneName\":\"Asia/Magadan\",\"gmtOffset\":39600,\"gmtOffsetName\":\"UTC+11:00\",\"abbreviation\":\"MAGT\",\"tzName\":\"Magadan Time\"},{\"zoneName\":\"Asia/Novokuznetsk\",\"gmtOffset\":25200,\"gmtOffsetName\":\"UTC+07:00\",\"abbreviation\":\"KRAT\",\"tzName\":\"Krasnoyarsk Time\"},{\"zoneName\":\"Asia/Novosibirsk\",\"gmtOffset\":25200,\"gmtOffsetName\":\"UTC+07:00\",\"abbreviation\":\"NOVT\",\"tzName\":\"Novosibirsk Time\"},{\"zoneName\":\"Asia/Omsk\",\"gmtOffset\":21600,\"gmtOffsetName\":\"UTC+06:00\",\"abbreviation\":\"OMST\",\"tzName\":\"Omsk Time\"},{\"zoneName\":\"Asia/Sakhalin\",\"gmtOffset\":39600,\"gmtOffsetName\":\"UTC+11:00\",\"abbreviation\":\"SAKT\",\"tzName\":\"Sakhalin Island Time\"},{\"zoneName\":\"Asia/Srednekolymsk\",\"gmtOffset\":39600,\"gmtOffsetName\":\"UTC+11:00\",\"abbreviation\":\"SRET\",\"tzName\":\"Srednekolymsk Time\"},{\"zoneName\":\"Asia/Tomsk\",\"gmtOffset\":25200,\"gmtOffsetName\":\"UTC+07:00\",\"abbreviation\":\"MSD+3\",\"tzName\":\"Moscow Daylight Time+3\"},{\"zoneName\":\"Asia/Ust-Nera\",\"gmtOffset\":36000,\"gmtOffsetName\":\"UTC+10:00\",\"abbreviation\":\"VLAT\",\"tzName\":\"Vladivostok Time\"},{\"zoneName\":\"Asia/Vladivostok\",\"gmtOffset\":36000,\"gmtOffsetName\":\"UTC+10:00\",\"abbreviation\":\"VLAT\",\"tzName\":\"Vladivostok Time\"},{\"zoneName\":\"Asia/Yakutsk\",\"gmtOffset\":32400,\"gmtOffsetName\":\"UTC+09:00\",\"abbreviation\":\"YAKT\",\"tzName\":\"Yakutsk Time\"},{\"zoneName\":\"Asia/Yekaterinburg\",\"gmtOffset\":18000,\"gmtOffsetName\":\"UTC+05:00\",\"abbreviation\":\"YEKT\",\"tzName\":\"Yekaterinburg Time\"},{\"zoneName\":\"Europe/Astrakhan\",\"gmtOffset\":14400,\"gmtOffsetName\":\"UTC+04:00\",\"abbreviation\":\"SAMT\",\"tzName\":\"Samara Time\"},{\"zoneName\":\"Europe/Kaliningrad\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"},{\"zoneName\":\"Europe/Kirov\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"MSK\",\"tzName\":\"Moscow Time\"},{\"zoneName\":\"Europe/Moscow\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"MSK\",\"tzName\":\"Moscow Time\"},{\"zoneName\":\"Europe/Samara\",\"gmtOffset\":14400,\"gmtOffsetName\":\"UTC+04:00\",\"abbreviation\":\"SAMT\",\"tzName\":\"Samara Time\"},{\"zoneName\":\"Europe/Saratov\",\"gmtOffset\":14400,\"gmtOffsetName\":\"UTC+04:00\",\"abbreviation\":\"MSD\",\"tzName\":\"Moscow Daylight Time+4\"},{\"zoneName\":\"Europe/Ulyanovsk\",\"gmtOffset\":14400,\"gmtOffsetName\":\"UTC+04:00\",\"abbreviation\":\"SAMT\",\"tzName\":\"Samara Time\"},{\"zoneName\":\"Europe/Volgograd\",\"gmtOffset\":14400,\"gmtOffsetName\":\"UTC+04:00\",\"abbreviation\":\"MSK\",\"tzName\":\"Moscow Standard Time\"}]', '{\"kr\":\"?????????\",\"br\":\"R??ssia\",\"pt\":\"R??ssia\",\"nl\":\"Rusland\",\"hr\":\"Rusija\",\"fa\":\"??????????\",\"de\":\"Russland\",\"es\":\"Rusia\",\"fr\":\"Russie\",\"ja\":\"???????????????\",\"it\":\"Russia\",\"cn\":\"???????????????\"}', '60.00000000', '100.00000000', '????????', 'U+1F1F7 U+1F1FA', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q159'),
(183, 'Rwanda', 'RWA', '646', 'RW', '250', 'Kigali', 'RWF', 'FRw', '.rw', 'Rwanda', 'Africa', 'Eastern Africa', '[{\"zoneName\":\"Africa/Kigali\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"CAT\",\"tzName\":\"Central Africa Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Ruanda\",\"pt\":\"Ruanda\",\"nl\":\"Rwanda\",\"hr\":\"Ruanda\",\"fa\":\"????????????\",\"de\":\"Ruanda\",\"es\":\"Ruanda\",\"fr\":\"Rwanda\",\"ja\":\"????????????\",\"it\":\"Ruanda\",\"cn\":\"?????????\"}', '-2.00000000', '30.00000000', '????????', 'U+1F1F7 U+1F1FC', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q1037'),
(184, 'Saint Helena', 'SHN', '654', 'SH', '290', 'Jamestown', 'SHP', '??', '.sh', 'Saint Helena', 'Africa', 'Western Africa', '[{\"zoneName\":\"Atlantic/St_Helena\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC??00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"}]', '{\"kr\":\"??????????????????\",\"br\":\"Santa Helena\",\"pt\":\"Santa Helena\",\"nl\":\"Sint-Helena\",\"hr\":\"Sveta Helena\",\"fa\":\"?????? ?????????? ?????????? ?? ?????????????? ???? ????????\",\"de\":\"Sankt Helena\",\"es\":\"Santa Helena\",\"fr\":\"Sainte-H??l??ne\",\"ja\":\"??????????????????????????????????????????????????????????????????????????????\",\"it\":\"Sant\'Elena\",\"cn\":\"????????????\"}', '-15.95000000', '-5.70000000', '????????', 'U+1F1F8 U+1F1ED', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, NULL),
(185, 'Saint Kitts And Nevis', 'KNA', '659', 'KN', '1869', 'Basseterre', 'XCD', '$', '.kn', 'Saint Kitts and Nevis', 'Americas', 'Caribbean', '[{\"zoneName\":\"America/St_Kitts\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]', '{\"kr\":\"??????????????? ?????????\",\"br\":\"S??o Crist??v??o e Neves\",\"pt\":\"S??o Crist??v??o e Neves\",\"nl\":\"Saint Kitts en Nevis\",\"hr\":\"Sveti Kristof i Nevis\",\"fa\":\"?????? ???????? ?? ????????\",\"de\":\"St. Kitts und Nevis\",\"es\":\"San Crist??bal y Nieves\",\"fr\":\"Saint-Christophe-et-Ni??v??s\",\"ja\":\"?????????????????????????????????????????????\",\"it\":\"Saint Kitts e Nevis\",\"cn\":\"?????????????????????\"}', '17.33333333', '-62.75000000', '????????', 'U+1F1F0 U+1F1F3', '2018-07-20 20:11:03', '2021-12-04 08:12:55', 1, 'Q763'),
(186, 'Saint Lucia', 'LCA', '662', 'LC', '1758', 'Castries', 'XCD', '$', '.lc', 'Saint Lucia', 'Americas', 'Caribbean', '[{\"zoneName\":\"America/St_Lucia\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]', '{\"kr\":\"??????????????????\",\"br\":\"Santa L??cia\",\"pt\":\"Santa L??cia\",\"nl\":\"Saint Lucia\",\"hr\":\"Sveta Lucija\",\"fa\":\"?????? ??????????\",\"de\":\"Saint Lucia\",\"es\":\"Santa Luc??a\",\"fr\":\"Saint-Lucie\",\"ja\":\"??????????????????\",\"it\":\"Santa Lucia\",\"cn\":\"????????????\"}', '13.88333333', '-60.96666666', '????????', 'U+1F1F1 U+1F1E8', '2018-07-20 20:11:03', '2021-12-04 08:12:48', 1, 'Q760'),
(187, 'Saint Pierre and Miquelon', 'SPM', '666', 'PM', '508', 'Saint-Pierre', 'EUR', '???', '.pm', 'Saint-Pierre-et-Miquelon', 'Americas', 'Northern America', '[{\"zoneName\":\"America/Miquelon\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"PMDT\",\"tzName\":\"Pierre & Miquelon Daylight Time\"}]', '{\"kr\":\"???????????? ?????????\",\"br\":\"Saint-Pierre e Miquelon\",\"pt\":\"S??o Pedro e Miquelon\",\"nl\":\"Saint Pierre en Miquelon\",\"hr\":\"Sveti Petar i Mikelon\",\"fa\":\"???? ?????? ?? ??????????\",\"de\":\"Saint-Pierre und Miquelon\",\"es\":\"San Pedro y Miquel??n\",\"fr\":\"Saint-Pierre-et-Miquelon\",\"ja\":\"???????????????????????????????????????\",\"it\":\"Saint-Pierre e Miquelon\",\"cn\":\"????????????????????????\"}', '46.83333333', '-56.33333333', '????????', 'U+1F1F5 U+1F1F2', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, NULL),
(188, 'Saint Vincent And The Grenadines', 'VCT', '670', 'VC', '1784', 'Kingstown', 'XCD', '$', '.vc', 'Saint Vincent and the Grenadines', 'Americas', 'Caribbean', '[{\"zoneName\":\"America/St_Vincent\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]', '{\"kr\":\"?????????????????? ????????????\",\"br\":\"S??o Vicente e Granadinas\",\"pt\":\"S??o Vicente e Granadinas\",\"nl\":\"Saint Vincent en de Grenadines\",\"hr\":\"Sveti Vincent i Grenadini\",\"fa\":\"?????? ???????????? ?? ?????????????????????\",\"de\":\"Saint Vincent und die Grenadinen\",\"es\":\"San Vicente y Granadinas\",\"fr\":\"Saint-Vincent-et-les-Grenadines\",\"ja\":\"????????????????????????????????????????????????????????????\",\"it\":\"Saint Vincent e Grenadine\",\"cn\":\"??????????????????????????????\"}', '13.25000000', '-61.20000000', '????????', 'U+1F1FB U+1F1E8', '2018-07-20 20:11:03', '2021-12-04 08:12:34', 1, 'Q757'),
(189, 'Saint-Barthelemy', 'BLM', '652', 'BL', '590', 'Gustavia', 'EUR', '???', '.bl', 'Saint-Barth??lemy', 'Americas', 'Caribbean', '[{\"zoneName\":\"America/St_Barthelemy\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]', '{\"kr\":\"??????????????????\",\"br\":\"S??o Bartolomeu\",\"pt\":\"S??o Bartolomeu\",\"nl\":\"Saint Barth??lemy\",\"hr\":\"Saint Barth??lemy\",\"fa\":\"????-??????????????\",\"de\":\"Saint-Barth??lemy\",\"es\":\"San Bartolom??\",\"fr\":\"Saint-Barth??lemy\",\"ja\":\"???????????????????????????\",\"it\":\"Antille Francesi\",\"cn\":\"???????????????\"}', '18.50000000', '-63.41666666', '????????', 'U+1F1E7 U+1F1F1', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, NULL),
(190, 'Saint-Martin (French part)', 'MAF', '663', 'MF', '590', 'Marigot', 'EUR', '???', '.mf', 'Saint-Martin', 'Americas', 'Caribbean', '[{\"zoneName\":\"America/Marigot\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]', '{\"kr\":\"??????????????? ???\",\"br\":\"Saint Martin\",\"pt\":\"Ilha S??o Martinho\",\"nl\":\"Saint-Martin\",\"hr\":\"Sveti Martin\",\"fa\":\"???????? ??????????\",\"de\":\"Saint Martin\",\"es\":\"Saint Martin\",\"fr\":\"Saint-Martin\",\"ja\":\"??????????????????????????????????????????\",\"it\":\"Saint Martin\",\"cn\":\"??????????????????\"}', '18.08333333', '-63.95000000', '????????', 'U+1F1F2 U+1F1EB', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, NULL),
(191, 'Samoa', 'WSM', '882', 'WS', '685', 'Apia', 'WST', 'SAT', '.ws', 'Samoa', 'Oceania', 'Polynesia', '[{\"zoneName\":\"Pacific/Apia\",\"gmtOffset\":50400,\"gmtOffsetName\":\"UTC+14:00\",\"abbreviation\":\"WST\",\"tzName\":\"West Samoa Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Samoa\",\"pt\":\"Samoa\",\"nl\":\"Samoa\",\"hr\":\"Samoa\",\"fa\":\"??????????\",\"de\":\"Samoa\",\"es\":\"Samoa\",\"fr\":\"Samoa\",\"ja\":\"?????????\",\"it\":\"Samoa\",\"cn\":\"?????????\"}', '-13.58333333', '-172.33333333', '????????', 'U+1F1FC U+1F1F8', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q683'),
(192, 'San Marino', 'SMR', '674', 'SM', '378', 'San Marino', 'EUR', '???', '.sm', 'San Marino', 'Europe', 'Southern Europe', '[{\"zoneName\":\"Europe/San_Marino\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"????????????\",\"br\":\"San Marino\",\"pt\":\"S??o Marinho\",\"nl\":\"San Marino\",\"hr\":\"San Marino\",\"fa\":\"?????? ????????????\",\"de\":\"San Marino\",\"es\":\"San Marino\",\"fr\":\"Saint-Marin\",\"ja\":\"???????????????\",\"it\":\"San Marino\",\"cn\":\"????????????\"}', '43.76666666', '12.41666666', '????????', 'U+1F1F8 U+1F1F2', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q238'),
(193, 'Sao Tome and Principe', 'STP', '678', 'ST', '239', 'Sao Tome', 'STD', 'Db', '.st', 'S??o Tom?? e Pr??ncipe', 'Africa', 'Middle Africa', '[{\"zoneName\":\"Africa/Sao_Tome\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC??00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"}]', '{\"kr\":\"????????? ????????????\",\"br\":\"S??o Tom?? e Pr??ncipe\",\"pt\":\"S??o Tom?? e Pr??ncipe\",\"nl\":\"Sao Tom?? en Principe\",\"hr\":\"Sveti Toma i Princip\",\"fa\":\"???????????? ???? ????????????\",\"de\":\"S??o Tom?? und Pr??ncipe\",\"es\":\"Santo Tom?? y Pr??ncipe\",\"fr\":\"Sao Tom??-et-Principe\",\"ja\":\"??????????????????????????????\",\"it\":\"S??o Tom?? e Pr??ncipe\",\"cn\":\"????????????????????????\"}', '1.00000000', '7.00000000', '????????', 'U+1F1F8 U+1F1F9', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q1039'),
(194, 'Saudi Arabia', 'SAU', '682', 'SA', '966', 'Riyadh', 'SAR', '???', '.sa', '?????????????? ?????????????? ????????????????', 'Asia', 'Western Asia', '[{\"zoneName\":\"Asia/Riyadh\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"AST\",\"tzName\":\"Arabia Standard Time\"}]', '{\"kr\":\"?????????????????????\",\"br\":\"Ar??bia Saudita\",\"pt\":\"Ar??bia Saudita\",\"nl\":\"Saoedi-Arabi??\",\"hr\":\"Saudijska Arabija\",\"fa\":\"?????????????? ??????????\",\"de\":\"Saudi-Arabien\",\"es\":\"Arabia Saud??\",\"fr\":\"Arabie Saoudite\",\"ja\":\"?????????????????????\",\"it\":\"Arabia Saudita\",\"cn\":\"???????????????\"}', '25.00000000', '45.00000000', '????????', 'U+1F1F8 U+1F1E6', '2018-07-20 20:11:03', '2021-09-26 13:09:09', 1, 'Q851'),
(195, 'Senegal', 'SEN', '686', 'SN', '221', 'Dakar', 'XOF', 'CFA', '.sn', 'S??n??gal', 'Africa', 'Western Africa', '[{\"zoneName\":\"Africa/Dakar\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC??00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Senegal\",\"pt\":\"Senegal\",\"nl\":\"Senegal\",\"hr\":\"Senegal\",\"fa\":\"??????????\",\"de\":\"Senegal\",\"es\":\"Senegal\",\"fr\":\"S??n??gal\",\"ja\":\"????????????\",\"it\":\"Senegal\",\"cn\":\"????????????\"}', '14.00000000', '-14.00000000', '????????', 'U+1F1F8 U+1F1F3', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q1041'),
(196, 'Serbia', 'SRB', '688', 'RS', '381', 'Belgrade', 'RSD', 'din', '.rs', '????????????', 'Europe', 'Southern Europe', '[{\"zoneName\":\"Europe/Belgrade\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"????????????\",\"br\":\"S??rvia\",\"pt\":\"S??rvia\",\"nl\":\"Servi??\",\"hr\":\"Srbija\",\"fa\":\"??????????????\",\"de\":\"Serbien\",\"es\":\"Serbia\",\"fr\":\"Serbie\",\"ja\":\"????????????\",\"it\":\"Serbia\",\"cn\":\"????????????\"}', '44.00000000', '21.00000000', '????????', 'U+1F1F7 U+1F1F8', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q403'),
(197, 'Seychelles', 'SYC', '690', 'SC', '248', 'Victoria', 'SCR', 'SRe', '.sc', 'Seychelles', 'Africa', 'Eastern Africa', '[{\"zoneName\":\"Indian/Mahe\",\"gmtOffset\":14400,\"gmtOffsetName\":\"UTC+04:00\",\"abbreviation\":\"SCT\",\"tzName\":\"Seychelles Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Seicheles\",\"pt\":\"Seicheles\",\"nl\":\"Seychellen\",\"hr\":\"Sej??eli\",\"fa\":\"????????\",\"de\":\"Seychellen\",\"es\":\"Seychelles\",\"fr\":\"Seychelles\",\"ja\":\"???????????????\",\"it\":\"Seychelles\",\"cn\":\"?????????\"}', '-4.58333333', '55.66666666', '????????', 'U+1F1F8 U+1F1E8', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q1042'),
(198, 'Sierra Leone', 'SLE', '694', 'SL', '232', 'Freetown', 'SLL', 'Le', '.sl', 'Sierra Leone', 'Africa', 'Western Africa', '[{\"zoneName\":\"Africa/Freetown\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC??00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"}]', '{\"kr\":\"???????????????\",\"br\":\"Serra Leoa\",\"pt\":\"Serra Leoa\",\"nl\":\"Sierra Leone\",\"hr\":\"Sijera Leone\",\"fa\":\"????????????????\",\"de\":\"Sierra Leone\",\"es\":\"Sierra Leone\",\"fr\":\"Sierra Leone\",\"ja\":\"??????????????????\",\"it\":\"Sierra Leone\",\"cn\":\"????????????\"}', '8.50000000', '-11.50000000', '????????', 'U+1F1F8 U+1F1F1', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q1044'),
(199, 'Singapore', 'SGP', '702', 'SG', '65', 'Singapur', 'SGD', '$', '.sg', 'Singapore', 'Asia', 'South-Eastern Asia', '[{\"zoneName\":\"Asia/Singapore\",\"gmtOffset\":28800,\"gmtOffsetName\":\"UTC+08:00\",\"abbreviation\":\"SGT\",\"tzName\":\"Singapore Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Singapura\",\"pt\":\"Singapura\",\"nl\":\"Singapore\",\"hr\":\"Singapur\",\"fa\":\"??????????????\",\"de\":\"Singapur\",\"es\":\"Singapur\",\"fr\":\"Singapour\",\"ja\":\"??????????????????\",\"it\":\"Singapore\",\"cn\":\"?????????\"}', '1.36666666', '103.80000000', '????????', 'U+1F1F8 U+1F1EC', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q334'),
(200, 'Slovakia', 'SVK', '703', 'SK', '421', 'Bratislava', 'EUR', '???', '.sk', 'Slovensko', 'Europe', 'Eastern Europe', '[{\"zoneName\":\"Europe/Bratislava\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"???????????????\",\"br\":\"Eslov??quia\",\"pt\":\"Eslov??quia\",\"nl\":\"Slowakije\",\"hr\":\"Slova??ka\",\"fa\":\"??????????????\",\"de\":\"Slowakei\",\"es\":\"Rep??blica Eslovaca\",\"fr\":\"Slovaquie\",\"ja\":\"???????????????\",\"it\":\"Slovacchia\",\"cn\":\"????????????\"}', '48.66666666', '19.50000000', '????????', 'U+1F1F8 U+1F1F0', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q214'),
(201, 'Slovenia', 'SVN', '705', 'SI', '386', 'Ljubljana', 'EUR', '???', '.si', 'Slovenija', 'Europe', 'Southern Europe', '[{\"zoneName\":\"Europe/Ljubljana\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"???????????????\",\"br\":\"Eslov??nia\",\"pt\":\"Eslov??nia\",\"nl\":\"Sloveni??\",\"hr\":\"Slovenija\",\"fa\":\"??????????????\",\"de\":\"Slowenien\",\"es\":\"Eslovenia\",\"fr\":\"Slov??nie\",\"ja\":\"???????????????\",\"it\":\"Slovenia\",\"cn\":\"???????????????\"}', '46.11666666', '14.81666666', '????????', 'U+1F1F8 U+1F1EE', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q215');
INSERT INTO `countries` (`id`, `name`, `iso3`, `numeric_code`, `iso2`, `phonecode`, `capital`, `currency`, `currency_symbol`, `tld`, `native`, `region`, `subregion`, `timezones`, `translations`, `latitude`, `longitude`, `emoji`, `emojiU`, `created_at`, `updated_at`, `flag`, `wikiDataId`) VALUES
(202, 'Solomon Islands', 'SLB', '090', 'SB', '677', 'Honiara', 'SBD', 'Si$', '.sb', 'Solomon Islands', 'Oceania', 'Melanesia', '[{\"zoneName\":\"Pacific/Guadalcanal\",\"gmtOffset\":39600,\"gmtOffsetName\":\"UTC+11:00\",\"abbreviation\":\"SBT\",\"tzName\":\"Solomon Islands Time\"}]', '{\"kr\":\"????????? ??????\",\"br\":\"Ilhas Salom??o\",\"pt\":\"Ilhas Salom??o\",\"nl\":\"Salomonseilanden\",\"hr\":\"Solomonski Otoci\",\"fa\":\"?????????? ????????????\",\"de\":\"Salomonen\",\"es\":\"Islas Salom??n\",\"fr\":\"??les Salomon\",\"ja\":\"??????????????????\",\"it\":\"Isole Salomone\",\"cn\":\"???????????????\"}', '-8.00000000', '159.00000000', '????????', 'U+1F1F8 U+1F1E7', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q685'),
(203, 'Somalia', 'SOM', '706', 'SO', '252', 'Mogadishu', 'SOS', 'Sh.so.', '.so', 'Soomaaliya', 'Africa', 'Eastern Africa', '[{\"zoneName\":\"Africa/Mogadishu\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"EAT\",\"tzName\":\"East Africa Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Som??lia\",\"pt\":\"Som??lia\",\"nl\":\"Somali??\",\"hr\":\"Somalija\",\"fa\":\"????????????\",\"de\":\"Somalia\",\"es\":\"Somalia\",\"fr\":\"Somalie\",\"ja\":\"????????????\",\"it\":\"Somalia\",\"cn\":\"?????????\"}', '10.00000000', '49.00000000', '????????', 'U+1F1F8 U+1F1F4', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q1045'),
(204, 'South Africa', 'ZAF', '710', 'ZA', '27', 'Pretoria', 'ZAR', 'R', '.za', 'South Africa', 'Africa', 'Southern Africa', '[{\"zoneName\":\"Africa/Johannesburg\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"SAST\",\"tzName\":\"South African Standard Time\"}]', '{\"kr\":\"??????????????? ?????????\",\"br\":\"Rep??blica Sul-Africana\",\"pt\":\"Rep??blica Sul-Africana\",\"nl\":\"Zuid-Afrika\",\"hr\":\"Ju??noafri??ka Republika\",\"fa\":\"?????????????? ??????????\",\"de\":\"Republik S??dafrika\",\"es\":\"Rep??blica de Sud??frica\",\"fr\":\"Afrique du Sud\",\"ja\":\"???????????????\",\"it\":\"Sud Africa\",\"cn\":\"??????\"}', '-29.00000000', '24.00000000', '????????', 'U+1F1FF U+1F1E6', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q258'),
(205, 'South Georgia', 'SGS', '239', 'GS', '500', 'Grytviken', 'GBP', '??', '.gs', 'South Georgia', 'Americas', 'South America', '[{\"zoneName\":\"Atlantic/South_Georgia\",\"gmtOffset\":-7200,\"gmtOffsetName\":\"UTC-02:00\",\"abbreviation\":\"GST\",\"tzName\":\"South Georgia and the South Sandwich Islands Time\"}]', '{\"kr\":\"??????????????????\",\"br\":\"Ilhas Ge??rgias do Sul e Sandwich do Sul\",\"pt\":\"Ilhas Ge??rgia do Sul e Sandu??che do Sul\",\"nl\":\"Zuid-Georgia en Zuidelijke Sandwicheilanden\",\"hr\":\"Ju??na Georgija i oto??je Ju??ni Sandwich\",\"fa\":\"?????????? ?????????????? ?????????? ?? ?????????????? ??????????\",\"de\":\"S??dgeorgien und die S??dlichen Sandwichinseln\",\"es\":\"Islas Georgias del Sur y Sandwich del Sur\",\"fr\":\"G??orgie du Sud-et-les ??les Sandwich du Sud\",\"ja\":\"???????????????????????????????????????????????????????????????\",\"it\":\"Georgia del Sud e Isole Sandwich Meridionali\",\"cn\":\"????????????\"}', '-54.50000000', '-37.00000000', '????????', 'U+1F1EC U+1F1F8', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, NULL),
(206, 'South Sudan', 'SSD', '728', 'SS', '211', 'Juba', 'SSP', '??', '.ss', 'South Sudan', 'Africa', 'Middle Africa', '[{\"zoneName\":\"Africa/Juba\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"EAT\",\"tzName\":\"East Africa Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Sud??o do Sul\",\"pt\":\"Sud??o do Sul\",\"nl\":\"Zuid-Soedan\",\"hr\":\"Ju??ni Sudan\",\"fa\":\"?????????? ??????????\",\"de\":\"S??dsudan\",\"es\":\"Sud??n del Sur\",\"fr\":\"Soudan du Sud\",\"ja\":\"???????????????\",\"it\":\"Sudan del sud\",\"cn\":\"?????????\"}', '7.00000000', '30.00000000', '????????', 'U+1F1F8 U+1F1F8', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q958'),
(207, 'Spain', 'ESP', '724', 'ES', '34', 'Madrid', 'EUR', '???', '.es', 'Espa??a', 'Europe', 'Southern Europe', '[{\"zoneName\":\"Africa/Ceuta\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"},{\"zoneName\":\"Atlantic/Canary\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC??00\",\"abbreviation\":\"WET\",\"tzName\":\"Western European Time\"},{\"zoneName\":\"Europe/Madrid\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Espanha\",\"pt\":\"Espanha\",\"nl\":\"Spanje\",\"hr\":\"??panjolska\",\"fa\":\"??????????????\",\"de\":\"Spanien\",\"es\":\"Espa??a\",\"fr\":\"Espagne\",\"ja\":\"????????????\",\"it\":\"Spagna\",\"cn\":\"?????????\"}', '40.00000000', '-4.00000000', '????????', 'U+1F1EA U+1F1F8', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q29'),
(208, 'Sri Lanka', 'LKA', '144', 'LK', '94', 'Colombo', 'LKR', 'Rs', '.lk', '??r?? la???k??va', 'Asia', 'Southern Asia', '[{\"zoneName\":\"Asia/Colombo\",\"gmtOffset\":19800,\"gmtOffsetName\":\"UTC+05:30\",\"abbreviation\":\"IST\",\"tzName\":\"Indian Standard Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Sri Lanka\",\"pt\":\"Sri Lanka\",\"nl\":\"Sri Lanka\",\"hr\":\"??ri Lanka\",\"fa\":\"???????????????????\",\"de\":\"Sri Lanka\",\"es\":\"Sri Lanka\",\"fr\":\"Sri Lanka\",\"ja\":\"???????????????\",\"it\":\"Sri Lanka\",\"cn\":\"????????????\"}', '7.00000000', '81.00000000', '????????', 'U+1F1F1 U+1F1F0', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q854'),
(209, 'Sudan', 'SDN', '729', 'SD', '249', 'Khartoum', 'SDG', '.??.??', '.sd', '??????????????', 'Africa', 'Northern Africa', '[{\"zoneName\":\"Africa/Khartoum\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EAT\",\"tzName\":\"Eastern African Time\"}]', '{\"kr\":\"??????\",\"br\":\"Sud??o\",\"pt\":\"Sud??o\",\"nl\":\"Soedan\",\"hr\":\"Sudan\",\"fa\":\"??????????\",\"de\":\"Sudan\",\"es\":\"Sud??n\",\"fr\":\"Soudan\",\"ja\":\"????????????\",\"it\":\"Sudan\",\"cn\":\"??????\"}', '15.00000000', '30.00000000', '????????', 'U+1F1F8 U+1F1E9', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q1049'),
(210, 'Suriname', 'SUR', '740', 'SR', '597', 'Paramaribo', 'SRD', '$', '.sr', 'Suriname', 'Americas', 'South America', '[{\"zoneName\":\"America/Paramaribo\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"SRT\",\"tzName\":\"Suriname Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Suriname\",\"pt\":\"Suriname\",\"nl\":\"Suriname\",\"hr\":\"Surinam\",\"fa\":\"??????????????\",\"de\":\"Suriname\",\"es\":\"Surinam\",\"fr\":\"Surinam\",\"ja\":\"????????????\",\"it\":\"Suriname\",\"cn\":\"?????????\"}', '4.00000000', '-56.00000000', '????????', 'U+1F1F8 U+1F1F7', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q730'),
(211, 'Svalbard And Jan Mayen Islands', 'SJM', '744', 'SJ', '47', 'Longyearbyen', 'NOK', 'kr', '.sj', 'Svalbard og Jan Mayen', 'Europe', 'Northern Europe', '[{\"zoneName\":\"Arctic/Longyearbyen\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"???????????? ????????? ??????\",\"br\":\"Svalbard\",\"pt\":\"Svalbard\",\"nl\":\"Svalbard en Jan Mayen\",\"hr\":\"Svalbard i Jan Mayen\",\"fa\":\"???????????????? ?? ?????? ????????\",\"de\":\"Svalbard und Jan Mayen\",\"es\":\"Islas Svalbard y Jan Mayen\",\"fr\":\"Svalbard et Jan Mayen\",\"ja\":\"?????????????????????????????????????????????????????????\",\"it\":\"Svalbard e Jan Mayen\",\"cn\":\"??????????????????????????????\"}', '78.00000000', '20.00000000', '????????', 'U+1F1F8 U+1F1EF', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, NULL),
(212, 'Swaziland', 'SWZ', '748', 'SZ', '268', 'Mbabane', 'SZL', 'E', '.sz', 'Swaziland', 'Africa', 'Southern Africa', '[{\"zoneName\":\"Africa/Mbabane\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"SAST\",\"tzName\":\"South African Standard Time\"}]', '{\"kr\":\"???????????????\",\"br\":\"Suazil??ndia\",\"pt\":\"Suazil??ndia\",\"nl\":\"Swaziland\",\"hr\":\"Svazi\",\"fa\":\"????????????????\",\"de\":\"Swasiland\",\"es\":\"Suazilandia\",\"fr\":\"Swaziland\",\"ja\":\"??????????????????\",\"it\":\"Swaziland\",\"cn\":\"????????????\"}', '-26.50000000', '31.50000000', '????????', 'U+1F1F8 U+1F1FF', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q1050'),
(213, 'Sweden', 'SWE', '752', 'SE', '46', 'Stockholm', 'SEK', 'kr', '.se', 'Sverige', 'Europe', 'Northern Europe', '[{\"zoneName\":\"Europe/Stockholm\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Su??cia\",\"pt\":\"Su??cia\",\"nl\":\"Zweden\",\"hr\":\"??vedska\",\"fa\":\"????????\",\"de\":\"Schweden\",\"es\":\"Suecia\",\"fr\":\"Su??de\",\"ja\":\"??????????????????\",\"it\":\"Svezia\",\"cn\":\"??????\"}', '62.00000000', '15.00000000', '????????', 'U+1F1F8 U+1F1EA', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q34'),
(214, 'Switzerland', 'CHE', '756', 'CH', '41', 'Bern', 'CHF', 'CHf', '.ch', 'Schweiz', 'Europe', 'Western Europe', '[{\"zoneName\":\"Europe/Zurich\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Su????a\",\"pt\":\"Su????a\",\"nl\":\"Zwitserland\",\"hr\":\"??vicarska\",\"fa\":\"??????????\",\"de\":\"Schweiz\",\"es\":\"Suiza\",\"fr\":\"Suisse\",\"ja\":\"?????????\",\"it\":\"Svizzera\",\"cn\":\"??????\"}', '47.00000000', '8.00000000', '????????', 'U+1F1E8 U+1F1ED', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q39'),
(215, 'Syria', 'SYR', '760', 'SY', '963', 'Damascus', 'SYP', 'LS', '.sy', '??????????', 'Asia', 'Western Asia', '[{\"zoneName\":\"Asia/Damascus\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"}]', '{\"kr\":\"?????????\",\"br\":\"S??ria\",\"pt\":\"S??ria\",\"nl\":\"Syri??\",\"hr\":\"Sirija\",\"fa\":\"??????????\",\"de\":\"Syrien\",\"es\":\"Siria\",\"fr\":\"Syrie\",\"ja\":\"??????????????????????????????\",\"it\":\"Siria\",\"cn\":\"?????????\"}', '35.00000000', '38.00000000', '????????', 'U+1F1F8 U+1F1FE', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q858'),
(216, 'Taiwan', 'TWN', '158', 'TW', '886', 'Taipei', 'TWD', '$', '.tw', '??????', 'Asia', 'Eastern Asia', '[{\"zoneName\":\"Asia/Taipei\",\"gmtOffset\":28800,\"gmtOffsetName\":\"UTC+08:00\",\"abbreviation\":\"CST\",\"tzName\":\"China Standard Time\"}]', '{\"kr\":\"??????\",\"br\":\"Taiwan\",\"pt\":\"Taiwan\",\"nl\":\"Taiwan\",\"hr\":\"Tajvan\",\"fa\":\"????????????\",\"de\":\"Taiwan\",\"es\":\"Taiw??n\",\"fr\":\"Ta??wan\",\"ja\":\"????????????????????????\",\"it\":\"Taiwan\",\"cn\":\"????????????\"}', '23.50000000', '121.00000000', '????????', 'U+1F1F9 U+1F1FC', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q865'),
(217, 'Tajikistan', 'TJK', '762', 'TJ', '992', 'Dushanbe', 'TJS', 'SM', '.tj', '????????????????????', 'Asia', 'Central Asia', '[{\"zoneName\":\"Asia/Dushanbe\",\"gmtOffset\":18000,\"gmtOffsetName\":\"UTC+05:00\",\"abbreviation\":\"TJT\",\"tzName\":\"Tajikistan Time\"}]', '{\"kr\":\"???????????????\",\"br\":\"Tajiquist??o\",\"pt\":\"Tajiquist??o\",\"nl\":\"Tadzjikistan\",\"hr\":\"Ta??ikistan\",\"fa\":\"??????????????????\",\"de\":\"Tadschikistan\",\"es\":\"Tayikist??n\",\"fr\":\"Tadjikistan\",\"ja\":\"??????????????????\",\"it\":\"Tagikistan\",\"cn\":\"???????????????\"}', '39.00000000', '71.00000000', '????????', 'U+1F1F9 U+1F1EF', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q863'),
(218, 'Tanzania', 'TZA', '834', 'TZ', '255', 'Dodoma', 'TZS', 'TSh', '.tz', 'Tanzania', 'Africa', 'Eastern Africa', '[{\"zoneName\":\"Africa/Dar_es_Salaam\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"EAT\",\"tzName\":\"East Africa Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Tanz??nia\",\"pt\":\"Tanz??nia\",\"nl\":\"Tanzania\",\"hr\":\"Tanzanija\",\"fa\":\"????????????????\",\"de\":\"Tansania\",\"es\":\"Tanzania\",\"fr\":\"Tanzanie\",\"ja\":\"???????????????\",\"it\":\"Tanzania\",\"cn\":\"????????????\"}', '-6.00000000', '35.00000000', '????????', 'U+1F1F9 U+1F1FF', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q924'),
(219, 'Thailand', 'THA', '764', 'TH', '66', 'Bangkok', 'THB', '???', '.th', '???????????????????????????', 'Asia', 'South-Eastern Asia', '[{\"zoneName\":\"Asia/Bangkok\",\"gmtOffset\":25200,\"gmtOffsetName\":\"UTC+07:00\",\"abbreviation\":\"ICT\",\"tzName\":\"Indochina Time\"}]', '{\"kr\":\"??????\",\"br\":\"Tail??ndia\",\"pt\":\"Tail??ndia\",\"nl\":\"Thailand\",\"hr\":\"Tajland\",\"fa\":\"????????????\",\"de\":\"Thailand\",\"es\":\"Tailandia\",\"fr\":\"Tha??lande\",\"ja\":\"??????\",\"it\":\"Tailandia\",\"cn\":\"??????\"}', '15.00000000', '100.00000000', '????????', 'U+1F1F9 U+1F1ED', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q869'),
(220, 'Togo', 'TGO', '768', 'TG', '228', 'Lome', 'XOF', 'CFA', '.tg', 'Togo', 'Africa', 'Western Africa', '[{\"zoneName\":\"Africa/Lome\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC??00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"}]', '{\"kr\":\"??????\",\"br\":\"Togo\",\"pt\":\"Togo\",\"nl\":\"Togo\",\"hr\":\"Togo\",\"fa\":\"????????\",\"de\":\"Togo\",\"es\":\"Togo\",\"fr\":\"Togo\",\"ja\":\"?????????\",\"it\":\"Togo\",\"cn\":\"??????\"}', '8.00000000', '1.16666666', '????????', 'U+1F1F9 U+1F1EC', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q945'),
(221, 'Tokelau', 'TKL', '772', 'TK', '690', '', 'NZD', '$', '.tk', 'Tokelau', 'Oceania', 'Polynesia', '[{\"zoneName\":\"Pacific/Fakaofo\",\"gmtOffset\":46800,\"gmtOffsetName\":\"UTC+13:00\",\"abbreviation\":\"TKT\",\"tzName\":\"Tokelau Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Tokelau\",\"pt\":\"Toquelau\",\"nl\":\"Tokelau\",\"hr\":\"Tokelau\",\"fa\":\"??????????????\",\"de\":\"Tokelau\",\"es\":\"Islas Tokelau\",\"fr\":\"Tokelau\",\"ja\":\"????????????\",\"it\":\"Isole Tokelau\",\"cn\":\"?????????\"}', '-9.00000000', '-172.00000000', '????????', 'U+1F1F9 U+1F1F0', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, NULL),
(222, 'Tonga', 'TON', '776', 'TO', '676', 'Nuku\'alofa', 'TOP', '$', '.to', 'Tonga', 'Oceania', 'Polynesia', '[{\"zoneName\":\"Pacific/Tongatapu\",\"gmtOffset\":46800,\"gmtOffsetName\":\"UTC+13:00\",\"abbreviation\":\"TOT\",\"tzName\":\"Tonga Time\"}]', '{\"kr\":\"??????\",\"br\":\"Tonga\",\"pt\":\"Tonga\",\"nl\":\"Tonga\",\"hr\":\"Tonga\",\"fa\":\"??????????\",\"de\":\"Tonga\",\"es\":\"Tonga\",\"fr\":\"Tonga\",\"ja\":\"?????????\",\"it\":\"Tonga\",\"cn\":\"??????\"}', '-20.00000000', '-175.00000000', '????????', 'U+1F1F9 U+1F1F4', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q678'),
(223, 'Trinidad And Tobago', 'TTO', '780', 'TT', '1868', 'Port of Spain', 'TTD', '$', '.tt', 'Trinidad and Tobago', 'Americas', 'Caribbean', '[{\"zoneName\":\"America/Port_of_Spain\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]', '{\"kr\":\"??????????????? ?????????\",\"br\":\"Trinidad e Tobago\",\"pt\":\"Trindade e Tobago\",\"nl\":\"Trinidad en Tobago\",\"hr\":\"Trinidad i Tobago\",\"fa\":\"???????????????? ?? ????????????\",\"de\":\"Trinidad und Tobago\",\"es\":\"Trinidad y Tobago\",\"fr\":\"Trinit?? et Tobago\",\"ja\":\"??????????????????????????????\",\"it\":\"Trinidad e Tobago\",\"cn\":\"????????????????????????\"}', '11.00000000', '-61.00000000', '????????', 'U+1F1F9 U+1F1F9', '2018-07-20 20:11:03', '2021-12-04 08:12:17', 1, 'Q754'),
(224, 'Tunisia', 'TUN', '788', 'TN', '216', 'Tunis', 'TND', '??.??', '.tn', '????????', 'Africa', 'Northern Africa', '[{\"zoneName\":\"Africa/Tunis\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Tun??sia\",\"pt\":\"Tun??sia\",\"nl\":\"Tunesi??\",\"hr\":\"Tunis\",\"fa\":\"????????\",\"de\":\"Tunesien\",\"es\":\"T??nez\",\"fr\":\"Tunisie\",\"ja\":\"???????????????\",\"it\":\"Tunisia\",\"cn\":\"?????????\"}', '34.00000000', '9.00000000', '????????', 'U+1F1F9 U+1F1F3', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q948'),
(225, 'Turkey', 'TUR', '792', 'TR', '90', 'Ankara', 'TRY', '???', '.tr', 'T??rkiye', 'Asia', 'Western Asia', '[{\"zoneName\":\"Europe/Istanbul\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"}]', '{\"kr\":\"??????\",\"br\":\"Turquia\",\"pt\":\"Turquia\",\"nl\":\"Turkije\",\"hr\":\"Turska\",\"fa\":\"??????????\",\"de\":\"T??rkei\",\"es\":\"Turqu??a\",\"fr\":\"Turquie\",\"ja\":\"?????????\",\"it\":\"Turchia\",\"cn\":\"?????????\"}', '39.00000000', '35.00000000', '????????', 'U+1F1F9 U+1F1F7', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q43'),
(226, 'Turkmenistan', 'TKM', '795', 'TM', '993', 'Ashgabat', 'TMT', 'T', '.tm', 'T??rkmenistan', 'Asia', 'Central Asia', '[{\"zoneName\":\"Asia/Ashgabat\",\"gmtOffset\":18000,\"gmtOffsetName\":\"UTC+05:00\",\"abbreviation\":\"TMT\",\"tzName\":\"Turkmenistan Time\"}]', '{\"kr\":\"?????????????????????\",\"br\":\"Turcomenist??o\",\"pt\":\"Turquemenist??o\",\"nl\":\"Turkmenistan\",\"hr\":\"Turkmenistan\",\"fa\":\"??????????????????\",\"de\":\"Turkmenistan\",\"es\":\"Turkmenist??n\",\"fr\":\"Turkm??nistan\",\"ja\":\"????????????????????????\",\"it\":\"Turkmenistan\",\"cn\":\"???????????????\"}', '40.00000000', '60.00000000', '????????', 'U+1F1F9 U+1F1F2', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q874'),
(227, 'Turks And Caicos Islands', 'TCA', '796', 'TC', '1649', 'Cockburn Town', 'USD', '$', '.tc', 'Turks and Caicos Islands', 'Americas', 'Caribbean', '[{\"zoneName\":\"America/Grand_Turk\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America\"}]', '{\"kr\":\"????????? ???????????? ??????\",\"br\":\"Ilhas Turcas e Caicos\",\"pt\":\"Ilhas Turcas e Caicos\",\"nl\":\"Turks- en Caicoseilanden\",\"hr\":\"Otoci Turks i Caicos\",\"fa\":\"?????????? ?????????? ?? ????????????\",\"de\":\"Turks- und Caicosinseln\",\"es\":\"Islas Turks y Caicos\",\"fr\":\"??les Turques-et-Ca??ques\",\"ja\":\"?????????????????????????????????\",\"it\":\"Isole Turks e Caicos\",\"cn\":\"???????????????????????????\"}', '21.75000000', '-71.58333333', '????????', 'U+1F1F9 U+1F1E8', '2018-07-20 20:11:03', '2021-12-04 08:12:06', 1, NULL),
(228, 'Tuvalu', 'TUV', '798', 'TV', '688', 'Funafuti', 'AUD', '$', '.tv', 'Tuvalu', 'Oceania', 'Polynesia', '[{\"zoneName\":\"Pacific/Funafuti\",\"gmtOffset\":43200,\"gmtOffsetName\":\"UTC+12:00\",\"abbreviation\":\"TVT\",\"tzName\":\"Tuvalu Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Tuvalu\",\"pt\":\"Tuvalu\",\"nl\":\"Tuvalu\",\"hr\":\"Tuvalu\",\"fa\":\"????????????\",\"de\":\"Tuvalu\",\"es\":\"Tuvalu\",\"fr\":\"Tuvalu\",\"ja\":\"?????????\",\"it\":\"Tuvalu\",\"cn\":\"?????????\"}', '-8.00000000', '178.00000000', '????????', 'U+1F1F9 U+1F1FB', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q672'),
(229, 'Uganda', 'UGA', '800', 'UG', '256', 'Kampala', 'UGX', 'USh', '.ug', 'Uganda', 'Africa', 'Eastern Africa', '[{\"zoneName\":\"Africa/Kampala\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"EAT\",\"tzName\":\"East Africa Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Uganda\",\"pt\":\"Uganda\",\"nl\":\"Oeganda\",\"hr\":\"Uganda\",\"fa\":\"??????????????\",\"de\":\"Uganda\",\"es\":\"Uganda\",\"fr\":\"Uganda\",\"ja\":\"????????????\",\"it\":\"Uganda\",\"cn\":\"?????????\"}', '1.00000000', '32.00000000', '????????', 'U+1F1FA U+1F1EC', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q1036'),
(230, 'Ukraine', 'UKR', '804', 'UA', '380', 'Kiev', 'UAH', '???', '.ua', '??????????????', 'Europe', 'Eastern Europe', '[{\"zoneName\":\"Europe/Kiev\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"},{\"zoneName\":\"Europe/Simferopol\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"MSK\",\"tzName\":\"Moscow Time\"},{\"zoneName\":\"Europe/Uzhgorod\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"},{\"zoneName\":\"Europe/Zaporozhye\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"}]', '{\"kr\":\"???????????????\",\"br\":\"Ucr??nia\",\"pt\":\"Ucr??nia\",\"nl\":\"Oekra??ne\",\"hr\":\"Ukrajina\",\"fa\":\"????????????\",\"de\":\"Ukraine\",\"es\":\"Ucrania\",\"fr\":\"Ukraine\",\"ja\":\"???????????????\",\"it\":\"Ucraina\",\"cn\":\"?????????\"}', '49.00000000', '32.00000000', '????????', 'U+1F1FA U+1F1E6', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q212'),
(231, 'United Arab Emirates', 'ARE', '784', 'AE', '971', 'Abu Dhabi', 'AED', '??.??', '.ae', '???????? ???????????????? ?????????????? ??????????????', 'Asia', 'Western Asia', '[{\"zoneName\":\"Asia/Dubai\",\"gmtOffset\":14400,\"gmtOffsetName\":\"UTC+04:00\",\"abbreviation\":\"GST\",\"tzName\":\"Gulf Standard Time\"}]', '{\"kr\":\"??????????????????\",\"br\":\"Emirados ??rabes Unidos\",\"pt\":\"Emirados ??rabes Unidos\",\"nl\":\"Verenigde Arabische Emiraten\",\"hr\":\"Ujedinjeni Arapski Emirati\",\"fa\":\"???????????? ?????????? ????????\",\"de\":\"Vereinigte Arabische Emirate\",\"es\":\"Emiratos ??rabes Unidos\",\"fr\":\"??mirats arabes unis\",\"ja\":\"????????????????????????\",\"it\":\"Emirati Arabi Uniti\",\"cn\":\"????????????????????????\"}', '24.00000000', '54.00000000', '????????', 'U+1F1E6 U+1F1EA', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q878'),
(232, 'United Kingdom', 'GBR', '826', 'GB', '44', 'London', 'GBP', '??', '.uk', 'United Kingdom', 'Europe', 'Northern Europe', '[{\"zoneName\":\"Europe/London\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC??00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"}]', '{\"kr\":\"??????\",\"br\":\"Reino Unido\",\"pt\":\"Reino Unido\",\"nl\":\"Verenigd Koninkrijk\",\"hr\":\"Ujedinjeno Kraljevstvo\",\"fa\":\"?????????????????? ???????? ?? ???????????? ??????????\",\"de\":\"Vereinigtes K??nigreich\",\"es\":\"Reino Unido\",\"fr\":\"Royaume-Uni\",\"ja\":\"????????????\",\"it\":\"Regno Unito\",\"cn\":\"??????\"}', '54.00000000', '-2.00000000', '????????', 'U+1F1EC U+1F1E7', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q145'),
(233, 'United States', 'USA', '840', 'US', '1', 'Washington', 'USD', '$', '.us', 'United States', 'Americas', 'Northern America', '[{\"zoneName\":\"America/Adak\",\"gmtOffset\":-36000,\"gmtOffsetName\":\"UTC-10:00\",\"abbreviation\":\"HST\",\"tzName\":\"Hawaii???Aleutian Standard Time\"},{\"zoneName\":\"America/Anchorage\",\"gmtOffset\":-32400,\"gmtOffsetName\":\"UTC-09:00\",\"abbreviation\":\"AKST\",\"tzName\":\"Alaska Standard Time\"},{\"zoneName\":\"America/Boise\",\"gmtOffset\":-25200,\"gmtOffsetName\":\"UTC-07:00\",\"abbreviation\":\"MST\",\"tzName\":\"Mountain Standard Time (North America\"},{\"zoneName\":\"America/Chicago\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"},{\"zoneName\":\"America/Denver\",\"gmtOffset\":-25200,\"gmtOffsetName\":\"UTC-07:00\",\"abbreviation\":\"MST\",\"tzName\":\"Mountain Standard Time (North America\"},{\"zoneName\":\"America/Detroit\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America\"},{\"zoneName\":\"America/Indiana/Indianapolis\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America\"},{\"zoneName\":\"America/Indiana/Knox\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"},{\"zoneName\":\"America/Indiana/Marengo\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America\"},{\"zoneName\":\"America/Indiana/Petersburg\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America\"},{\"zoneName\":\"America/Indiana/Tell_City\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"},{\"zoneName\":\"America/Indiana/Vevay\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America\"},{\"zoneName\":\"America/Indiana/Vincennes\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America\"},{\"zoneName\":\"America/Indiana/Winamac\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America\"},{\"zoneName\":\"America/Juneau\",\"gmtOffset\":-32400,\"gmtOffsetName\":\"UTC-09:00\",\"abbreviation\":\"AKST\",\"tzName\":\"Alaska Standard Time\"},{\"zoneName\":\"America/Kentucky/Louisville\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America\"},{\"zoneName\":\"America/Kentucky/Monticello\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America\"},{\"zoneName\":\"America/Los_Angeles\",\"gmtOffset\":-28800,\"gmtOffsetName\":\"UTC-08:00\",\"abbreviation\":\"PST\",\"tzName\":\"Pacific Standard Time (North America\"},{\"zoneName\":\"America/Menominee\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"},{\"zoneName\":\"America/Metlakatla\",\"gmtOffset\":-32400,\"gmtOffsetName\":\"UTC-09:00\",\"abbreviation\":\"AKST\",\"tzName\":\"Alaska Standard Time\"},{\"zoneName\":\"America/New_York\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America\"},{\"zoneName\":\"America/Nome\",\"gmtOffset\":-32400,\"gmtOffsetName\":\"UTC-09:00\",\"abbreviation\":\"AKST\",\"tzName\":\"Alaska Standard Time\"},{\"zoneName\":\"America/North_Dakota/Beulah\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"},{\"zoneName\":\"America/North_Dakota/Center\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"},{\"zoneName\":\"America/North_Dakota/New_Salem\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"},{\"zoneName\":\"America/Phoenix\",\"gmtOffset\":-25200,\"gmtOffsetName\":\"UTC-07:00\",\"abbreviation\":\"MST\",\"tzName\":\"Mountain Standard Time (North America\"},{\"zoneName\":\"America/Sitka\",\"gmtOffset\":-32400,\"gmtOffsetName\":\"UTC-09:00\",\"abbreviation\":\"AKST\",\"tzName\":\"Alaska Standard Time\"},{\"zoneName\":\"America/Yakutat\",\"gmtOffset\":-32400,\"gmtOffsetName\":\"UTC-09:00\",\"abbreviation\":\"AKST\",\"tzName\":\"Alaska Standard Time\"},{\"zoneName\":\"Pacific/Honolulu\",\"gmtOffset\":-36000,\"gmtOffsetName\":\"UTC-10:00\",\"abbreviation\":\"HST\",\"tzName\":\"Hawaii???Aleutian Standard Time\"}]', '{\"kr\":\"??????\",\"br\":\"Estados Unidos\",\"pt\":\"Estados Unidos\",\"nl\":\"Verenigde Staten\",\"hr\":\"Sjedinjene Ameri??ke Dr??ave\",\"fa\":\"???????????? ?????????? ????????????\",\"de\":\"Vereinigte Staaten von Amerika\",\"es\":\"Estados Unidos\",\"fr\":\"??tats-Unis\",\"ja\":\"?????????????????????\",\"it\":\"Stati Uniti D\'America\",\"cn\":\"??????\"}', '38.00000000', '-97.00000000', '????????', 'U+1F1FA U+1F1F8', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q30'),
(234, 'United States Minor Outlying Islands', 'UMI', '581', 'UM', '1', '', 'USD', '$', '.us', 'United States Minor Outlying Islands', 'Americas', 'Northern America', '[{\"zoneName\":\"Pacific/Midway\",\"gmtOffset\":-39600,\"gmtOffsetName\":\"UTC-11:00\",\"abbreviation\":\"SST\",\"tzName\":\"Samoa Standard Time\"},{\"zoneName\":\"Pacific/Wake\",\"gmtOffset\":43200,\"gmtOffsetName\":\"UTC+12:00\",\"abbreviation\":\"WAKT\",\"tzName\":\"Wake Island Time\"}]', '{\"kr\":\"????????? ?????? ??????\",\"br\":\"Ilhas Menores Distantes dos Estados Unidos\",\"pt\":\"Ilhas Menores Distantes dos Estados Unidos\",\"nl\":\"Kleine afgelegen eilanden van de Verenigde Staten\",\"hr\":\"Mali udaljeni otoci SAD-a\",\"fa\":\"?????????? ???????? ????????????????? ???????????? ?????????? ????????????\",\"de\":\"Kleinere Inselbesitzungen der Vereinigten Staaten\",\"es\":\"Islas Ultramarinas Menores de Estados Unidos\",\"fr\":\"??les mineures ??loign??es des ??tats-Unis\",\"ja\":\"????????????????????????\",\"it\":\"Isole minori esterne degli Stati Uniti d\'America\",\"cn\":\"????????????????????????\"}', '0.00000000', '0.00000000', '????????', 'U+1F1FA U+1F1F2', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, NULL),
(235, 'Uruguay', 'URY', '858', 'UY', '598', 'Montevideo', 'UYU', '$', '.uy', 'Uruguay', 'Americas', 'South America', '[{\"zoneName\":\"America/Montevideo\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"UYT\",\"tzName\":\"Uruguay Standard Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Uruguai\",\"pt\":\"Uruguai\",\"nl\":\"Uruguay\",\"hr\":\"Urugvaj\",\"fa\":\"??????????????\",\"de\":\"Uruguay\",\"es\":\"Uruguay\",\"fr\":\"Uruguay\",\"ja\":\"???????????????\",\"it\":\"Uruguay\",\"cn\":\"?????????\"}', '-33.00000000', '-56.00000000', '????????', 'U+1F1FA U+1F1FE', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q77'),
(236, 'Uzbekistan', 'UZB', '860', 'UZ', '998', 'Tashkent', 'UZS', '????', '.uz', 'O???zbekiston', 'Asia', 'Central Asia', '[{\"zoneName\":\"Asia/Samarkand\",\"gmtOffset\":18000,\"gmtOffsetName\":\"UTC+05:00\",\"abbreviation\":\"UZT\",\"tzName\":\"Uzbekistan Time\"},{\"zoneName\":\"Asia/Tashkent\",\"gmtOffset\":18000,\"gmtOffsetName\":\"UTC+05:00\",\"abbreviation\":\"UZT\",\"tzName\":\"Uzbekistan Time\"}]', '{\"kr\":\"??????????????????\",\"br\":\"Uzbequist??o\",\"pt\":\"Usbequist??o\",\"nl\":\"Oezbekistan\",\"hr\":\"Uzbekistan\",\"fa\":\"????????????????\",\"de\":\"Usbekistan\",\"es\":\"Uzbekist??n\",\"fr\":\"Ouzb??kistan\",\"ja\":\"?????????????????????\",\"it\":\"Uzbekistan\",\"cn\":\"??????????????????\"}', '41.00000000', '64.00000000', '????????', 'U+1F1FA U+1F1FF', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q265'),
(237, 'Vanuatu', 'VUT', '548', 'VU', '678', 'Port Vila', 'VUV', 'VT', '.vu', 'Vanuatu', 'Oceania', 'Melanesia', '[{\"zoneName\":\"Pacific/Efate\",\"gmtOffset\":39600,\"gmtOffsetName\":\"UTC+11:00\",\"abbreviation\":\"VUT\",\"tzName\":\"Vanuatu Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Vanuatu\",\"pt\":\"Vanuatu\",\"nl\":\"Vanuatu\",\"hr\":\"Vanuatu\",\"fa\":\"??????????????\",\"de\":\"Vanuatu\",\"es\":\"Vanuatu\",\"fr\":\"Vanuatu\",\"ja\":\"????????????\",\"it\":\"Vanuatu\",\"cn\":\"????????????\"}', '-16.00000000', '167.00000000', '????????', 'U+1F1FB U+1F1FA', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q686'),
(238, 'Vatican City State (Holy See)', 'VAT', '336', 'VA', '379', 'Vatican City', 'EUR', '???', '.va', 'Vaticano', 'Europe', 'Southern Europe', '[{\"zoneName\":\"Europe/Vatican\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"????????? ??????\",\"br\":\"Vaticano\",\"pt\":\"Vaticano\",\"nl\":\"Heilige Stoel\",\"hr\":\"Sveta Stolica\",\"fa\":\"???????? ????????\",\"de\":\"Heiliger Stuhl\",\"es\":\"Santa Sede\",\"fr\":\"voir Saint\",\"ja\":\"??????\",\"it\":\"Santa Sede\",\"cn\":\"?????????\"}', '41.90000000', '12.45000000', '????????', 'U+1F1FB U+1F1E6', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q237'),
(239, 'Venezuela', 'VEN', '862', 'VE', '58', 'Caracas', 'VEF', 'Bs', '.ve', 'Venezuela', 'Americas', 'South America', '[{\"zoneName\":\"America/Caracas\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"VET\",\"tzName\":\"Venezuelan Standard Time\"}]', '{\"kr\":\"???????????????\",\"br\":\"Venezuela\",\"pt\":\"Venezuela\",\"nl\":\"Venezuela\",\"hr\":\"Venezuela\",\"fa\":\"??????????????\",\"de\":\"Venezuela\",\"es\":\"Venezuela\",\"fr\":\"Venezuela\",\"ja\":\"???????????????????????????????????????\",\"it\":\"Venezuela\",\"cn\":\"????????????\"}', '8.00000000', '-66.00000000', '????????', 'U+1F1FB U+1F1EA', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q717'),
(240, 'Vietnam', 'VNM', '704', 'VN', '84', 'Hanoi', 'VND', '???', '.vn', 'Vi???t Nam', 'Asia', 'South-Eastern Asia', '[{\"zoneName\":\"Asia/Ho_Chi_Minh\",\"gmtOffset\":25200,\"gmtOffsetName\":\"UTC+07:00\",\"abbreviation\":\"ICT\",\"tzName\":\"Indochina Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Vietn??\",\"pt\":\"Vietname\",\"nl\":\"Vietnam\",\"hr\":\"Vijetnam\",\"fa\":\"????????????\",\"de\":\"Vietnam\",\"es\":\"Vietnam\",\"fr\":\"Vi??t Nam\",\"ja\":\"????????????\",\"it\":\"Vietnam\",\"cn\":\"??????\"}', '16.16666666', '107.83333333', '????????', 'U+1F1FB U+1F1F3', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q881'),
(241, 'Virgin Islands (British)', 'VGB', '092', 'VG', '1284', 'Road Town', 'USD', '$', '.vg', 'British Virgin Islands', 'Americas', 'Caribbean', '[{\"zoneName\":\"America/Tortola\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]', '{\"kr\":\"????????? ??????????????????\",\"br\":\"Ilhas Virgens Brit??nicas\",\"pt\":\"Ilhas Virgens Brit??nicas\",\"nl\":\"Britse Maagdeneilanden\",\"hr\":\"Britanski Djevi??anski Otoci\",\"fa\":\"?????????? ???????????? ????????????????\",\"de\":\"Britische Jungferninseln\",\"es\":\"Islas V??rgenes del Reino Unido\",\"fr\":\"??les Vierges britanniques\",\"ja\":\"????????????????????????????????????\",\"it\":\"Isole Vergini Britanniche\",\"cn\":\"??????????????????????????????\"}', '18.43138300', '-64.62305000', '????????', 'U+1F1FB U+1F1EC', '2018-07-20 20:11:03', '2021-12-04 08:11:51', 1, NULL),
(242, 'Virgin Islands (US)', 'VIR', '850', 'VI', '1340', 'Charlotte Amalie', 'USD', '$', '.vi', 'United States Virgin Islands', 'Americas', 'Caribbean', '[{\"zoneName\":\"America/St_Thomas\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]', '{\"kr\":\"????????? ??????????????????\",\"br\":\"Ilhas Virgens Americanas\",\"pt\":\"Ilhas Virgens Americanas\",\"nl\":\"Verenigde Staten Maagdeneilanden\",\"fa\":\"?????????? ???????????? ????????????\",\"de\":\"Amerikanische Jungferninseln\",\"es\":\"Islas V??rgenes de los Estados Unidos\",\"fr\":\"??les Vierges des ??tats-Unis\",\"ja\":\"????????????????????????????????????\",\"it\":\"Isole Vergini americane\",\"cn\":\"???????????????????????????\"}', '18.34000000', '-64.93000000', '????????', 'U+1F1FB U+1F1EE', '2018-07-20 20:11:03', '2021-12-04 08:11:40', 1, NULL),
(243, 'Wallis And Futuna Islands', 'WLF', '876', 'WF', '681', 'Mata Utu', 'XPF', '???', '.wf', 'Wallis et Futuna', 'Oceania', 'Polynesia', '[{\"zoneName\":\"Pacific/Wallis\",\"gmtOffset\":43200,\"gmtOffsetName\":\"UTC+12:00\",\"abbreviation\":\"WFT\",\"tzName\":\"Wallis & Futuna Time\"}]', '{\"kr\":\"????????? ?????????\",\"br\":\"Wallis e Futuna\",\"pt\":\"Wallis e Futuna\",\"nl\":\"Wallis en Futuna\",\"hr\":\"Wallis i Fortuna\",\"fa\":\"?????????? ?? ????????????\",\"de\":\"Wallis und Futuna\",\"es\":\"Wallis y Futuna\",\"fr\":\"Wallis-et-Futuna\",\"ja\":\"????????????????????????\",\"it\":\"Wallis e Futuna\",\"cn\":\"?????????????????????????????????\"}', '-13.30000000', '-176.20000000', '????????', 'U+1F1FC U+1F1EB', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, NULL),
(244, 'Western Sahara', 'ESH', '732', 'EH', '212', 'El-Aaiun', 'MAD', 'MAD', '.eh', '?????????????? ??????????????', 'Africa', 'Northern Africa', '[{\"zoneName\":\"Africa/El_Aaiun\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"WEST\",\"tzName\":\"Western European Summer Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Saara Ocidental\",\"pt\":\"Saara Ocidental\",\"nl\":\"Westelijke Sahara\",\"hr\":\"Zapadna Sahara\",\"fa\":\"???????????? ?????????????????? ???????? ????????\",\"de\":\"Westsahara\",\"es\":\"Sahara Occidental\",\"fr\":\"Sahara Occidental\",\"ja\":\"????????????\",\"it\":\"Sahara Occidentale\",\"cn\":\"????????????\"}', '24.50000000', '-13.00000000', '????????', 'U+1F1EA U+1F1ED', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, NULL),
(245, 'Yemen', 'YEM', '887', 'YE', '967', 'Sanaa', 'YER', '???', '.ye', '??????????????', 'Asia', 'Western Asia', '[{\"zoneName\":\"Asia/Aden\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"AST\",\"tzName\":\"Arabia Standard Time\"}]', '{\"kr\":\"??????\",\"br\":\"I??men\",\"pt\":\"I??men\",\"nl\":\"Jemen\",\"hr\":\"Jemen\",\"fa\":\"??????\",\"de\":\"Jemen\",\"es\":\"Yemen\",\"fr\":\"Y??men\",\"ja\":\"????????????\",\"it\":\"Yemen\",\"cn\":\"??????\"}', '15.00000000', '48.00000000', '????????', 'U+1F1FE U+1F1EA', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q805'),
(246, 'Zambia', 'ZMB', '894', 'ZM', '260', 'Lusaka', 'ZMW', 'ZK', '.zm', 'Zambia', 'Africa', 'Eastern Africa', '[{\"zoneName\":\"Africa/Lusaka\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"CAT\",\"tzName\":\"Central Africa Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Z??mbia\",\"pt\":\"Z??mbia\",\"nl\":\"Zambia\",\"hr\":\"Zambija\",\"fa\":\"????????????\",\"de\":\"Sambia\",\"es\":\"Zambia\",\"fr\":\"Zambie\",\"ja\":\"????????????\",\"it\":\"Zambia\",\"cn\":\"?????????\"}', '-15.00000000', '30.00000000', '????????', 'U+1F1FF U+1F1F2', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q953'),
(247, 'Zimbabwe', 'ZWE', '716', 'ZW', '263', 'Harare', 'ZWL', '$', '.zw', 'Zimbabwe', 'Africa', 'Eastern Africa', '[{\"zoneName\":\"Africa/Harare\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"CAT\",\"tzName\":\"Central Africa Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Zimbabwe\",\"pt\":\"Zimbabu??\",\"nl\":\"Zimbabwe\",\"hr\":\"Zimbabve\",\"fa\":\"??????????????\",\"de\":\"Simbabwe\",\"es\":\"Zimbabue\",\"fr\":\"Zimbabwe\",\"ja\":\"???????????????\",\"it\":\"Zimbabwe\",\"cn\":\"????????????\"}', '-20.00000000', '30.00000000', '????????', 'U+1F1FF U+1F1FC', '2018-07-20 20:11:03', '2021-08-01 14:37:27', 1, 'Q954'),
(248, 'Kosovo', 'XKX', '926', 'XK', '383', 'Pristina', 'EUR', '???', '.xk', 'Republika e Kosov??s', 'Europe', 'Eastern Europe', '[{\"zoneName\":\"Europe/Belgrade\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"?????????\",\"cn\":\"?????????\"}', '42.56129090', '20.34030350', '????????', 'U+1F1FD U+1F1F0', '2020-08-15 15:33:50', '2021-08-01 14:37:57', 1, 'Q1246'),
(249, 'Cura??ao', 'CUW', '531', 'CW', '599', 'Willemstad', 'ANG', '??', '.cw', 'Cura??ao', 'Americas', 'Caribbean', '[{\"zoneName\":\"America/Curacao\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Cura??ao\",\"pt\":\"Cura??ao\",\"nl\":\"Cura??ao\",\"fa\":\"????????????????\",\"de\":\"Cura??ao\",\"fr\":\"Cura??ao\",\"it\":\"Cura??ao\",\"cn\":\"?????????\"}', '12.11666700', '-68.93333300', '????????', 'U+1F1E8 U+1F1FC', '2020-10-25 14:54:20', '2021-08-01 14:37:27', 1, 'Q25279'),
(250, 'Sint Maarten (Dutch part)', 'SXM', '534', 'SX', '1721', 'Philipsburg', 'ANG', '??', '.sx', 'Sint Maarten', 'Americas', 'Caribbean', '[{\"zoneName\":\"America/Anguilla\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]', '{\"kr\":\"???????????????\",\"br\":\"Sint Maarten\",\"pt\":\"S??o Martinho\",\"nl\":\"Sint Maarten\",\"fa\":\"???????? ??????????\",\"de\":\"Sint Maarten (niederl. Teil)\",\"fr\":\"Saint Martin (partie n??erlandaise)\",\"it\":\"Saint Martin (parte olandese)\",\"cn\":\"??????????????????????????????\"}', '18.03333300', '-63.05000000', '????????', 'U+1F1F8 U+1F1FD', '2020-12-05 13:03:39', '2021-08-01 14:37:27', 1, 'Q26273');

-- --------------------------------------------------------

--
-- Table structure for table `coupon`
--

CREATE TABLE `coupon` (
  `id` bigint(20) NOT NULL,
  `name` varchar(25) DEFAULT NULL,
  `code` text NOT NULL,
  `newuser` int(11) NOT NULL,
  `usage_no` int(20) DEFAULT 0,
  `expire` datetime NOT NULL,
  `package` text NOT NULL,
  `credit` int(11) NOT NULL,
  `type` bigint(11) NOT NULL,
  `status` int(2) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `currency`
--

CREATE TABLE `currency` (
  `id` int(11) NOT NULL,
  `code` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iso2` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `symbol` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rate` decimal(12,2) NOT NULL DEFAULT 0.00,
  `status` int(2) NOT NULL DEFAULT 0,
  `updatetime` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `currency`
--

INSERT INTO `currency` (`id`, `code`, `iso2`, `symbol`, `rate`, `status`, `updatetime`) VALUES
(1, 'USD', 'US', '$', '0.16', 1, 1646352001),
(2, 'GBP', 'GB', '??', '0.12', 1, 1646352001),
(3, 'SGD', 'SG', '$', '0.22', 1, 1646352001),
(4, 'JPY', 'JP', '??', '18.29', 1, 1646352001),
(5, 'CNY', 'CN', '??', '1.00', 1, 1646352001),
(6, 'CAD', 'CA', '$', '0.20', 1, 1646352001),
(7, 'HKD', 'HK', '$', '1.24', 1, 1646352001),
(8, 'INR', 'IN', '???', '11.99', 1, 1646352001),
(9, 'RUB', 'RU', '???', '17.72', 1, 1646352001),
(10, 'TWD', 'TW', '$', '4.43', 1, 1646352001),
(11, 'GHS', 'GH', 'GH???', '1.19', 1, 1646352001);

-- --------------------------------------------------------

--
-- Table structure for table `email_verify`
--

CREATE TABLE `email_verify` (
  `id` bigint(20) NOT NULL,
  `email` text NOT NULL,
  `ip` text NOT NULL,
  `code` text NOT NULL,
  `expire_in` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `question` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `link`
--
CREATE TABLE `iplist` (
  `id` bigint(20) NOT NULL,
  `nodeid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `ip` text NOT NULL,
  `datetime` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `link` (
  `id` bigint(20) NOT NULL,
  `type` int(11) NOT NULL,
  `address` text NOT NULL,
  `port` int(11) NOT NULL,
  `token` text NOT NULL,
  `ios` int(11) NOT NULL DEFAULT 0,
  `userid` bigint(20) NOT NULL,
  `isp` text DEFAULT NULL,
  `geo` int(11) DEFAULT NULL,
  `method` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `link`
--

INSERT INTO `link` (`id`, `type`, `address`, `port`, `token`, `ios`, `userid`, `isp`, `geo`, `method`) VALUES
(1, 11, '', 0, 'mx4xr0DtyTNTaCQ2', 0, 1, NULL, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `login_ip`
--

CREATE TABLE `login_ip` (
  `id` bigint(20) NOT NULL,
  `userid` bigint(20) NOT NULL,
  `username` varchar(250) DEFAULT NULL,
  `ip` text NOT NULL,
  `datetime` bigint(20) NOT NULL,
  `type` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `notice`
--

CREATE TABLE `notice` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `content` longtext NOT NULL,
  `content_cn` longtext DEFAULT NULL,
  `markdown` longtext NOT NULL,
  `markdown_cn` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL,
  `close_date` bigint(20) DEFAULT NULL,
  `create_date` bigint(20) DEFAULT NULL,
  `order_id` varchar(250) NOT NULL,
  `pay_date` bigint(20) DEFAULT NULL,
  `price` decimal(12,2) DEFAULT NULL,
  `really_price` decimal(12,2) DEFAULT NULL,
  `state` int(11) NOT NULL DEFAULT 0,
  `type` int(11) NOT NULL,
  `userid` bigint(20) DEFAULT NULL,
  `email` varchar(250) DEFAULT NULL,
  `username` varchar(25) DEFAULT NULL,
  `total` decimal(12,2) DEFAULT NULL,
  `packagetype` varchar(2) DEFAULT NULL,
  `packageid` bigint(10) DEFAULT NULL,
  `packagexp` bigint(10) DEFAULT NULL,
  `coupon` text DEFAULT NULL,
  `discount` decimal(12,2) DEFAULT NULL,
  `exp` bigint(20) DEFAULT NULL,
  `expdate` text DEFAULT NULL,
  `exrate` decimal(12,2) NOT NULL,
  `pay_url`  LONGTEXT  NULL DEFAULT NULL,
  `renew` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `package`
--

CREATE TABLE `package` (
  `id` bigint(20) NOT NULL,
  `type` varchar(25) DEFAULT NULL,
  `name` text DEFAULT NULL,
  `cn_name` text DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `bandwidth` text NOT NULL,
  `buy_count` varchar(11) NOT NULL DEFAULT '0',
  `custom` varchar(500) NOT NULL DEFAULT '{"expire":"30","price":0,"status":0}',
  `monthly` varchar(500) NOT NULL DEFAULT '{"expire":"30","price":0,"status":0}',
  `quaterly` varchar(500) NOT NULL DEFAULT '{"expire":"90","price":0,"status":0}',
  `semiannually` varchar(500) NOT NULL DEFAULT '{"expire":"180","price":0,"status":0}',
  `annually` varchar(500) NOT NULL DEFAULT '{"expire":"360","price":0,"status":0}',
  `reset_renew` tinyint(1) NOT NULL DEFAULT 0,
  `renew_type` tinyint(1) NOT NULL DEFAULT 1,
  `renew_traffic_type` tinyint(1) NOT NULL DEFAULT 1,
  `reset_every_days` int(10) NOT NULL DEFAULT 30,
  `connector` int(5) NOT NULL DEFAULT 2,
  `speedlimit` int(10) NOT NULL DEFAULT 0,
  `group` int(5) NOT NULL DEFAULT 1,
  `level` int(5) NOT NULL DEFAULT 0,
  `note` longtext DEFAULT NULL,
  `topup_price` decimal(12,2) NOT NULL DEFAULT 0.00,
  `sort` int(2) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset`
--

CREATE TABLE `password_reset` (
  `id` int(11) NOT NULL,
  `email` varchar(32) NOT NULL,
  `token` varchar(128) NOT NULL,
  `init_time` int(11) NOT NULL,
  `expire_time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payout`
--

CREATE TABLE `payout` (
  `id` int(12) NOT NULL,
  `userid` int(12) NOT NULL,
  `amount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `account` varchar(120) CHARACTER SET utf8mb4 DEFAULT NULL,
  `method` int(5) NOT NULL DEFAULT 1,
  `status` int(11) DEFAULT NULL,
  `datetime` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rule_list`
--

CREATE TABLE `rule_list` (
  `id` int(11) NOT NULL,
  `name` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `regex` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rule_list`
--

INSERT INTO `rule_list` (`id`, `name`, `regex`, `type`) VALUES
(1, '360-1', '(.*\\.||)(360|360safe|so|360totalsecurity|qihoo|qhimg)\\.(cn|com)', 1),
(2, 'Spam-1', '(^.*@)(guerrillamail|guerrillamailblock|sharklasers|grr|pokemail|spam4|bccto|chacuo|027168).(info|biz|com|de|net|org|me|la)', 1),
(3, 'Spam-2', '(Subject|HELO|SMTP)', 1),
(4, 'Thunder', '(.?)(xunlei|sandai|Thunder|XLLiveUD)(.)', 1),
(5, 'BitTorrent', 'BitTorrent protocol', 1),
(6, 'BT', '(torrent|.torrent|peer_id=|info_hash|get_peers|find_node|BitTorrent|announce_peer|announce.php?passkey=)', 1),
(7, '360-2', '(.+.|^)(360|so).(cn|com)', 1),
(8, 'Baidu-Nav', '(api|ps|sv|offnavi|newvector|ulog.imap|newloc)(.map|).(baidu|n.shifen).com', 1);

-- --------------------------------------------------------

--
-- Table structure for table `rule_log`
--

CREATE TABLE `rule_log` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `username` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `list_id` bigint(20) NOT NULL,
  `datetime` bigint(20) NOT NULL,
  `server_id` int(11) NOT NULL,
  `status` int(2) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `servers`
--

CREATE TABLE `servers` (
  `id` int(11) NOT NULL,
  `emoji` tinyint(1) NOT NULL DEFAULT 1,
  `name` varchar(128) CHARACTER SET utf8mb4 NOT NULL,
  `type` int(3) NOT NULL,
  `server` varchar(300) CHARACTER SET utf8mb4 NOT NULL,
  `rserver` varchar(300) CHARACTER SET utf8mb4 DEFAULT NULL,
  `headertype` text CHARACTER SET utf8mb4 NOT NULL,
  `port` int(10) NOT NULL DEFAULT 443,
  `outside_port` varchar(10) CHARACTER SET utf8mb4 DEFAULT NULL,
  `protocol` text CHARACTER SET utf8mb4 NOT NULL,
  `flow` text CHARACTER SET utf8mb4 NOT NULL,
  `security` varchar(5) CHARACTER SET utf8mb4 NOT NULL DEFAULT 'tls',
  `xhost` longtext CHARACTER SET utf8mb4 DEFAULT NULL,
  `xpath` longtext CHARACTER SET utf8mb4 DEFAULT NULL,
  `info` varchar(128) CHARACTER SET utf8mb4 DEFAULT NULL,
  `status` varchar(128) CHARACTER SET utf8mb4 DEFAULT NULL,
  `rate` float NOT NULL DEFAULT 1,
  `level` int(11) NOT NULL DEFAULT 0,
  `speedlimit` int(20) NOT NULL DEFAULT 0,
  `sni` longtext CHARACTER SET utf8mb4 DEFAULT NULL,
  `bandwidth` bigint(20) NOT NULL DEFAULT 0,
  `bandwidth_limit` bigint(20) NOT NULL DEFAULT 0,
  `bandwidthlimit_resetday` int(5) NOT NULL DEFAULT 0,
  `heartbeat` bigint(20) NOT NULL DEFAULT 0,
  `node_ip` longtext CHARACTER SET utf8mb4 NOT NULL,
  `group` int(11) NOT NULL DEFAULT 0,
  `online` tinyint(1) NOT NULL DEFAULT 1,
  `sort` int(3) NOT NULL DEFAULT 0,
  `method` varchar(50) CHARACTER SET utf8mb4 NOT NULL DEFAULT 'aes-128-gcm',
  `mu_only` int(2) NOT NULL DEFAULT 1,
  `allowinsecure` tinyint(2) NOT NULL DEFAULT 0,
  `cloudflare` tinyint(1) NOT NULL DEFAULT 0,
  `cloudflare_cdn` tinyint(1) NOT NULL DEFAULT 0,
  `relay` int(2) NOT NULL DEFAULT 0,
  `relayid` int(2) NOT NULL DEFAULT 0,
  `listenip` varchar(15) CHARACTER SET utf8mb4 NOT NULL DEFAULT '0.0.0.0',
  `sniffing` int(2) NOT NULL DEFAULT 1,
  `proxy_protocol` int(2) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `servers`
--

INSERT INTO `servers` (`id`, `emoji`, `name`, `type`, `server`, `rserver`, `headertype`, `port`, `outside_port`, `protocol`, `flow`, `security`, `xhost`, `xpath`, `info`, `status`, `rate`, `level`, `speedlimit`, `sni`, `bandwidth`, `bandwidth_limit`, `bandwidthlimit_resetday`, `heartbeat`, `node_ip`, `group`, `online`, `sort`, `method`, `mu_only`, `allowinsecure`, `cloudflare`, `cloudflare_cdn`, `relay`, `relayid`, `listenip`, `sniffing`, `proxy_protocol`) VALUES
(1, 1, 'Expired/??????', 0, '127.0.0.1', NULL, '', 443, '', '', '', 'tls', '', '', 'GB', NULL, 0, -1, 0, '0', 0, 0, 0, 0, '127.0.0.1', 0, 0, 1, 'aes-128-gcm', 1, 0, 0, 0, 0, 0, '0.0.0.0', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `server_info`
--

CREATE TABLE `server_info` (
  `id` int(11) NOT NULL,
  `node_id` int(11) NOT NULL,
  `uptime` float NOT NULL,
  `load` varchar(32) NOT NULL,
  `log_time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `server_online_log`
--

CREATE TABLE `server_online_log` (
  `id` int(11) NOT NULL,
  `node_id` int(11) NOT NULL,
  `online_user` int(11) NOT NULL,
  `log_time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `setup`
--

CREATE TABLE `setup` (
  `id` int(25) NOT NULL,
  `title` text DEFAULT NULL,
  `type` varchar(11) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `content_cn` text DEFAULT NULL,
  `datetime` bigint(25) DEFAULT NULL,
  `status` int(2) NOT NULL DEFAULT 0,
  `url` text DEFAULT NULL,
  `link` text DEFAULT NULL,
  `icon` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `setup`
--

INSERT INTO `setup` (`id`, `title`, `type`, `content`, `content_cn`, `datetime`, `status`, `url`, `link`, `icon`) VALUES
(1, 'Clash', '1', '<center><video id=\"0\" controls=\"controls\" width=\"800\" height=\"380\">\n<source src=\"/uploads/and/clash.mp4\" type=\"video/mp4\" />\n<source src=\"/uploads/and/clash.ogv\" type=\"video/ogg; codecs=\" theora=\"\" vorbis=\"\" />\n<source src=\"/uploads/and/clash.webm\" type=\"video/webm\" /></video></center>', '<center><video id=\"0\" controls=\"controls\" width=\"800\" height=\"380\">\n<source src=\"/uploads/and/clash.mp4\" type=\"video/mp4\" />\n<source src=\"/uploads/and/clash.ogv\" type=\"video/ogg; codecs=\" theora=\"\" vorbis=\"\" />\n<source src=\"/uploads/and/clash.webm\" type=\"video/webm\" /></video></center>', 1645118767, 1, '/download/Clash.apk', 'config=clash', 'xmanager xmanager-clash'),
(2, 'AnXray', '1', '', NULL, 1627221354, 0, 'https://github.com/XTLS/AnXray/releases', 'anxray=1', 'icomoon icomoon-anxray'),
(3, 'V2rayNG', '1', '<center><video id=\"0\" controls=\"controls\" width=\"800\" height=\"380\">\n<source src=\"/uploads/and/v2rayng.mp4\" type=\"video/mp4\" />\n<source src=\"/uploads/and/v2rayng.ogv\" type=\"video/ogg; codecs=\" theora=\"\" vorbis=\"\" />\n<source src=\"/uploads/and/v2rayng.webm\" type=\"video/webm\" /></video></center>', '<center><video id=\"0\" controls=\"controls\" width=\"800\" height=\"380\">\n<source src=\"/uploads/and/v2rayng.mp4\" type=\"video/mp4\" />\n<source src=\"/uploads/and/v2rayng.ogv\" type=\"video/ogg; codecs=\" theora=\"\" vorbis=\"\" />\n<source src=\"/uploads/and/v2rayng.webm\" type=\"video/webm\" /></video></center>', 1640722629, 1, '/download/V2rayNG.apk', 'config=v2rayng', 'icomoon icomoon-v2rayng-new'),
(4, 'Surfboard', '1', '<center><video id=\"0\" controls=\"controls\" width=\"800\" height=\"380\">\n<source src=\"/uploads/and/surfboard.mp4\" type=\"video/mp4\" />\n<source src=\"/uploads/and/surfboard.ogv\" type=\"video/ogg; codecs=\" theora=\"\" vorbis=\"\" />\n<source src=\"/uploads/and/surfboard.webm\" type=\"video/webm\" /></video></center>', '<center><video id=\"0\" controls=\"controls\" width=\"800\" height=\"380\">\n<source src=\"/uploads/and/surfboard.mp4\" type=\"video/mp4\" />\n<source src=\"/uploads/and/surfboard.ogv\" type=\"video/ogg; codecs=\" theora=\"\" vorbis=\"\" />\n<source src=\"/uploads/and/surfboard.webm\" type=\"video/webm\" /></video></center>', 1644508754, 1, '/download/Surfboard.apk', 'surfboard=1', 'xmanager xmanager-surfboard'),
(5, 'ClashFW x64', '3', '<center><video id=\"0\" controls=\"controls\" width=\"800\" height=\"380\">\n<source src=\"/uploads/win/clash.mp4\" type=\"video/mp4\" />\n<source src=\"/uploads/win/clash.ogv\" type=\"video/ogg; codecs=\" theora=\"\" vorbis=\"\" />\n<source src=\"/uploads/win/clash.webm\" type=\"video/webm\" /></video></center>', '<center><video id=\"0\" controls=\"controls\" width=\"800\" height=\"380\">\n<source src=\"/uploads/win/clash.mp4\" type=\"video/mp4\" />\n<source src=\"/uploads/win/clash.ogv\" type=\"video/ogg; codecs=\" theora=\"\" vorbis=\"\" />\n<source src=\"/uploads/win/clash.webm\" type=\"video/webm\" /></video></center>', 1645118722, 1, '/download/Clashx64.exe', 'config=clash', 'xmanager xmanager-clash'),
(6, 'ClashFW x86', '3', '<center><video id=\"0\" controls=\"controls\" width=\"800\" height=\"380\">\n<source src=\"/uploads/win/clash.mp4\" type=\"video/mp4\" />\n<source src=\"/uploads/win/clash.ogv\" type=\"video/ogg; codecs=\" theora=\"\" vorbis=\"\" />\n<source src=\"/uploads/win/clash.webm\" type=\"video/webm\" /></video></center>', '<center><video id=\"0\" controls=\"controls\" width=\"800\" height=\"380\">\n<source src=\"/uploads/win/clash.mp4\" type=\"video/mp4\" />\n<source src=\"/uploads/win/clash.ogv\" type=\"video/ogg; codecs=\" theora=\"\" vorbis=\"\" />\n<source src=\"/uploads/win/clash.webm\" type=\"video/webm\" /></video></center>', 1645118737, 1, '/download/Clashx86.exe', 'clash=1', 'xmanager xmanager-clash'),
(7, 'V2rayN', '3', '', '', 1644568526, 1, '/download/V2rayN.zip', 'config=1', 'icomoon icomoon-v2rayn'),
(8, NULL, '3', NULL, NULL, NULL, 0, NULL, NULL, ''),
(9, 'Shadowrocket', '2', NULL, NULL, 1641151871, 1, 'https://itunes.apple.com/us/app/shadowrocket/id932747118?mt=8', 'config=shadowrocket', 'xmanager xmanager-shadowrocket'),
(10, 'QuantumultX', '2', NULL, NULL, 0, 1, 'https://apps.apple.com/us/app/quantumult-x/id1443988620', 'config=1', 'xmanager xmanager-quantumultx'),
(11, NULL, '2', NULL, NULL, NULL, 0, NULL, NULL, ''),
(12, NULL, '2', NULL, NULL, NULL, 0, NULL, NULL, ''),
(13, 'ClashX', '4', '<center><video id=\"0\" controls=\"controls\" width=\"800\" height=\"380\">\n<source src=\"/uploads/mac/clashx.mp4\" type=\"video/mp4\" />\n<source src=\"/uploads/mac/clashx.ogv\" type=\"video/ogg; codecs=\" theora=\"\" vorbis=\"\" />\n<source src=\"/uploads/mac/clashx.webm\" type=\"video/webm\" /></video></center>', '<center><video id=\"0\" controls=\"controls\" width=\"800\" height=\"380\">\n<source src=\"/uploads/mac/clashx.mp4\" type=\"video/mp4\" />\n<source src=\"/uploads/mac/clashx.ogv\" type=\"video/ogg; codecs=\" theora=\"\" vorbis=\"\" />\n<source src=\"/uploads/mac/clashx.webm\" type=\"video/webm\" /></video></center>', 1641151912, 1, '/download/ClashX.dmg', 'config=clash', 'xmanager xmanager-clash'),
(14, 'ClashFW(Mac)', '4', '<center><video id=\"0\" controls=\"controls\" width=\"800\" height=\"380\">\n<source src=\"/uploads/mac/clash.mp4\" type=\"video/mp4\" />\n<source src=\"/uploads/mac/clash.ogv\" type=\"video/ogg; codecs=\" theora=\"\" vorbis=\"\" />\n<source src=\"/uploads/mac/clash.webm\" type=\"video/webm\" /></video></center>', '<center><video id=\"0\" controls=\"controls\" width=\"800\" height=\"380\">\n<source src=\"/uploads/mac/clash.mp4\" type=\"video/mp4\" />\n<source src=\"/uploads/mac/clash.ogv\" type=\"video/ogg; codecs=\" theora=\"\" vorbis=\"\" />\n<source src=\"/uploads/mac/clash.webm\" type=\"video/webm\" /></video></center>', 1645118785, 1, '/download/Clash.dmg', 'config=clash', 'xmanager xmanager-clash'),
(15, NULL, '4', NULL, NULL, NULL, 0, NULL, NULL, ''),
(16, NULL, '4', NULL, NULL, NULL, 0, NULL, NULL, ''),
(17, 'ClashFW(Linux)', '5', '<center><video id=\"0\" controls=\"controls\" width=\"800\" height=\"380\">\n<source src=\"/uploads/linux/clash.mp4\" type=\"video/mp4\" />\n<source src=\"/uploads/linux/clash.ogv\" type=\"video/ogg; codecs=\" theora=\"\" vorbis=\"\" />\n<source src=\"/uploads/linux/clash.webm\" type=\"video/webm\" /></video></center>', '<center><video id=\"0\" controls=\"controls\" width=\"800\" height=\"380\">\n<source src=\"/uploads/linux/clash.mp4\" type=\"video/mp4\" />\n<source src=\"/uploads/linux/clash.ogv\" type=\"video/ogg; codecs=\" theora=\"\" vorbis=\"\" />\n<source src=\"/uploads/linux/clash.webm\" type=\"video/webm\" /></video></center>', 1645118802, 1, '/download/Clash.tar.gz', 'config=clash', 'xmanager xmanager-clash'),
(18, 'QV2ray', '5', '', '', 1641151959, 0, '/download/Clash.tar.gz', 'config=clash', 'icomoon icomoon-qv2ray'),
(19, NULL, '5', NULL, NULL, NULL, 0, NULL, NULL, ''),
(20, NULL, '5', NULL, NULL, NULL, 0, NULL, NULL, ''),
(21, 'XClient', '6', '', '', 1646327018, 1, 'https://github.com/xcode75/luci-app-xclient/releases', 'xclient=1', 'fad fa-paper-plane'),
(22, 'Openclash', '6', '', '', 1646327071, 1, 'https://github.com/vernesong/OpenClash/releases', 'clash=1', 'xmanager  xmanager-clash'),
(23, NULL, '6', NULL, NULL, NULL, 0, NULL, NULL, ''),
(24, NULL, '6', NULL, NULL, NULL, 0, NULL, NULL, ''),
(25, 'TeamViewer (Windows)', '7', '', NULL, 1627226060, 0, 'https://dl.tvcdn.de/download/TeamViewer_Setup.exe', '', 'icomoon icomoon-teamviewer'),
(26, 'TeamViewer (Mac)', '7', '', '', 1628349861, 0, 'https://download.teamviewer.com/download/TeamViewer.dmg', '', 'icomoon icomoon-teamviewer'),
(27, NULL, '7', NULL, NULL, NULL, 0, NULL, NULL, ''),
(28, NULL, '7', NULL, NULL, NULL, 0, NULL, NULL, ''),
(29, NULL, '8', NULL, NULL, NULL, 0, NULL, NULL, ''),
(30, NULL, '8', NULL, NULL, NULL, 0, NULL, NULL, ''),
(31, NULL, '8', NULL, NULL, NULL, 0, NULL, NULL, ''),
(32, NULL, '8', NULL, NULL, NULL, 0, NULL, NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `telegram_session`
--

CREATE TABLE `telegram_session` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `type` int(11) DEFAULT NULL,
  `session_content` text DEFAULT NULL,
  `datetime` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `temp_order`
--

CREATE TABLE `temp_order` (
  `id` int(11) NOT NULL,
  `total` decimal(12,2) DEFAULT NULL,
  `price` decimal(12,2) NOT NULL,
  `order_id` varchar(250) NOT NULL,
  `create_date` bigint(20) NOT NULL,
  `coupon` varchar(20)  DEFAULT NULL,
  `packageid` int(5) NOT NULL,
  `packagetype` int(2) NOT NULL,
  `packagexp` varchar(5) NOT NULL,
  `userid` int(11) NOT NULL,
  `paymethod` int(11) NOT NULL,
  `expdate` int(50) DEFAULT 0,
  `exrate` decimal(12,2) DEFAULT NULL,
  `renew` int(5) DEFAULT NULL,
  `discount` decimal(12,2) DEFAULT NULL,
  `wallet` varchar(250) DEFAULT NULL,
  `extra` decimal(12,2) NULL DEFAULT '0.00',
  `exp` bigint(20) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `pay_url` longtext  DEFAULT NULL,
  `notify_url` longtext  DEFAULT NULL,
  `return_url` longtext  DEFAULT NULL,
  `pay_qrcode` longtext  DEFAULT NULL,
  `deeplink` longtext  DEFAULT NULL,
  `status` int(5) NOT NULL DEFAULT -1,
  `pay_id` longtext  DEFAULT NULL,
  `amount` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tmp_price`
--

CREATE TABLE `tmp_price` (
  `price` varchar(255) NOT NULL,
  `oid` varchar(255) NOT NULL,
  `uid` int(12) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `user_name` varchar(128) NOT NULL,
  `email` varchar(150) NOT NULL,
  `pass` varchar(256) NOT NULL,
  `passwd` varchar(50) NOT NULL,
  `method` varchar(50) NOT NULL DEFAULT 'aes-128-gcm',
  `uuid` text DEFAULT NULL COMMENT 'uuid',
  `t` int(11) NOT NULL DEFAULT 0,
  `u` bigint(20) NOT NULL,
  `d` bigint(20) NOT NULL,
  `transfer_enable` bigint(20) NOT NULL,
  `enable` tinyint(4) NOT NULL DEFAULT 1,
  `reg_date` datetime NOT NULL,
  `money` decimal(12,2) NOT NULL DEFAULT '0.00',
  `expire_time` int(20) NOT NULL DEFAULT 0,
  `reg_ip` varchar(128) NOT NULL DEFAULT '127.0.0.1',
  `speedlimit` int(20) NOT NULL DEFAULT 0,
  `connector` int(11) NOT NULL DEFAULT 0,
  `role` int(2) NOT NULL DEFAULT 0,
  `last_day_t` bigint(20) NOT NULL DEFAULT 0,
  `level` int(11) NOT NULL DEFAULT 0,
  `expire_in` datetime NOT NULL DEFAULT '2099-06-04 00:05:00',
  `remark` text DEFAULT NULL,
  `group` int(11) NOT NULL DEFAULT 0,
  `reset_day` int(11) NOT NULL DEFAULT 0,
  `reset_bandwidth` decimal(12,2) NOT NULL DEFAULT 0.00,
  `telegram_id` bigint(20) DEFAULT NULL,
  `telegram_name` varchar(25) DEFAULT NULL,
  `expire_notified` tinyint(1) NOT NULL DEFAULT 0,
  `expire_notified_days` tinyint(1) NOT NULL DEFAULT 0,
  `traffic_notified` tinyint(1) NOT NULL DEFAULT 0,
  `traffic_notified_limit` tinyint(1) NOT NULL DEFAULT 0,
  `afflink` varchar(25) DEFAULT NULL,
  `verify` INT(3) NOT NULL DEFAULT '0',
  `notify_expire` int(2) NOT NULL DEFAULT 1,
  `notify_usedup` int(2) NOT NULL DEFAULT 1,
  `ref_by` int(11) NULL DEFAULT 0,
  `notice_status` int(10) NOT NULL DEFAULT 0,
  `notice_id` text DEFAULT NULL,
  `affclicks` int(20) NOT NULL DEFAULT 0,
  `ga_token` varchar(200) NOT NULL,
  `ga_enable` int(5) NOT NULL DEFAULT 0,
  `aff_completed` decimal(12,2) NOT NULL DEFAULT 0.00,
  `aff_pending` decimal(12,2) NOT NULL DEFAULT 0.00,
  `aff_balance` decimal(12,2) NOT NULL DEFAULT 0.00,
  `aff_account` varchar(50) DEFAULT NULL,
  `aff_with_mode` int(2) NOT NULL DEFAULT 1,
  `currency` varchar(5) NOT NULL DEFAULT '',
  `lang` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user_subscribe_log`
--

CREATE TABLE `user_subscribe_log` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `email` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subscribe_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `request_ip` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `request_time` datetime NOT NULL,
  `request_user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_token`
--

CREATE TABLE `user_token` (
  `id` int(11) NOT NULL,
  `token` varchar(256) NOT NULL,
  `user_id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `expire_time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user_traffic_log`
--

CREATE TABLE `user_traffic_log` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `username` varchar(250) DEFAULT NULL,
  `u` bigint(20) NOT NULL,
  `d` bigint(20) NOT NULL,
  `node_id` int(11) NOT NULL,
  `rate` float NOT NULL,
  `traffic` varchar(32) NOT NULL,
  `log_time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `alive_ip`
--
ALTER TABLE `alive_ip`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `captcha`
--
ALTER TABLE `captcha`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `cloudflare`
--
ALTER TABLE `cloudflare`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `commission`
--
ALTER TABLE `commission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `config`
--
ALTER TABLE `config`
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupon`
--
ALTER TABLE `coupon`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_verify`
--
ALTER TABLE `email_verify`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `link`
--
ALTER TABLE `link`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `login_ip`
--
ALTER TABLE `login_ip`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notice`
--
ALTER TABLE `notice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset`
--
ALTER TABLE `password_reset`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payout`
--
ALTER TABLE `payout`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rule_list`
--
ALTER TABLE `rule_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rule_log`
--
ALTER TABLE `rule_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `servers`
--
ALTER TABLE `servers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `server_info`
--
ALTER TABLE `server_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `server_online_log`
--
ALTER TABLE `server_online_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `setup`
--
ALTER TABLE `setup`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `telegram_session`
--
ALTER TABLE `telegram_session`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `temp_order`
--
ALTER TABLE `temp_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tmp_price`
--
ALTER TABLE `tmp_price`
  ADD PRIMARY KEY (`price`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_subscribe_log`
--
ALTER TABLE `user_subscribe_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_token`
--
ALTER TABLE `user_token`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_traffic_log`
--
ALTER TABLE `user_traffic_log`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `iplist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `alive_ip`
--
ALTER TABLE `alive_ip`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `captcha`
--
ALTER TABLE `captcha`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cloudflare`
--
ALTER TABLE `cloudflare`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `commission`
--
ALTER TABLE `commission`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=251;

--
-- AUTO_INCREMENT for table `coupon`
--
ALTER TABLE `coupon`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currency`
--
ALTER TABLE `currency`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `email_verify`
--
ALTER TABLE `email_verify`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `link`
--
ALTER TABLE `link`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `login_ip`
--
ALTER TABLE `login_ip`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notice`
--
ALTER TABLE `notice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `package`
--
ALTER TABLE `package`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `password_reset`
--
ALTER TABLE `password_reset`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payout`
--
ALTER TABLE `payout`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rule_list`
--
ALTER TABLE `rule_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `rule_log`
--
ALTER TABLE `rule_log`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `servers`
--
ALTER TABLE `servers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `server_info`
--
ALTER TABLE `server_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `server_online_log`
--
ALTER TABLE `server_online_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `setup`
--
ALTER TABLE `setup`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `telegram_session`
--
ALTER TABLE `telegram_session`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `temp_order`
--
ALTER TABLE `temp_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_subscribe_log`
--
ALTER TABLE `user_subscribe_log`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_token`
--
ALTER TABLE `user_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_traffic_log`
--
ALTER TABLE `user_traffic_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `iplist`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
  
CREATE TABLE `templates` (
  `id` int(11) NOT NULL,
  `title` varchar(300) NOT NULL,
  `content` longtext NOT NULL,
  `datetime` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO `templates` (`id`, `title`, `content`, `datetime`) VALUES
(1, 'Traffic - ????????????', '<table class=\"body-wrap mce-item-table\" style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; width: 100%; background-color: #f6f6f6; margin: 0;\" bgcolor=\"#f6f6f6\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; width: 100%; background-color: #f6f6f6; margin: 0;\"><tbody><tr style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\"><td style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0;\" valign=\"top\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0;\"><br></td><td class=\"container\" style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; display: block !important; max-width: 600px !important; clear: both !important; margin: 0 auto;\" valign=\"top\" width=\"600\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; display: block !important; max-width: 600px !important; clear: both !important; margin: 0 auto;\"><div class=\"content\" style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; max-width: 600px; display: block; margin: 0 auto; padding: 20px;\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; max-width: 600px; display: block; margin: 0 auto; padding: 20px;\"><table class=\"main mce-item-table\" style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; border-radius: 3px; background-color: #fff; margin: 0; border: 1px solid #e9e9e9;\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" bgcolor=\"#fff\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; border-radius: 3px; background-color: #fff; margin: 0; border: 1px solid #e9e9e9;\"><tbody><tr style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\"><td class=\"\" style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 16px; vertical-align: top; color: #fff; font-weight: 500; text-align: center; border-radius: 3px 3px 0 0; background-color: %app_color%; margin: 0; padding: 20px;\" align=\"center\" valign=\"top\" bgcolor=\"#71b6f9\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 16px; vertical-align: top; color: #fff; font-weight: 500; text-align: center; border-radius: 3px 3px 0 0; background-color: %app_color%; margin: 0; padding: 20px;\"><span style=\"margin-top: 10px; display: block;\" data-mce-style=\"margin-top: 10px; display: block;\"> %TrafficMessage%</span></td></tr><tr style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\"><td class=\"content-block aligncenter\" style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; text-align: center; margin: 0; padding: 0 0 20px;\" align=\"center\" valign=\"top\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; text-align: center; margin: 0; padding: 0 0 20px;\"><table class=\"invoice mce-item-table\" style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; text-align: left; width: 80%; margin: 40px auto;\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; text-align: left; width: 80%; margin: 40px auto;\"><tbody><tr style=\"width: 100%; font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\" data-mce-style=\"width: 100%; font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\"><td style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0; padding: 5px 0;\" valign=\"top\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0; padding: 5px 0;\"><center><span style=\"font-size: 17px;\" data-mce-style=\"font-size: 17px;\">%Lang_traffic2%</span><br><br></center></td></tr><tr style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\"><td style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0; padding: 5px 0;\" valign=\"top\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0; padding: 5px 0;\"><table class=\"invoice-items mce-item-table\" style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; width: 100%; margin: 0;\" cellspacing=\"0\" cellpadding=\"0\"><tbody><tr style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\"><td style=\"width: 66.4549%; font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; border-top: 1px solid rgb(238, 238, 238); margin: 0px; padding: 5px 0px;\" valign=\"top\">%Lang_ToTraffic%</td><td class=\"alignright\" style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; text-align: right; border-top: 1px solid rgb(238, 238, 238); margin: 0px; padding: 5px 0px; width: 33.4873%;\" align=\"right\" valign=\"top\">%ToTraffic%</td></tr><tr style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\"><td style=\"width: 66.4549%; font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; border-top: 1px solid rgb(238, 238, 238); margin: 0px; padding: 5px 0px;\" valign=\"top\">%Lang_UTraffic%</td><td class=\"alignright\" style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; text-align: right; border-top: 1px solid rgb(238, 238, 238); margin: 0px; padding: 5px 0px; width: 33.4873%;\" align=\"right\" valign=\"top\">%UsedT%</td></tr><tr style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\"><td style=\"width: 66.4549%; font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; border-top: 1px solid rgb(238, 238, 238); margin: 0px; padding: 5px 0px;\" valign=\"top\">%Lang_PExpire%</td><td style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; text-align: right; border-top: 1px solid rgb(238, 238, 238); margin: 0px; padding: 5px 0px; width: 33.4873%;\" valign=\"top\">%PExpire%</td></tr></tbody></table></td></tr></tbody></table></td></tr></tbody></table><div class=\"footer\" style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; width: 100%; clear: both; color: #999; margin: 0; padding: 20px;\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; width: 100%; clear: both; color: #999; margin: 0; padding: 20px;\"><table style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\" width=\"100%\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\" class=\"mce-item-table\"><tbody><tr style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\"><td class=\"aligncenter content-block\" style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 12px; vertical-align: top; color: #999; text-align: center; margin: 0; padding: 0 0 20px;\" align=\"center\" valign=\"top\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 12px; vertical-align: top; color: #999; text-align: center; margin: 0; padding: 0 0 20px;\"><a style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 12px; color: #999; text-decoration: underline; margin: 0;\" href=\"/%baseUrl%\" data-mce-href=\"/%baseUrl%\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 12px; color: #999; text-decoration: underline; margin: 0;\">%appName%</a></td></tr></tbody></table></div></div></td><td style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0;\" valign=\"top\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0;\"><br></td></tr></tbody></table>', 1652101990),
(2, 'Verification - ?????? ', '<table class=\"body-wrap mce-item-table\" style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; width: 100%; background-color: #f6f6f6; margin: 0;\" bgcolor=\"#f6f6f6\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; width: 100%; background-color: #f6f6f6; margin: 0;\"><tbody><tr style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\"><td style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0;\" valign=\"top\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0;\"><br></td><td class=\"container\" style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; display: block !important; max-width: 600px !important; clear: both !important; margin: 0 auto;\" valign=\"top\" width=\"600\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; display: block !important; max-width: 600px !important; clear: both !important; margin: 0 auto;\"><div class=\"content\" style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; max-width: 600px; display: block; margin: 0 auto; padding: 20px;\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; max-width: 600px; display: block; margin: 0 auto; padding: 20px;\"><table class=\"main mce-item-table\" style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; border-radius: 3px; background-color: #fff; margin: 0; border: 1px solid #e9e9e9;\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" bgcolor=\"#fff\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; border-radius: 3px; background-color: #fff; margin: 0; border: 1px solid #e9e9e9;\"><tbody><tr style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\"><td class=\"\" style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 16px; vertical-align: top; color: #fff; font-weight: 500; text-align: center; border-radius: 3px 3px 0 0; background-color: %app_color%; margin: 0; padding: 20px;\" align=\"center\" valign=\"top\" bgcolor=\"#71b6f9\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 16px; vertical-align: top; color: #fff; font-weight: 500; text-align: center; border-radius: 3px 3px 0 0; background-color: %app_color%; margin: 0; padding: 20px;\"><span style=\"margin-top: 10px; display: block;\" data-mce-style=\"margin-top: 10px; display: block;\">%Lang_ecode%</span></td></tr><tr style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\"><td class=\"content-wrap\" style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0; padding: 20px;\" valign=\"top\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0; padding: 20px;\"><table style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\" class=\"mce-item-table\"><tbody><tr style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\"><td class=\"content-block\" style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0; padding: 0 0 20px;\" valign=\"top\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0; padding: 0 0 20px;\"><center style=\"font-size: 16px;\" data-mce-style=\"font-size: 16px;\">%Lang_code2%</center></td></tr><tr style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\"><td class=\"content-block\" style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0; padding: 0 0 20px;\" valign=\"top\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0; padding: 0 0 20px;\"><center style=\"font-size: 18px;\" data-mce-style=\"font-size: 18px;\"><strong>%code%</strong></center></td></tr><tr style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\"><td class=\"content-block\" style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0; padding: 0 0 20px;\" valign=\"top\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0; padding: 0 0 20px;\"><center style=\"font-size: 16px;\" data-mce-style=\"font-size: 16px;\">%Lang_code3%<strong>%expire%</strong>%Lang_code4%<br>%Lang_code5%</center></td></tr></tbody></table></td></tr></tbody></table><div class=\"footer\" style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; width: 100%; clear: both; color: #999; margin: 0; padding: 20px;\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; width: 100%; clear: both; color: #999; margin: 0; padding: 20px;\"><table style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\" width=\"100%\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\" class=\"mce-item-table\"><tbody><tr style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\"><td class=\"aligncenter content-block\" style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 12px; vertical-align: top; color: #999; text-align: center; margin: 0; padding: 0 0 20px;\" align=\"center\" valign=\"top\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 12px; vertical-align: top; color: #999; text-align: center; margin: 0; padding: 0 0 20px;\"><a style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 12px; color: #999; text-decoration: underline; margin: 0;\" href=\"/%baseUrl%\" data-mce-href=\"/%baseUrl%\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 12px; color: #999; text-decoration: underline; margin: 0;\">%appName%</a></td></tr></tbody></table></div></div></td><td style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0;\" valign=\"top\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0;\"><br></td></tr></tbody></table>', 1652102697),
(3, 'Invoice - ??????', '<table class=\"body-wrap mce-item-table\" style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; width: 100%; background-color: #f6f6f6; margin: 0;\" bgcolor=\"#f6f6f6\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; width: 100%; background-color: #f6f6f6; margin: 0;\"><tbody><tr style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\"><td style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0;\" valign=\"top\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0;\"><br></td><td class=\"container\" style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; display: block !important; max-width: 600px !important; clear: both !important; margin: 0 auto;\" valign=\"top\" width=\"600\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; display: block !important; max-width: 600px !important; clear: both !important; margin: 0 auto;\"><div class=\"content\" style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; max-width: 600px; display: block; margin: 0 auto; padding: 20px;\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; max-width: 600px; display: block; margin: 0 auto; padding: 20px;\"><table class=\"main mce-item-table\" style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; border-radius: 3px; background-color: #fff; margin: 0; border: 1px solid #e9e9e9;\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" bgcolor=\"#fff\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; border-radius: 3px; background-color: #fff; margin: 0; border: 1px solid #e9e9e9;\"><tbody><tr style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\"><td class=\"\" style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 16px; vertical-align: top; color: #fff; font-weight: 500; text-align: center; border-radius: 3px 3px 0 0; background-color: %app_color%; margin: 0; padding: 20px;\" align=\"center\" valign=\"top\" bgcolor=\"#71b6f9\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 16px; vertical-align: top; color: #fff; font-weight: 500; text-align: center; border-radius: 3px 3px 0 0; background-color: %app_color%; margin: 0; padding: 20px;\"><span style=\"margin-top: 10px; display: block;\" data-mce-style=\"margin-top: 10px; display: block;\">%Lang_order1% : #%orderID%</span></td></tr><tr style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\"><td class=\"content-block aligncenter\" style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; text-align: center; margin: 0; padding: 0 0 20px;\" align=\"center\" valign=\"top\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; text-align: center; margin: 0; padding: 0 0 20px;\"><table class=\"invoice mce-item-table\" style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; text-align: left; width: 80%; margin: 40px auto;\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; text-align: left; width: 80%; margin: 40px auto;\"><tbody><tr style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\"><td style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0; padding: 5px 0;\" valign=\"top\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0; padding: 5px 0;\"><center><span style=\"font-size: 17px;\" data-mce-style=\"font-size: 17px;\">%Username% %Lang_order1% %appName%</span><br>%Lang_order2%</center><hr><br><center>%Lang_order5% : %orderDate%</center></td></tr><tr style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\"><td style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0; padding: 5px 0;\" valign=\"top\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0; padding: 5px 0;\"><table class=\"invoice-items mce-item-table\" style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; width: 100%; margin: 0;\" cellspacing=\"0\" cellpadding=\"0\"><tbody><tr style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\"><td style=\"width: 73.1524%; font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; border-top: 1px solid rgb(238, 238, 238); margin: 0px; padding: 5px 0px;\" valign=\"top\">%Lang_Description%</td><td class=\"alignright\" style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; text-align: right; border-top: 1px solid rgb(238, 238, 238); margin: 0px; padding: 5px 0px; width: 23.7876%;\" align=\"right\" valign=\"top\">%itemDes%</td></tr><tr style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\"><td style=\"width: 73.1524%; font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; border-top: 1px solid rgb(238, 238, 238); margin: 0px; padding: 5px 0px;\" valign=\"top\">%Lang_OrderAmount%</td><td class=\"alignright\" style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; text-align: right; border-top: 1px solid rgb(238, 238, 238); margin: 0px; padding: 5px 0px; width: 23.7876%;\" align=\"right\" valign=\"top\">%itemPrice%</td></tr><tr style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\"><td style=\"width: 73.1524%; font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; border-top: 1px solid rgb(238, 238, 238); margin: 0px; padding: 5px 0px;\" valign=\"top\">%Lang_AcBalance%</td><td style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; text-align: right; border-top: 1px solid rgb(238, 238, 238); margin: 0px; padding: 5px 0px; width: 23.7876%;\" valign=\"top\">%usermoney%</td></tr><tr style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\"><td style=\"width: 73.1524%; font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; border-top: 1px solid rgb(238, 238, 238); margin: 0px; padding: 5px 0px;\" valign=\"top\">%Lang_discount%</td><td class=\"alignright\" style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; text-align: right; border-top: 1px solid rgb(238, 238, 238); margin: 0px; padding: 5px 0px; width: 23.7876%;\" align=\"right\" valign=\"top\">%disPrice%</td></tr><tr class=\"total\" style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\"><td class=\"alignright\" style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; text-align: right; border-top: 2px solid rgb(51, 51, 51); border-bottom: 2px solid rgb(51, 51, 51); font-weight: bold; margin: 0px; padding: 5px 0px; width: 73.1524%;\" align=\"right\" valign=\"top\" width=\"80%\">%Lang_TotalPrice%</td><td class=\"alignright\" style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; text-align: right; border-top: 2px solid rgb(51, 51, 51); border-bottom: 2px solid rgb(51, 51, 51); font-weight: bold; margin: 0px; padding: 5px 0px; width: 23.7876%;\" align=\"right\" valign=\"top\">%TotalPrice%</td></tr></tbody></table></td></tr></tbody></table></td></tr></tbody></table><div class=\"footer\" style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; width: 100%; clear: both; color: #999; margin: 0; padding: 20px;\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; width: 100%; clear: both; color: #999; margin: 0; padding: 20px;\"><table style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\" width=\"100%\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\" class=\"mce-item-table\"><tbody><tr style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\"><td class=\"aligncenter content-block\" style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 12px; vertical-align: top; color: #999; text-align: center; margin: 0; padding: 0 0 20px;\" align=\"center\" valign=\"top\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 12px; vertical-align: top; color: #999; text-align: center; margin: 0; padding: 0 0 20px;\"><a style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 12px; color: #999; text-decoration: underline; margin: 0;\" href=\"/%baseUrl%\" data-mce-href=\"/%baseUrl%\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 12px; color: #999; text-decoration: underline; margin: 0;\">%appName%</a></td></tr></tbody></table></div></div></td><td style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0;\" valign=\"top\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0;\"><br></td></tr></tbody></table>', 1652101972),
(4, 'Message -  ???????????????', '<table class=\"body-wrap mce-item-table\" style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; width: 100%; background-color: #f6f6f6; margin: 0;\" bgcolor=\"#f6f6f6\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; width: 100%; background-color: #f6f6f6; margin: 0;\"><tbody><tr style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\"><td style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0;\" valign=\"top\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0;\"><br></td><td class=\"container\" style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; display: block !important; max-width: 600px !important; clear: both !important; margin: 0 auto;\" valign=\"top\" width=\"600\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; display: block !important; max-width: 600px !important; clear: both !important; margin: 0 auto;\"><div class=\"content\" style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; max-width: 600px; display: block; margin: 0 auto; padding: 20px;\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; max-width: 600px; display: block; margin: 0 auto; padding: 20px;\"><table class=\"main mce-item-table\" style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; border-radius: 3px; background-color: #fff; margin: 0; border: 1px solid #e9e9e9;\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" bgcolor=\"#fff\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; border-radius: 3px; background-color: #fff; margin: 0; border: 1px solid #e9e9e9;\"><tbody><tr style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\"><td class=\"\" style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 16px; vertical-align: top; color: #fff; font-weight: 500; text-align: center; border-radius: 3px 3px 0 0; background-color: %app_color%; margin: 0; padding: 20px;\" align=\"center\" valign=\"top\" bgcolor=\"#71b6f9\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 16px; vertical-align: top; color: #fff; font-weight: 500; text-align: center; border-radius: 3px 3px 0 0; background-color: %app_color%; margin: 0; padding: 20px;\"><span style=\"margin-top: 10px; display: block;\" data-mce-style=\"margin-top: 10px; display: block;\">%Lang_admin_message%</span></td></tr><tr style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\"><td class=\"content-wrap\" style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0; padding: 20px;\" valign=\"top\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0; padding: 20px;\"><table style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\" class=\"mce-item-table\"><tbody><tr style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\"><td class=\"content-block\" style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0; padding: 0 0 20px;\" valign=\"top\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0; padding: 0 0 20px;\"><br>%Lang_Hello% %Username%<br><br>%Message%</td></tr></tbody></table></td></tr></tbody></table><div class=\"footer\" style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; width: 100%; clear: both; color: #999; margin: 0; padding: 20px;\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; width: 100%; clear: both; color: #999; margin: 0; padding: 20px;\"><table style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\" width=\"100%\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\" class=\"mce-item-table\"><tbody><tr style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\"><td class=\"aligncenter content-block\" style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 12px; vertical-align: top; color: #999; text-align: center; margin: 0; padding: 0 0 20px;\" align=\"center\" valign=\"top\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 12px; vertical-align: top; color: #999; text-align: center; margin: 0; padding: 0 0 20px;\"><a style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 12px; color: #999; text-decoration: underline; margin: 0;\" href=\"/%baseUrl%\" data-mce-href=\"/%baseUrl%\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 12px; color: #999; text-decoration: underline; margin: 0;\">%appName%</a></td></tr></tbody></table></div></div></td><td style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0;\" valign=\"top\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0;\"><br></td></tr></tbody></table>', 1652093246),
(5, 'Password Reset - ????????????', '<table class=\"body-wrap mce-item-table\" style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; width: 100%; background-color: #f6f6f6; margin: 0;\" bgcolor=\"#f6f6f6\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; width: 100%; background-color: #f6f6f6; margin: 0;\"><tbody><tr style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\"><td style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0;\" valign=\"top\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0;\"><br></td><td class=\"container\" style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; display: block !important; max-width: 600px !important; clear: both !important; margin: 0 auto;\" valign=\"top\" width=\"600\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; display: block !important; max-width: 600px !important; clear: both !important; margin: 0 auto;\"><div class=\"content\" style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; max-width: 600px; display: block; margin: 0 auto; padding: 20px;\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; max-width: 600px; display: block; margin: 0 auto; padding: 20px;\"><table class=\"main mce-item-table\" style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; border-radius: 3px; background-color: #fff; margin: 0; border: 1px solid #e9e9e9;\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" bgcolor=\"#fff\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; border-radius: 3px; background-color: #fff; margin: 0; border: 1px solid #e9e9e9;\"><tbody><tr style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\"><td class=\"\" style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 16px; vertical-align: top; color: #fff; font-weight: 500; text-align: center; border-radius: 3px 3px 0 0; background-color: %app_color%; margin: 0; padding: 20px;\" align=\"center\" valign=\"top\" bgcolor=\"#71b6f9\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 16px; vertical-align: top; color: #fff; font-weight: 500; text-align: center; border-radius: 3px 3px 0 0; background-color: %app_color%; margin: 0; padding: 20px;\"><span style=\"margin-top: 10px; display: block;\" data-mce-style=\"margin-top: 10px; display: block;\">%Lang_Passnote7%</span></td></tr><tr style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\"><td class=\"content-wrap\" style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0; padding: 20px;\" valign=\"top\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0; padding: 20px;\"><table style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\" class=\"mce-item-table\"><tbody><tr style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\"><td class=\"content-block\" style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0; padding: 0 0 20px;\" valign=\"top\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0; padding: 0 0 20px;\"><center style=\"font-size: 16px;\" data-mce-style=\"font-size: 16px;\">%Lang_Passnote1%%requestip%<br>%Lang_Passnote2%</center></td></tr><tr style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\"><td class=\"content-block\" style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0; padding: 0 0 20px;\" valign=\"top\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0; padding: 0 0 20px;\"><center><a class=\"btn\" style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; color: #fff; text-decoration: none; line-height: 2em; font-weight: bold; text-align: center; cursor: pointer; display: inline-block; border-radius: 5px; background-color: %app_color%; margin: 0; border-color: %app_color%; border-style: solid; border-width: 8px 16px;\" href=\"/%resetlink%\" type=\"button\" data-mce-href=\"/%resetlink%\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; color: #fff; text-decoration: none; line-height: 2em; font-weight: bold; text-align: center; cursor: pointer; display: inline-block; border-radius: 5px; background-color: %app_color%; margin: 0; border-color: %app_color%; border-style: solid; border-width: 8px 16px;\">%Lang_Passnote6% </a></center></td></tr><tr style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\"><td class=\"content-block\" style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0; padding: 0 0 20px;\" valign=\"top\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0; padding: 0 0 20px;\"><center style=\"font-size: 16px;\" data-mce-style=\"font-size: 16px;\">%Lang_Passnote3%<strong>%expire%</strong>%Lang_Passnote4%<br>%Lang_Passnote5%</center></td></tr></tbody></table></td></tr></tbody></table><div class=\"footer\" style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; width: 100%; clear: both; color: #999; margin: 0; padding: 20px;\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; width: 100%; clear: both; color: #999; margin: 0; padding: 20px;\"><table style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\" width=\"100%\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\" class=\"mce-item-table\"><tbody><tr style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\"><td class=\"aligncenter content-block\" style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 12px; vertical-align: top; color: #999; text-align: center; margin: 0; padding: 0 0 20px;\" align=\"center\" valign=\"top\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 12px; vertical-align: top; color: #999; text-align: center; margin: 0; padding: 0 0 20px;\"><a style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 12px; color: #999; text-decoration: underline; margin: 0;\" href=\"/%baseUrl%\" data-mce-href=\"/%baseUrl%\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 12px; color: #999; text-decoration: underline; margin: 0;\">%appName%</a></td></tr></tbody></table></div></div></td><td style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0;\" valign=\"top\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0;\"><br></td></tr></tbody></table>', 1652139862);
INSERT INTO `templates` (`id`, `title`, `content`, `datetime`) VALUES
(6, 'Backup - ??????', '<table class=\"body-wrap mce-item-table\" style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; width: 100%; background-color: #f6f6f6; margin: 0;\" bgcolor=\"#f6f6f6\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; width: 100%; background-color: #f6f6f6; margin: 0;\"><tbody><tr style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\"><td style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0;\" valign=\"top\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0;\"><br></td><td class=\"container\" style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; display: block !important; max-width: 600px !important; clear: both !important; margin: 0 auto;\" valign=\"top\" width=\"600\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; display: block !important; max-width: 600px !important; clear: both !important; margin: 0 auto;\"><div class=\"content\" style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; max-width: 600px; display: block; margin: 0 auto; padding: 20px;\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; max-width: 600px; display: block; margin: 0 auto; padding: 20px;\"><table class=\"main mce-item-table\" style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; border-radius: 3px; background-color: #fff; margin: 0; border: 1px solid #e9e9e9;\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" bgcolor=\"#fff\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; border-radius: 3px; background-color: #fff; margin: 0; border: 1px solid #e9e9e9;\"><tbody><tr style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\"><td class=\"\" style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 16px; vertical-align: top; color: #fff; font-weight: 500; text-align: center; border-radius: 3px 3px 0 0; background-color: %app_color%; margin: 0; padding: 20px;\" align=\"center\" valign=\"top\" bgcolor=\"#71b6f9\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 16px; vertical-align: top; color: #fff; font-weight: 500; text-align: center; border-radius: 3px 3px 0 0; background-color: %app_color%; margin: 0; padding: 20px;\"><span style=\"margin-top: 10px; display: block;\" data-mce-style=\"margin-top: 10px; display: block;\">%title%</span></td></tr><tr style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\"><td class=\"content-wrap\" style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0; padding: 20px;\" valign=\"top\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0; padding: 20px;\"><table style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\" class=\"mce-item-table\"><tbody><tr style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\"><td class=\"content-block\" style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0; padding: 0 0 20px;\" valign=\"top\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0; padding: 0 0 20px;\"><br>%Lng_Hello% %Lang_admin%<br>%text%</td></tr></tbody></table></td></tr></tbody></table><div class=\"footer\" style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; width: 100%; clear: both; color: #999; margin: 0; padding: 20px;\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; width: 100%; clear: both; color: #999; margin: 0; padding: 20px;\"><table style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\" width=\"100%\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\" class=\"mce-item-table\"><tbody><tr style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\"><td class=\"aligncenter content-block\" style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 12px; vertical-align: top; color: #999; text-align: center; margin: 0; padding: 0 0 20px;\" align=\"center\" valign=\"top\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 12px; vertical-align: top; color: #999; text-align: center; margin: 0; padding: 0 0 20px;\"><a style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 12px; color: #999; text-decoration: underline; margin: 0;\" href=\"/%baseUrl%\" data-mce-href=\"/%baseUrl%\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 12px; color: #999; text-decoration: underline; margin: 0;\">%appName%</a></td></tr></tbody></table></div></div></td><td style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0;\" valign=\"top\" data-mce-style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0;\"><br></td></tr></tbody></table>', 1652093196),
(7, 'Terms Of Service & Privacy - ????????????', '<h2>????????????</h2><p>???????????????????????????????????????????????? %appName% ????????????????????????????????????%appName% ????????????????????? ?????????????????????????????? ???????????????????????????????????????????????? ????????????????????????????????????????????????????????? ??????????????????????????????????????? ?????????????????????????????????????????????????????????????????? ????????????????????????????????????????????????????????????????????????????????????????????????????????????????????? ??????????????? %appName% ????????????????????????SSR??????????????????????????????????????? ?????????????????????????????????????????????????????????????????????????????????%appName% ??????????????????????????? ??????????????????????????????????????????????????????????????????????????????????????????</p><h6>????????????</h6><ol><li>????????????????????????????????????????????? ???%appName%??? ????????????%appName%??? ????????????????????????????????????????????????????????????????????? ???%appName%??? ???????????????????????? %appName% ???????????????????????????????????? ???%appName%??? ?????????%appName% ???????????????????????????????????????????????????????????????????????????????????????????????????????????????</li><li>??????????????????????????? %appName% ?????????????????????????????????????????????????????????????????????????????????????????????????????????%appName% ?????????????????????????????????</li></ol><h6>????????????</h6><ol><li>????????????????????????????????? %appName% ???????????????????????????????????????????????? ????????????????????????????????????????????????????????? %appName%???</li><li>????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????</li><li>%appName% ???????????????????????????????????????????????????????????????</li><li>????????????????????????????????????????????????????????????????????????????????????????????????????????? %appName% ????????????????????????????????????????????????</li></ol><h6>?????????????????????</h6><ol><li>??????????????????????????????????????????????????????????????????????????????????????????</li><li>?????????????????? %appName% ??????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????<ul><li>???????????????????????????????????????</li><li>????????????????????????????????????????????????????????????????????????????????????</li><li>??????????????????????????????</li><li>?????????????????????????????????????????????????????????</li><li>?????????????????????????????????????????????????????????</li><li>?????????????????????????????????????????????????????????</li><li>??????????????????????????????????????????????????????????????????????????????</li><li>??????????????????????????????????????????????????????</li><li>???????????????????????????????????????????????????</li></ul></li><li>?????????????????? ???%appName%??? ?????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????:<ul><li>??????????????????????????????</li><li>???????????????????????????????????????</li><li>????????????????????????????????????????????????????????????</li><li>?????????????????????????????????????????????</li><li>?????????????????????????????????????????????????????????????????????????????????</li><li>???????????????????????????????????????????????????????????????????????????????????????????????????</li></ul></li></ol><h6>????????????</h6><ol><li>%appName% ????????????????????? %appName% ????????????????????????????????????????????????<ul><li>??????????????????</li><li>??????????????????</li></ul></li><li>?????????????????????????????????????????????????????????????????????????????????????????????????????????</li><li>???????????????????????????????????????????????? ??????????????????????????????</li></ol><h6>???????????????</h6><ol><li>????????????????????? %appName% ????????????????????????????????????<ul><li>???????????????????????????????????????</li><li>???????????????????????? ???%appName%??? ?????????%appName% ??????????????????????????????????????????????????????????????????</li><li>?????????????????? ???%appName%??? ????????????????????????????????????????????????????????????%appName% ??????????????????????????????</li><li>????????????????????????????????????????????????????????????????????????????????????</li><li>?????? %appName% ??????????????????????????????</li></ul></li><li>??????????????????%appName% ????????????????????????????????????????????????????????????????????????</li></ol><h6>????????????????????????</h6><ol><li>???????????????????????????????????????????????? %appName% ???????????? ?????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????</li><li>%appName% ????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????%appName% ?????????????????????????????? ???????????? %appName% ?????????????????????????????????</li></ol><h6>??????????????????</h6><ol><li>%appName% ??????????????????????????????????????????????????? ??????????????????????????????????????????????????? %appName% ??????????????????????????????????????????????????????</li><li>??????????????? %appName% ????????????????????????????????????????????????????????????????????? %appName% ?????????</li><li>???????????????????????????????????????????????????????????? %appName% ????????????????????????????????????</li></ol><h6>?????????????????????</h6><ol><li>??? %appName% ?????????????????????????????????????????????????????????????????????????????????????????????????????? ????????????????????????????????????????????????????????????????????????</li><li>??????????????????????????? %appName% ???????????????????????????????????????????????????????????? %appName% ????????????????????????????????????????????????</li><li>??????????????????????????? %appName% ???????????????????????????????????????????????? %appName% ???????????????????????? ?????????????????????????????????????????????????????????????????????????????????????????????????????? %appName% ?????????????????????????????????????????????????????????????????????????????????????????????</li></ol><h6>????????????</h6><ol><li>???????????????<ul><li>??????????????? %appName% ???????????????????????????????????????????????????</li><li>??????????????? %appName%????????????????????????????????? %appName% ???????????????????????????????????????????????? ????????????????????????????????? IP ???????????????????????????????????????????????????</li></ul></li><li>???????????????<ul><li>%appName% ??????????????????????????????????????????????????????????????????????????????????????????</li><li>%appName% ??????????????????????????????????????????????????? ????????????????????????????????????????????????????????????????????????????????????????????????????????????%appName% ????????????????????????????????????????????? ??????????????????</li><li>?????????????????????????????????%appName% ????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????</li></ul></li><li>??????????????? ??????????????????????????????????????????????????????????????????<ul><li>????????????????????????????????????</li><li>??????????????????????????????????????????????????????????????????????????????????????????????????????????????????</li><li>????????????????????????????????????????????????????????????????????????????????????????????????</li><li>???????????? %appName% ?????????????????????????????????%appName% ?????????????????????????????????</li></ul></li></ol><h6>??????</h6><ol><li>%appName% ?????????????????????????????????????????? %appName% ???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????</li><li>??????????????????????????? %appName% ??????????????????????????????????????????????????????</li></ol>', 1652092914);


ALTER TABLE `templates`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1; 
COMMIT;
