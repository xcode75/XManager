-- phpMyAdmin SQL Dump
-- version 4.4.15.10
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 17, 2021 at 05:52 AM
-- Server version: 5.5.68-MariaDB
-- PHP Version: 7.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `XManager`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE IF NOT EXISTS `accounts` (
  `id` int(20) NOT NULL,
  `status` int(2) NOT NULL DEFAULT '0',
  `accountname` text NOT NULL,
  `accountid` text NOT NULL,
  `accountpassword` text NOT NULL,
  `imagepath` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `status`, `accountname`, `accountid`, `accountpassword`, `imagepath`) VALUES
(1, 1, 'Apple', '', '', '/uploads/apple.png'),
(2, 1, 'Netflix', '', '', '/uploads/netflix-acc.png');

-- --------------------------------------------------------

--
-- Table structure for table `alive_ip`
--

CREATE TABLE IF NOT EXISTS `alive_ip` (
  `id` bigint(20) NOT NULL,
  `nodeid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `ip` text NOT NULL,
  `datetime` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bought`
--

CREATE TABLE IF NOT EXISTS `bought` (
  `id` bigint(20) NOT NULL,
  `userid` bigint(20) NOT NULL,
  `shopid` bigint(20) NOT NULL,
  `datetime` bigint(20) NOT NULL,
  `renew` bigint(11) NOT NULL,
  `coupon` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(12,2) NOT NULL,
  `is_notified` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `captcha`
--

CREATE TABLE IF NOT EXISTS `captcha` (
  `id` bigint(20) NOT NULL,
  `phrase` text,
  `phraseid` int(5) NOT NULL,
  `expire` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `commission`
--

CREATE TABLE IF NOT EXISTS `commission` (
  `id` bigint(20) NOT NULL,
  `total` decimal(12,2) NOT NULL,
  `userid` bigint(20) NOT NULL,
  `ref_by` bigint(20) NOT NULL,
  `ref_get` decimal(12,2) NOT NULL,
  `datetime` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `config`
--

CREATE TABLE IF NOT EXISTS `config` (
  `name` varchar(255) NOT NULL,
  `value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `config`
--

INSERT INTO `config` (`name`, `value`) VALUES
('accessdenied', '0'),
('add_emoji_to_server_name', '1'),
('admin_telegram', ''),
('alipay_public_key', ''),
('alipay_url', NULL),
('allowaccess', '0'),
('alphavantage_apikey', ''),
('api_key', 'rlVxVwIvilbVBQ6UVvZ2'),
('appName', 'XManager'),
('aws_key', ''),
('aws_region', 'eu-west-2'),
('aws_secret', ''),
('backup_email', ''),
('backup_password', ''),
('baseUrl', 'https://xmanager.xx.com'),
('buy_reset', '1'),
('callback_addr', ''),
('captcha', '0'),
('client_id', ''),
('cnrestrictions', ''),
('coinpayments_Currency', 'USDT.TRC20'),
('coinpayments_Private_Key', ''),
('coinpayments_Public_Key', ''),
('cp_ipn_secret', ''),
('cp_merchant_id', ''),
('crypto_secret', NULL),
('easypay_apiurl', ''),
('easypay_app_id', ''),
('easypay_secret', ''),
('email_backup', '0'),
('email_verify', '1'),
('enablepayments', '1'),
('enable_alipay', '6'),
('enable_backup', '0'),
('enable_bitcoin', '0'),
('enable_ga_tracking', '0'),
('enable_invite', '0'),
('enable_kill', '1'),
('enable_notification', '0'),
('enable_paypal', '0'),
('enable_reg', '1'),
('enable_tawkchat', '0'),
('enable_telegram', '0'),
('enable_wechat', '0'),
('exp_reset', '1'),
('f2fpay_app_id', ''),
('ga_id', ''),
('GoogleAuth', '0'),
('GoogleClientID', ''),
('GoogleEmail', ''),
('GoogleSecret', ''),
('GoogleToken', ''),
('h_captcha_key', ''),
('h_captcha_secrete', ''),
('jkstate', '1'),
('lastheart', NULL),
('lastpay', NULL),
('latesversion', 'v3.9.1'),
('LoginLogs', '1'),
('loginverify', '0'),
('logo_path', '/uploads/X.png'),
('mailDriver', '0'),
('mailgun_domain', ''),
('mailgun_key', ''),
('mailgun_sender', ''),
('maintenance', '0'),
('merchant_private_key', ''),
('mgate_api_url', ''),
('mgate_app_id', ''),
('mgate_app_secret', ''),
('mobile_verify', '0'),
('mugglepayAppSecret', NULL),
('muKey', 'XManager'),
('order_exp', '5'),
('paypal_client', ''),
('paypal_mode', 'sandbox'),
('paypal_secret', ''),
('pay_bal', '1'),
('pwdMethod', 'sha256'),
('rate', '6.48'),
('rebate', '5'),
('reg_connector', '1'),
('reg_group', '1'),
('reg_level', '3'),
('reg_speed', '1024'),
('reg_traffic', '1'),
('reg_traffic_exp', '1'),
('rememberMeDuration', '7'),
('restrictions', ''),
('restrict_email', '1'),
('restrict_email_list', '@gmail.com,@protonmail.com,@ymail.com,@hotmail.co.uk,@hotmail.com,@qq.com,@outlook.com,@163.com,@126.com,@live.com,@msn.com,@yeah.net,@foxmail.com'),
('salt', ''),
('sendgrid_key', ''),
('sendgrid_name', 'XManager'),
('sendgrid_sender', ''),
('ShareAccounts', '1'),
('site_key', '1145141919810'),
('smsDriver', '0'),
('smtp_debug', '0'),
('smtp_host', 'smtp.sendgrid.net'),
('smtp_name', 'XManager'),
('smtp_password', ''),
('smtp_port', '465'),
('smtp_sender', ''),
('smtp_ssl', '1'),
('smtp_username', ''),
('statsupdate', '10'),
('stripe_key', ''),
('stripe_webhook', ''),
('subUrl', 'https://xmanager.xx.com/link/'),
('sub_addr', 'https://xmanager.xx.com/link/'),
('tawkchat_api', ''),
('tawkchat_id', ''),
('telegram_backup', '0'),
('telegram_bot', ''),
('telegram_chatid', ''),
('telegram_gid', ''),
('telegram_group_link', ''),
('telegram_group_quiet', '1'),
('telegram_request_token', 'sjhueAMAndnenw2k2k1mmsJSJWMWiwiwthgfhgfhx'),
('telegram_token', ''),
('theadpay_key', ''),
('theadpay_mchid', ''),
('theadpay_url', ''),
('tracking_id', ''),
('Tutoriallink', ''),
('TutorialState', '0'),
('twillo_account_sid', ''),
('twillo_auth_token', ''),
('twillo_number', ''),
('version', 'v3.9.1'),
('ViewLogs', '0'),
('WebapiSafe', '1'),
('wechat_url', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE IF NOT EXISTS `country` (
  `id` int(11) NOT NULL,
  `cnname` text NOT NULL,
  `name` text NOT NULL,
  `fullname` text NOT NULL,
  `alpha2` text NOT NULL,
  `alpha3` text NOT NULL,
  `code` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`id`, `cnname`, `name`, `fullname`, `alpha2`, `alpha3`, `code`) VALUES
(1, '阿富汗', 'Afghanistan', 'the Islamic Republic of Afghanistan', 'AF', 'AFG', 4),
(2, '奥兰群岛', 'Aland Islands', '', 'AX', 'ALA', 248),
(3, '阿尔巴尼亚', 'Albania', 'the Republic of Albania', 'AL', 'ALB', 8),
(4, '阿尔及利亚', 'Algeria', 'the People''s Democratic Republic of Algeria', 'DZ', 'DZA', 12),
(5, '美属萨摩亚', 'American Samoa', '', 'AS', 'ASM', 16),
(6, '安道尔', 'Andorra', 'the Principality of Andorra', 'AD', 'AND', 20),
(7, '安哥拉', 'Angola', 'the Republic of Angola', 'AO', 'AGO', 24),
(8, '安圭拉', 'Anguilla', '', 'AI', 'AIA', 660),
(9, '南极洲', 'Antarctica', '', 'AQ', 'ATA', 10),
(10, '安提瓜和巴布达', 'Antigua and Barbuda', '', 'AG', 'ATG', 28),
(11, '阿根廷', 'Argentina', 'the Argentine Republic', 'AR', 'ARG', 32),
(12, '亚美尼亚', 'Armenia', 'the Republic of Armenia', 'AM', 'ARM', 51),
(13, '阿鲁巴', 'Aruba', '', 'AW', 'ABW', 533),
(14, '澳大利亚', 'Australia', '', 'AU', 'AUS', 36),
(15, '奥地利', 'Austria', 'the Republic of Austria', 'AT', 'AUT', 40),
(16, '阿塞拜疆', 'Azerbaijan', 'the Republic of Azerbaijan', 'AZ', 'AZE', 31),
(17, '巴哈马', 'Bahamas (The)', 'the Commonwealth of The Bahamas', 'BS', 'BHS', 44),
(18, '巴林', 'Bahrain', 'the Kingdom of Bahrain', 'BH', 'BHR', 48),
(19, '孟加拉国', 'Bangladesh', 'the People''s Republic of Bangladesh', 'BD', 'BGD', 50),
(20, '巴巴多斯', 'Barbados', '', 'BB', 'BRB', 52),
(21, '白俄罗斯', 'Belarus', 'the Republic of Belarus', 'BY', 'BLR', 112),
(22, '比利时', 'Belgium', 'the Kingdom of Belgium', 'BE', 'BEL', 56),
(23, '伯利兹', 'Belize', '', 'BZ', 'BLZ', 84),
(24, '贝宁', 'Benin', 'the Republic of Benin', 'BJ', 'BEN', 204),
(25, '百慕大', 'Bermuda', '', 'BM', 'BMU', 60),
(26, '不丹', 'Bhutan', 'the Kingdom of Bhutan', 'BT', 'BTN', 64),
(27, '玻利维亚', 'Bolivia', 'the Republic of Bolivia', 'BO', 'BOL', 68),
(28, '波黑', 'Bosnia and Herzegovina', '', 'BA', 'BIH', 70),
(29, '博茨瓦纳', 'Botswana', 'the Republic of Botswana', 'BW', 'BWA', 72),
(30, '布维岛', 'Bouvet Island', '', 'BV', 'BVT', 74),
(31, '巴西', 'Brazil', 'the Federative Republic of Brazil', 'BR', 'BRA', 76),
(32, '英属印度洋领地', 'British Indian Ocean Territory (the)', '', 'IO', 'IOT', 86),
(33, '文莱', 'Brunei Darussalam', '', 'BN', 'BRN', 96),
(34, '保加利亚', 'Bulgaria', 'the Republic of Bulgaria', 'BG', 'BGR', 100),
(35, '布基纳法索', 'Burkina Faso', 'Burkina Faso', 'BF', 'BFA', 854),
(36, '布隆迪', 'Burundi', 'the Republic of Burundi', 'BI', 'BDI', 108),
(37, '柬埔寨', 'Cambodia', 'the Kingdom of Cambodia', 'KH', 'KHM', 116),
(38, '喀麦隆', 'Cameroon', 'the Republic of Cameroon', 'CM', 'CMR', 120),
(39, '加拿大', 'Canada', '', 'CA', 'CAN', 124),
(40, '佛得角', 'Cape Verde', 'the Republic of Cape Verde', 'CV', 'CPV', 132),
(41, '开曼群岛', 'Cayman Islands (the)', '', 'KY', 'CYM', 136),
(42, '中非', 'Central African Republic (the)', 'the Central African Republic', 'CF', 'CAF', 140),
(43, '乍得', 'Chad', 'the Republic of Chad', 'TD', 'TCD', 148),
(44, '智利', 'Chile', 'the Republic of Chile', 'CL', 'CHL', 152),
(45, '中国', 'China', 'the People''s Republic of China', 'CN', 'CHN', 156),
(46, '圣诞岛', 'Christmas Island', '', 'CX', 'CXR', 162),
(47, '科科斯（基林）群岛', 'Cocos (Keeling) Islands (the)', '', 'CC', 'CCK', 166),
(48, '哥伦比亚', 'Colombia', 'the Republic of Colombia', 'CO', 'COL', 170),
(49, '科摩罗', 'Comoros', 'the Union of the Comoros', 'KM', 'COM', 174),
(50, '刚果（布）', 'Congo', 'the Republic of the Congo', 'CG', 'COG', 178),
(51, '刚果（金）', 'Congo (the Democratic Republic of the)', 'the Democratic Republic of the Congo', 'CD', 'COD', 180),
(52, '库克群岛', 'Cook Islands (the)', '', 'CK', 'COK', 184),
(53, '哥斯达黎加', 'Costa Rica', 'the Republic of Costa Rica', 'CR', 'CRI', 188),
(54, '科特迪瓦', 'Côte d''Ivoire', 'the Republic of Côte d''Ivoire', 'CI', 'CIV', 384),
(55, '克罗地亚', 'Croatia', 'the Republic of Croatia', 'HR', 'HRV', 191),
(56, '古巴', 'Cuba', 'the Republic of Cuba', 'CU', 'CUB', 192),
(57, '塞浦路斯', 'Cyprus', 'the Republic of Cyprus', 'CY', 'CYP', 196),
(58, '捷克', 'Czech Republic (the)', 'the Czech Republic', 'CZ', 'CZE', 203),
(59, '丹麦', 'Denmark', 'the Kingdom of Denmark', 'DK', 'DNK', 208),
(60, '吉布提', 'Djibouti', 'the Republic of Djibouti', 'DJ', 'DJI', 262),
(61, '多米尼克', 'Dominica', 'the Commonwealth of Dominica', 'DM', 'DMA', 212),
(62, '多米尼加', 'Dominican Republic (the)', 'the Dominican Republic', 'DO', 'DOM', 214),
(63, '厄瓜多尔', 'Ecuador', 'the Republic of Ecuador', 'EC', 'ECU', 218),
(64, '埃及', 'Egypt', 'the Arab Republic of Egypt', 'EG', 'EGY', 818),
(65, '萨尔瓦多', 'El Salvador', 'the Republic of El Salvador', 'SV', 'SLV', 222),
(66, '赤道几内亚', 'Equatorial Guinea', 'the Republic of Equatorial Guinea', 'GQ', 'GNQ', 226),
(67, '厄立特里亚', 'Eritrea', '', 'ER', 'ERI', 232),
(68, '爱沙尼亚', 'Estonia', 'the Republic of Estonia', 'EE', 'EST', 233),
(69, '埃塞俄比亚', 'Ethiopia', 'the Federal Democratic Republic of Ethiopia', 'ET', 'ETH', 231),
(70, '福克兰群岛（马尔维纳斯）', 'Falkland Islands (the) [Malvinas]', '', 'FK', 'FLK', 238),
(71, '法罗群岛', 'Faroe Islands (the)', '', 'FO', 'FRO', 234),
(72, '斐济', 'Fiji', 'the Republic of the Fiji Islands', 'FJ', 'FJI', 242),
(73, '芬兰', 'Finland', 'the Republic of Finland', 'FI', 'FIN', 246),
(74, '法国', 'France', 'the French Republic', 'FR', 'FRA', 250),
(75, '法属圭亚那', 'French Guiana', '', 'GF', 'GUF', 254),
(76, '法属波利尼西亚', 'French Polynesia', '', 'PF', 'PYF', 258),
(77, '法属南部领地', 'French Southern Territories (the)', '', 'TF', 'ATF', 260),
(78, '加蓬', 'Gabon', 'the Gabonese Republic', 'GA', 'GAB', 266),
(79, '冈比亚', 'Gambia (The)', 'the Republic of The Gambia', 'GM', 'GMB', 270),
(80, '格鲁吉亚', 'Georgia', '', 'GE', 'GEO', 268),
(81, '德国', 'Germany', 'he Federal Republic of Germany', 'DE', 'DEU', 276),
(82, '加纳', 'Ghana', 'the Republic of Ghana', 'GH', 'GHA', 288),
(83, '直布罗陀', 'Gibraltar', '', 'GI', 'GIB', 292),
(84, '希腊', 'Greece', 'the Hellenic Republic', 'GR', 'GRC', 300),
(85, '格陵兰', 'Greenland', '', 'GL', 'GRL', 304),
(86, '格林纳达', 'Grenada', '', 'GD', 'GRD', 308),
(87, '瓜德罗普', 'Guadeloupe', '', 'GP', 'GLP', 312),
(88, '关岛', 'Guam', '', 'GU', 'GUM', 316),
(89, '危地马拉', 'Guatemala', 'the Republic of Guatemala', 'GT', 'GTM', 320),
(90, '格恩西岛', 'Guernsey', '', 'GG', 'GGY', 831),
(91, '几内亚', 'Guinea', 'the Republic of Guinea', 'GN', 'GIN', 324),
(92, '几内亚比绍', 'Guinea-Bissau', 'the Republic of Guinea-Bissau', 'GW', 'GNB', 624),
(93, '圭亚那', 'Guyana', 'the Republic of Guyana', 'GY', 'GUY', 328),
(94, '海地', 'Haiti', 'the Republic of Haiti', 'HT', 'HTI', 332),
(95, '赫德岛和麦克唐纳岛', 'Heard Island and McDonald Islands', '', 'HM', 'HMD', 334),
(96, '梵蒂冈', 'Holy See (the) [Vatican City State]', '', 'VA', 'VAT', 336),
(97, '洪都拉斯', 'Honduras', 'the Republic of Honduras', 'HN', 'HND', 340),
(98, '香港', 'Hong Kong', 'the Hong Kong Special Administrative Region of China', 'HK', 'HKG', 344),
(99, '匈牙利', 'Hungary', 'the Republic of Hungary', 'HU', 'HUN', 348),
(100, '冰岛', 'Iceland', 'the Republic of Iceland', 'IS', 'ISL', 352),
(101, '印度', 'India', 'the Republic of India', 'IN', 'IND', 356),
(102, '印度尼西亚', 'Indonesia', 'the Republic of Indonesia', 'ID', 'IDN', 360),
(103, '伊朗', 'Iran (the Islamic Republic of)', 'the Islamic Republic of Iran', 'IR', 'IRN', 364),
(104, '伊拉克', 'Iraq', 'the Republic of Iraq', 'IQ', 'IRQ', 368),
(105, '爱尔兰', 'Ireland', '', 'IE', 'IRL', 372),
(106, '英国属地曼岛', 'Isle of Man', '', 'IM', 'IMN', 833),
(107, '以色列', 'Israel', 'the State of Israel', 'IL', 'ISR', 376),
(108, '意大利', 'Italy', 'the Republic of Italy', 'IT', 'ITA', 380),
(109, '牙买加', 'Jamaica', '', 'JM', 'JAM', 388),
(110, '日本', 'Japan', '', 'JP', 'JPN', 392),
(111, '泽西岛', 'Jersey', '', 'JE', 'JEY', 832),
(112, '约旦', 'Jordan', 'the Hashemite Kingdom of Jordan', 'JO', 'JOR', 400),
(113, '哈萨克斯坦', 'Kazakhstan', 'the Republic of Kazakhstan', 'KZ', 'KAZ', 398),
(114, '肯尼亚', 'Kenya', 'the Republic of Kenya', 'KE', 'KEN', 404),
(115, '基里巴斯', 'Kiribati', 'the Republic of Kiribati', 'KI', 'KIR', 296),
(116, '朝鲜', 'Korea (the Democratic People''s Republic of)', 'the Democratic People''s Republic of Korea', 'KP', 'PRK', 408),
(117, '韩国', 'Korea (the Republic of)', 'the Republic of Korea', 'KR', 'KOR', 410),
(118, '科威特', 'Kuwait', 'he State of Kuwait', 'KW', 'KWT', 414),
(119, '吉尔吉斯斯坦', 'Kyrgyzstan', 'the Kyrgyz Republic', 'KG', 'KGZ', 417),
(120, '老挝', 'Lao People''s Democratic Republic (the)', 'the Lao People''s Democratic Republic', 'LA', 'LAO', 418),
(121, '拉脱维亚', 'Latvia', 'the Republic of Latvia', 'LV', 'LVA', 428),
(122, '黎巴嫩', 'Lebanon', 'the Lebanese Republic', 'LB', 'LBN', 422),
(123, '莱索托', 'Lesotho', 'the Kingdom of Lesotho', 'LS', 'LSO', 426),
(124, '利比里亚', 'Liberia', 'the Republic of Liberia', 'LR', 'LBR', 430),
(125, '利比亚', 'Libyan Arab Jamahiriya (the)', 'the Socialist People''s Libyan Arab Jamahiriya', 'LY', 'LBY', 434),
(126, '列支敦士登', 'Liechtenstein', 'the Principality of Liechtenstein', 'LI', 'LIE', 438),
(127, '立陶宛', 'Lithuania', 'the Republic of Lithuania', 'LT', 'LTU', 440),
(128, '卢森堡', 'Luxembourg', 'the Grand Duchy of Luxembourg', 'LU', 'LUX', 442),
(129, '澳门', 'Macao', 'Macao Special Administrative Region of China', 'MO', 'MAC', 446),
(130, '前南马其顿', 'Macedonia (the former Yugoslav Republic of)', 'the former Yugoslav Republic of Macedonia', 'MK', 'MKD', 807),
(131, '马达加斯加', 'Madagascar', 'the Republic of Madagascar', 'MG', 'MDG', 450),
(132, '马拉维', 'Malawi', 'the Republic of Malawi', 'MW', 'MWI', 454),
(133, '马来西亚', 'Malaysia', '', 'MY', 'MYS', 458),
(134, '马尔代夫', 'Maldives', 'the Republic of Maldives', 'MV', 'MDV', 462),
(135, '马里', 'Mali', 'the Republic of Mali', 'ML', 'MLI', 466),
(136, '马耳他', 'Malta', 'the Republic of Malta', 'MT', 'MLT', 470),
(137, '马绍尔群岛', 'Marshall Islands (the)', 'the Republic of the Marshall Islands', 'MH', 'MHL', 584),
(138, '马提尼克', 'Martinique', '', 'MQ', 'MTQ', 474),
(139, '毛利塔尼亚', 'Mauritania', 'the Islamic Republic of Mauritania', 'MR', 'MRT', 478),
(140, '毛里求斯', 'Mauritius', 'the Republic of Mauritius', 'MU', 'MUS', 480),
(141, '马约特', 'Mayotte', '', 'YT', 'MYT', 175),
(142, '墨西哥', 'Mexico', 'the United Mexican States', 'MX', 'MEX', 484),
(143, '密克罗尼西亚联邦', 'Micronesia (the Federated States of)', 'the Federated States of Micronesia', 'FM', 'FSM', 583),
(144, '摩尔多瓦', 'Moldova (the Republic of)', 'the Republic of Moldova', 'MD', 'MDA', 498),
(145, '摩纳哥', 'Monaco', 'the Principality of Monaco', 'MC', 'MCO', 492),
(146, '蒙古', 'Mongolia', '', 'MN', 'MNG', 496),
(147, '黑山', 'Montenegro', 'he Republic of Montenegro', 'ME', 'MNE', 499),
(148, '蒙特塞拉特', 'Montserrat', '', 'MS', 'MSR', 500),
(149, '摩洛哥', 'Morocco', 'the Kingdom of Morocco', 'MA', 'MAR', 504),
(150, '莫桑比克', 'Mozambique', 'the Republic of Mozambique', 'MZ', 'MOZ', 508),
(151, '缅甸', 'Myanmar', 'the Union of Myanmar', 'MM', 'MMR', 104),
(152, '纳米比亚', 'Namibia', 'the Republic of Namibia', 'NA', 'NAM', 516),
(153, '瑙鲁', 'Nauru', 'the Republic of Nauru', 'NR', 'NRU', 520),
(154, '尼泊尔', 'Nepal', 'Nepal', 'NP', 'NPL', 524),
(155, '荷兰', 'Netherlands (the)', 'the Kingdom of the Netherlands', 'NL', 'NLD', 528),
(156, '荷属安的列斯', 'Netherlands Antilles (the)', '', 'AN', 'ANT', 530),
(157, '新喀里多尼亚', 'New Caledonia', '', 'NC', 'NCL', 540),
(158, '新西兰', 'New Zealand', '', 'NZ', 'NZL', 554),
(159, '尼加拉瓜', 'Nicaragua', 'the Republic of Nicaragua', 'NI', 'NIC', 558),
(160, '尼日尔', 'Niger (the)', 'the Republic of the Niger', 'NE', 'NER', 562),
(161, '尼日利亚', 'Nigeria', 'the Federal Republic of Nigeria', 'NG', 'NGA', 566),
(162, '纽埃', 'Niue', 'the Republic of Niue', 'NU', 'NIU', 570),
(163, '诺福克岛', 'Norfolk Island', '', 'NF', 'NFK', 574),
(164, '北马里亚纳', 'Northern Mariana Islands (the)', 'the Commonwealth of the Northern Mariana Islands', 'MP', 'MNP', 580),
(165, '挪威', 'Norway', 'the Kingdom of Norway', 'NO', 'NOR', 578),
(166, '阿曼', 'Oman', 'the Sultanate of Oman', 'OM', 'OMN', 512),
(167, '巴基斯坦', 'Pakistan', 'the Islamic Republic of Pakistan', 'PK', 'PAK', 586),
(168, '帕劳', 'Palau', 'the Republic of Palau', 'PW', 'PLW', 585),
(169, '巴勒斯坦', 'Palestinian Territory (the Occupied)', 'the Occupied Palestinian Territory', 'PS', 'PSE', 275),
(170, '巴拿马', 'Panama', 'the Republic of Panama', 'PA', 'PAN', 591),
(171, '巴布亚新几内亚', 'Papua New Guinea', '', 'PG', 'PNG', 598),
(172, '巴拉圭', 'Paraguay', 'the Republic of Paraguay', 'PY', 'PRY', 600),
(173, '秘鲁', 'Peru', 'the Republic of Peru', 'PE', 'PER', 604),
(174, '菲律宾', 'Philippines (the)', 'the Republic of the Philippines', 'PH', 'PHL', 608),
(175, '皮特凯恩', 'Pitcairn', '', 'PN', 'PCN', 612),
(176, '波兰', 'Poland', 'the Republic of Poland', 'PL', 'POL', 616),
(177, '葡萄牙', 'Portugal', 'the Portuguese Republic', 'PT', 'PRT', 620),
(178, '波多黎各', 'Puerto Rico', '', 'PR', 'PRI', 630),
(179, '卡塔尔', 'Qatar', 'the State of Qatar', 'QA', 'QAT', 634),
(180, '留尼汪', 'Réunion', '', 'RE', 'REU', 638),
(181, '罗马尼亚', 'Romania', '', 'RO', 'ROU', 642),
(182, '俄罗斯联邦', 'Russian Federation (the)', 'the Russian Federation', 'RU', 'RUS', 643),
(183, '卢旺达', 'Rwanda', 'the Republic of Rwanda', 'RW', 'RWA', 646),
(184, '圣赫勒拿', 'Saint Helena', '', 'SH', 'SHN', 654),
(185, '圣基茨和尼维斯', 'Saint Kitts and Nevis', '', 'KN', 'KNA', 659),
(186, '圣卢西亚', 'Saint Lucia', '', 'LC', 'LCA', 662),
(187, '圣皮埃尔和密克隆', 'Saint Pierre and Miquelon', '', 'PM', 'SPM', 666),
(188, '圣文森特和格林纳丁斯', 'Saint Vincent and the Grenadines', '', 'VC', 'VCT', 670),
(189, '萨摩亚', 'Samoa', 'the Independent State of Samoa', 'WS', 'WSM', 882),
(190, '圣马力诺', 'San Marino', 'the Republic of San Marino', 'SM', 'SMR', 674),
(191, '圣多美和普林西比', 'Sao Tome and Principe', 'the Democratic Republic of Sao Tome and Principe', 'ST', 'STP', 678),
(192, '沙特阿拉伯', 'Saudi Arabia', 'the Kingdom of Saudi Arabia', 'SA', 'SAU', 682),
(193, '塞内加尔', 'Senegal', 'the Republic of Senegal', 'SN', 'SEN', 686),
(194, '塞尔维亚', 'Serbia', 'the Republic of Serbia', 'RS', 'SRB', 688),
(195, '塞舌尔', 'Seychelles', 'the Republic of Seychelles', 'SC', 'SYC', 690),
(196, '塞拉利昂', 'Sierra Leone', 'the Republic of Sierra Leone', 'SL', 'SLE', 694),
(197, '新加坡', 'Singapore', 'the Republic of Singapore', 'SG', 'SGP', 702),
(198, '斯洛伐克', 'Slovakia', 'the Slovak Republic', 'SK', 'SVK', 703),
(199, '斯洛文尼亚', 'Slovenia', 'the Republic of Slovenia', 'SI', 'SVN', 705),
(200, '所罗门群岛', 'Solomon Islands (the)', '', 'SB', 'SLB', 90),
(201, '索马里', 'Somalia', 'the Somali Republic', 'SO', 'SOM', 706),
(202, '南非', 'South Africa', 'the Republic of South Africa', 'ZA', 'ZAF', 710),
(203, '南乔治亚岛和南桑德韦奇岛', 'South Georgia and the South Sandwich Islands', '', 'GS', 'SGS', 239),
(204, '西班牙', 'Spain', 'the Kingdom of Spain', 'ES', 'ESP', 724),
(205, '斯里兰卡', 'Sri Lanka', 'the Democratic Socialist Republic of Sri Lanka', 'LK', 'LKA', 144),
(206, '苏丹', 'Sudan (the)', 'the Republic of the Sudan', 'SD', 'SDN', 736),
(207, '苏里南', 'Suriname', 'the Republic of Suriname', 'SR', 'SUR', 740),
(208, '斯瓦尔巴岛和扬马延岛', 'Svalbard and Jan Mayen', '', 'SJ', 'SJM', 744),
(209, '斯威士兰', 'Swaziland', 'the Kingdom of Swaziland', 'SZ', 'SWZ', 748),
(210, '瑞典', 'Sweden', 'the Kingdom of Sweden', 'SE', 'SWE', 752),
(211, '瑞士', 'Switzerland', 'the Swiss Confederation', 'CH', 'CHE', 756),
(212, '叙利亚', 'Syrian Arab Republic (the)', 'the Syrian Arab Republic', 'SY', 'SYR', 760),
(213, '台湾', 'Taiwan (Province of China)', '', 'TW', 'TWN', 158),
(214, '塔吉克斯坦', 'Tajikistan', 'the Republic of Tajikistan', 'TJ', 'TJK', 762),
(215, '坦桑尼亚', 'Tanzania,United Republic of', 'the United Republic of Tanzania', 'TZ', 'TZA', 834),
(216, '泰国', 'Thailand', 'the Kingdom of Thailand', 'TH', 'THA', 764),
(217, '东帝汶', 'Timor-Leste', 'the Democratic Republic of Timor-Leste', 'TL', 'TLS', 626),
(218, '多哥', 'Togo', 'the Togolese Republic', 'TG', 'TGO', 768),
(219, '托克劳', 'Tokelau', '', 'TK', 'TKL', 772),
(220, '汤加', 'Tonga', 'the Kingdom of Tonga', 'TO', 'TON', 776),
(221, '特立尼达和多巴哥', 'Trinidad and Tobago', 'the Republic of Trinidad and Tobago', 'TT', 'TTO', 780),
(222, '突尼斯', 'Tunisia', 'the Republic of Tunisia', 'TN', 'TUN', 788),
(223, '土耳其', 'Turkey', 'the Republic of Turkey', 'TR', 'TUR', 792),
(224, '土库曼斯坦', 'Turkmenistan', '', 'TM', 'TKM', 795),
(225, '特克斯和凯科斯群岛', 'Turks and Caicos Islands (the)', '', 'TC', 'TCA', 796),
(226, '图瓦卢', 'Tuvalu', '', 'TV', 'TUV', 798),
(227, '乌干达', 'Uganda', 'the Republic of Uganda', 'UG', 'UGA', 800),
(228, '乌克兰', 'Ukraine', '', 'UA', 'UKR', 804),
(229, '阿联酋', 'United Arab Emirates (the)', 'the United Arab Emirates', 'AE', 'ARE', 784),
(230, '英国', 'United Kingdom (the)', 'the United Kingdom of Great Britain and Northern Ireland', 'GB', 'GBR', 826),
(231, '美国', 'United States (the)', 'the United States of America', 'US', 'USA', 840),
(232, '美国本土外小岛屿', 'United States Minor Outlying Islands (the)', '', 'UM', 'UMI', 581),
(233, '乌拉圭', 'Uruguay', 'the Eastern Republic of Uruguay', 'UY', 'URY', 858),
(234, '乌兹别克斯坦', 'Uzbekistan', 'the Republic of Uzbekistan', 'UZ', 'UZB', 860),
(235, '瓦努阿图', 'Vanuatu', 'the Republic of Vanuatu', 'VU', 'VUT', 548),
(236, '委内瑞拉', 'Venezuela', 'the Bolivarian Republic of Venezuela', 'VE', 'VEN', 862),
(237, '越南', 'Viet Nam', 'the Socialist Republic of Viet Nam', 'VN', 'VNM', 704),
(238, '英属维尔京群岛', 'Virgin Islands (British)', 'British Virgin Islands (the)', 'VG', 'VGB', 92),
(239, '美属维尔京群岛', 'Virgin Islands (U.S.)', 'the Virgin Islands of the United States', 'VI', 'VIR', 850),
(240, '瓦利斯和富图纳', 'Wallis and Futuna', 'Wallis and Futuna Islands', 'WF', 'WLF', 876),
(241, '西撒哈拉', 'Western Sahara', '', 'EH', 'ESH', 732),
(242, '也门', 'Yemen', 'the Republic of Yemen', 'YE', 'YEM', 887),
(243, '赞比亚', 'Zambia', 'the Republic of Zambia', 'ZM', 'ZMB', 894),
(244, '津巴布韦', 'Zimbabwe', 'the Republic of Zimbabwe', 'ZW', 'ZWE', 716);

-- --------------------------------------------------------

--
-- Table structure for table `coupon`
--

CREATE TABLE IF NOT EXISTS `coupon` (
  `id` bigint(20) NOT NULL,
  `name` varchar(25) DEFAULT NULL,
  `code` text NOT NULL,
  `newuser` int(11) NOT NULL,
  `usage_no` int(20) NOT NULL,
  `expire` datetime NOT NULL,
  `package` text NOT NULL,
  `credit` int(11) NOT NULL,
  `type` bigint(11) NOT NULL,
  `status` int(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `email_queue`
--

CREATE TABLE IF NOT EXISTS `email_queue` (
  `id` bigint(20) NOT NULL,
  `to_email` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `template` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `array` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` int(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Email Queue 發件列表';

-- --------------------------------------------------------

--
-- Table structure for table `email_verify`
--

CREATE TABLE IF NOT EXISTS `email_verify` (
  `id` bigint(20) NOT NULL,
  `email` text NOT NULL,
  `ip` text NOT NULL,
  `code` text NOT NULL,
  `expire_in` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `isocodes`
--

CREATE TABLE IF NOT EXISTS `isocodes` (
  `id` int(11) NOT NULL,
  `iso` char(2) NOT NULL,
  `name` varchar(80) NOT NULL,
  `nicename` varchar(80) NOT NULL,
  `iso3` char(3) DEFAULT NULL,
  `numcode` smallint(6) DEFAULT NULL,
  `phonecode` int(5) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=254 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `isocodes`
--

INSERT INTO `isocodes` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES
(1, 'AF', 'AFGHANISTAN', 'Afghanistan', 'AFG', 4, 93),
(2, 'AL', 'ALBANIA', 'Albania', 'ALB', 8, 355),
(3, 'DZ', 'ALGERIA', 'Algeria', 'DZA', 12, 213),
(4, 'AS', 'AMERICAN SAMOA', 'American Samoa', 'ASM', 16, 1684),
(5, 'AD', 'ANDORRA', 'Andorra', 'AND', 20, 376),
(6, 'AO', 'ANGOLA', 'Angola', 'AGO', 24, 244),
(7, 'AI', 'ANGUILLA', 'Anguilla', 'AIA', 660, 1264),
(8, 'AQ', 'ANTARCTICA', 'Antarctica', NULL, NULL, 0),
(9, 'AG', 'ANTIGUA AND BARBUDA', 'Antigua and Barbuda', 'ATG', 28, 1268),
(10, 'AR', 'ARGENTINA', 'Argentina', 'ARG', 32, 54),
(11, 'AM', 'ARMENIA', 'Armenia', 'ARM', 51, 374),
(12, 'AW', 'ARUBA', 'Aruba', 'ABW', 533, 297),
(13, 'AU', 'AUSTRALIA', 'Australia', 'AUS', 36, 61),
(14, 'AT', 'AUSTRIA', 'Austria', 'AUT', 40, 43),
(15, 'AZ', 'AZERBAIJAN', 'Azerbaijan', 'AZE', 31, 994),
(16, 'BS', 'BAHAMAS', 'Bahamas', 'BHS', 44, 1242),
(17, 'BH', 'BAHRAIN', 'Bahrain', 'BHR', 48, 973),
(18, 'BD', 'BANGLADESH', 'Bangladesh', 'BGD', 50, 880),
(19, 'BB', 'BARBADOS', 'Barbados', 'BRB', 52, 1246),
(20, 'BY', 'BELARUS', 'Belarus', 'BLR', 112, 375),
(21, 'BE', 'BELGIUM', 'Belgium', 'BEL', 56, 32),
(22, 'BZ', 'BELIZE', 'Belize', 'BLZ', 84, 501),
(23, 'BJ', 'BENIN', 'Benin', 'BEN', 204, 229),
(24, 'BM', 'BERMUDA', 'Bermuda', 'BMU', 60, 1441),
(25, 'BT', 'BHUTAN', 'Bhutan', 'BTN', 64, 975),
(26, 'BO', 'BOLIVIA', 'Bolivia', 'BOL', 68, 591),
(27, 'BA', 'BOSNIA AND HERZEGOVINA', 'Bosnia and Herzegovina', 'BIH', 70, 387),
(28, 'BW', 'BOTSWANA', 'Botswana', 'BWA', 72, 267),
(29, 'BV', 'BOUVET ISLAND', 'Bouvet Island', NULL, NULL, 0),
(30, 'BR', 'BRAZIL', 'Brazil', 'BRA', 76, 55),
(31, 'IO', 'BRITISH INDIAN OCEAN TERRITORY', 'British Indian Ocean Territory', NULL, NULL, 246),
(32, 'BN', 'BRUNEI DARUSSALAM', 'Brunei Darussalam', 'BRN', 96, 673),
(33, 'BG', 'BULGARIA', 'Bulgaria', 'BGR', 100, 359),
(34, 'BF', 'BURKINA FASO', 'Burkina Faso', 'BFA', 854, 226),
(35, 'BI', 'BURUNDI', 'Burundi', 'BDI', 108, 257),
(36, 'KH', 'CAMBODIA', 'Cambodia', 'KHM', 116, 855),
(37, 'CM', 'CAMEROON', 'Cameroon', 'CMR', 120, 237),
(38, 'CA', 'CANADA', 'Canada', 'CAN', 124, 1),
(39, 'CV', 'CAPE VERDE', 'Cape Verde', 'CPV', 132, 238),
(40, 'KY', 'CAYMAN ISLANDS', 'Cayman Islands', 'CYM', 136, 1345),
(41, 'CF', 'CENTRAL AFRICAN REPUBLIC', 'Central African Republic', 'CAF', 140, 236),
(42, 'TD', 'CHAD', 'Chad', 'TCD', 148, 235),
(43, 'CL', 'CHILE', 'Chile', 'CHL', 152, 56),
(44, 'CN', 'CHINA', 'China', 'CHN', 156, 86),
(45, 'CX', 'CHRISTMAS ISLAND', 'Christmas Island', NULL, NULL, 61),
(46, 'CC', 'COCOS (KEELING) ISLANDS', 'Cocos (Keeling) Islands', NULL, NULL, 672),
(47, 'CO', 'COLOMBIA', 'Colombia', 'COL', 170, 57),
(48, 'KM', 'COMOROS', 'Comoros', 'COM', 174, 269),
(49, 'CG', 'CONGO', 'Congo', 'COG', 178, 242),
(50, 'CD', 'CONGO, THE DEMOCRATIC REPUBLIC OF THE', 'Congo, the Democratic Republic of the', 'COD', 180, 242),
(51, 'CK', 'COOK ISLANDS', 'Cook Islands', 'COK', 184, 682),
(52, 'CR', 'COSTA RICA', 'Costa Rica', 'CRI', 188, 506),
(53, 'CI', 'COTE D''IVOIRE', 'Cote D''Ivoire', 'CIV', 384, 225),
(54, 'HR', 'CROATIA', 'Croatia', 'HRV', 191, 385),
(55, 'CU', 'CUBA', 'Cuba', 'CUB', 192, 53),
(56, 'CY', 'CYPRUS', 'Cyprus', 'CYP', 196, 357),
(57, 'CZ', 'CZECH REPUBLIC', 'Czech Republic', 'CZE', 203, 420),
(58, 'DK', 'DENMARK', 'Denmark', 'DNK', 208, 45),
(59, 'DJ', 'DJIBOUTI', 'Djibouti', 'DJI', 262, 253),
(60, 'DM', 'DOMINICA', 'Dominica', 'DMA', 212, 1767),
(61, 'DO', 'DOMINICAN REPUBLIC', 'Dominican Republic', 'DOM', 214, 1809),
(62, 'EC', 'ECUADOR', 'Ecuador', 'ECU', 218, 593),
(63, 'EG', 'EGYPT', 'Egypt', 'EGY', 818, 20),
(64, 'SV', 'EL SALVADOR', 'El Salvador', 'SLV', 222, 503),
(65, 'GQ', 'EQUATORIAL GUINEA', 'Equatorial Guinea', 'GNQ', 226, 240),
(66, 'ER', 'ERITREA', 'Eritrea', 'ERI', 232, 291),
(67, 'EE', 'ESTONIA', 'Estonia', 'EST', 233, 372),
(68, 'ET', 'ETHIOPIA', 'Ethiopia', 'ETH', 231, 251),
(69, 'FK', 'FALKLAND ISLANDS (MALVINAS)', 'Falkland Islands (Malvinas)', 'FLK', 238, 500),
(70, 'FO', 'FAROE ISLANDS', 'Faroe Islands', 'FRO', 234, 298),
(71, 'FJ', 'FIJI', 'Fiji', 'FJI', 242, 679),
(72, 'FI', 'FINLAND', 'Finland', 'FIN', 246, 358),
(73, 'FR', 'FRANCE', 'France', 'FRA', 250, 33),
(74, 'GF', 'FRENCH GUIANA', 'French Guiana', 'GUF', 254, 594),
(75, 'PF', 'FRENCH POLYNESIA', 'French Polynesia', 'PYF', 258, 689),
(76, 'TF', 'FRENCH SOUTHERN TERRITORIES', 'French Southern Territories', NULL, NULL, 0),
(77, 'GA', 'GABON', 'Gabon', 'GAB', 266, 241),
(78, 'GM', 'GAMBIA', 'Gambia', 'GMB', 270, 220),
(79, 'GE', 'GEORGIA', 'Georgia', 'GEO', 268, 995),
(80, 'DE', 'GERMANY', 'Germany', 'DEU', 276, 49),
(81, 'GH', 'GHANA', 'Ghana', 'GHA', 288, 233),
(82, 'GI', 'GIBRALTAR', 'Gibraltar', 'GIB', 292, 350),
(83, 'GR', 'GREECE', 'Greece', 'GRC', 300, 30),
(84, 'GL', 'GREENLAND', 'Greenland', 'GRL', 304, 299),
(85, 'GD', 'GRENADA', 'Grenada', 'GRD', 308, 1473),
(86, 'GP', 'GUADELOUPE', 'Guadeloupe', 'GLP', 312, 590),
(87, 'GU', 'GUAM', 'Guam', 'GUM', 316, 1671),
(88, 'GT', 'GUATEMALA', 'Guatemala', 'GTM', 320, 502),
(89, 'GN', 'GUINEA', 'Guinea', 'GIN', 324, 224),
(90, 'GW', 'GUINEA-BISSAU', 'Guinea-Bissau', 'GNB', 624, 245),
(91, 'GY', 'GUYANA', 'Guyana', 'GUY', 328, 592),
(92, 'HT', 'HAITI', 'Haiti', 'HTI', 332, 509),
(93, 'HM', 'HEARD ISLAND AND MCDONALD ISLANDS', 'Heard Island and Mcdonald Islands', NULL, NULL, 0),
(94, 'VA', 'HOLY SEE (VATICAN CITY STATE)', 'Holy See (Vatican City State)', 'VAT', 336, 39),
(95, 'HN', 'HONDURAS', 'Honduras', 'HND', 340, 504),
(96, 'HK', 'HONG KONG', 'Hong Kong', 'HKG', 344, 852),
(97, 'HU', 'HUNGARY', 'Hungary', 'HUN', 348, 36),
(98, 'IS', 'ICELAND', 'Iceland', 'ISL', 352, 354),
(99, 'IN', 'INDIA', 'India', 'IND', 356, 91),
(100, 'ID', 'INDONESIA', 'Indonesia', 'IDN', 360, 62),
(101, 'IR', 'IRAN, ISLAMIC REPUBLIC OF', 'Iran, Islamic Republic of', 'IRN', 364, 98),
(102, 'IQ', 'IRAQ', 'Iraq', 'IRQ', 368, 964),
(103, 'IE', 'IRELAND', 'Ireland', 'IRL', 372, 353),
(104, 'IL', 'ISRAEL', 'Israel', 'ISR', 376, 972),
(105, 'IT', 'ITALY', 'Italy', 'ITA', 380, 39),
(106, 'JM', 'JAMAICA', 'Jamaica', 'JAM', 388, 1876),
(107, 'JP', 'JAPAN', 'Japan', 'JPN', 392, 81),
(108, 'JO', 'JORDAN', 'Jordan', 'JOR', 400, 962),
(109, 'KZ', 'KAZAKHSTAN', 'Kazakhstan', 'KAZ', 398, 7),
(110, 'KE', 'KENYA', 'Kenya', 'KEN', 404, 254),
(111, 'KI', 'KIRIBATI', 'Kiribati', 'KIR', 296, 686),
(112, 'KP', 'KOREA, DEMOCRATIC PEOPLE''S REPUBLIC OF', 'Korea, Democratic People''s Republic of', 'PRK', 408, 850),
(113, 'KR', 'KOREA, REPUBLIC OF', 'Korea, Republic of', 'KOR', 410, 82),
(114, 'KW', 'KUWAIT', 'Kuwait', 'KWT', 414, 965),
(115, 'KG', 'KYRGYZSTAN', 'Kyrgyzstan', 'KGZ', 417, 996),
(116, 'LA', 'LAO PEOPLE''S DEMOCRATIC REPUBLIC', 'Lao People''s Democratic Republic', 'LAO', 418, 856),
(117, 'LV', 'LATVIA', 'Latvia', 'LVA', 428, 371),
(118, 'LB', 'LEBANON', 'Lebanon', 'LBN', 422, 961),
(119, 'LS', 'LESOTHO', 'Lesotho', 'LSO', 426, 266),
(120, 'LR', 'LIBERIA', 'Liberia', 'LBR', 430, 231),
(121, 'LY', 'LIBYAN ARAB JAMAHIRIYA', 'Libyan Arab Jamahiriya', 'LBY', 434, 218),
(122, 'LI', 'LIECHTENSTEIN', 'Liechtenstein', 'LIE', 438, 423),
(123, 'LT', 'LITHUANIA', 'Lithuania', 'LTU', 440, 370),
(124, 'LU', 'LUXEMBOURG', 'Luxembourg', 'LUX', 442, 352),
(125, 'MO', 'MACAO', 'Macao', 'MAC', 446, 853),
(126, 'MK', 'MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF', 'Macedonia, the Former Yugoslav Republic of', 'MKD', 807, 389),
(127, 'MG', 'MADAGASCAR', 'Madagascar', 'MDG', 450, 261),
(128, 'MW', 'MALAWI', 'Malawi', 'MWI', 454, 265),
(129, 'MY', 'MALAYSIA', 'Malaysia', 'MYS', 458, 60),
(130, 'MV', 'MALDIVES', 'Maldives', 'MDV', 462, 960),
(131, 'ML', 'MALI', 'Mali', 'MLI', 466, 223),
(132, 'MT', 'MALTA', 'Malta', 'MLT', 470, 356),
(133, 'MH', 'MARSHALL ISLANDS', 'Marshall Islands', 'MHL', 584, 692),
(134, 'MQ', 'MARTINIQUE', 'Martinique', 'MTQ', 474, 596),
(135, 'MR', 'MAURITANIA', 'Mauritania', 'MRT', 478, 222),
(136, 'MU', 'MAURITIUS', 'Mauritius', 'MUS', 480, 230),
(137, 'YT', 'MAYOTTE', 'Mayotte', NULL, NULL, 269),
(138, 'MX', 'MEXICO', 'Mexico', 'MEX', 484, 52),
(139, 'FM', 'MICRONESIA, FEDERATED STATES OF', 'Micronesia, Federated States of', 'FSM', 583, 691),
(140, 'MD', 'MOLDOVA, REPUBLIC OF', 'Moldova, Republic of', 'MDA', 498, 373),
(141, 'MC', 'MONACO', 'Monaco', 'MCO', 492, 377),
(142, 'MN', 'MONGOLIA', 'Mongolia', 'MNG', 496, 976),
(143, 'MS', 'MONTSERRAT', 'Montserrat', 'MSR', 500, 1664),
(144, 'MA', 'MOROCCO', 'Morocco', 'MAR', 504, 212),
(145, 'MZ', 'MOZAMBIQUE', 'Mozambique', 'MOZ', 508, 258),
(146, 'MM', 'MYANMAR', 'Myanmar', 'MMR', 104, 95),
(147, 'NA', 'NAMIBIA', 'Namibia', 'NAM', 516, 264),
(148, 'NR', 'NAURU', 'Nauru', 'NRU', 520, 674),
(149, 'NP', 'NEPAL', 'Nepal', 'NPL', 524, 977),
(150, 'NL', 'NETHERLANDS', 'Netherlands', 'NLD', 528, 31),
(151, 'AN', 'NETHERLANDS ANTILLES', 'Netherlands Antilles', 'ANT', 530, 599),
(152, 'NC', 'NEW CALEDONIA', 'New Caledonia', 'NCL', 540, 687),
(153, 'NZ', 'NEW ZEALAND', 'New Zealand', 'NZL', 554, 64),
(154, 'NI', 'NICARAGUA', 'Nicaragua', 'NIC', 558, 505),
(155, 'NE', 'NIGER', 'Niger', 'NER', 562, 227),
(156, 'NG', 'NIGERIA', 'Nigeria', 'NGA', 566, 234),
(157, 'NU', 'NIUE', 'Niue', 'NIU', 570, 683),
(158, 'NF', 'NORFOLK ISLAND', 'Norfolk Island', 'NFK', 574, 672),
(159, 'MP', 'NORTHERN MARIANA ISLANDS', 'Northern Mariana Islands', 'MNP', 580, 1670),
(160, 'NO', 'NORWAY', 'Norway', 'NOR', 578, 47),
(161, 'OM', 'OMAN', 'Oman', 'OMN', 512, 968),
(162, 'PK', 'PAKISTAN', 'Pakistan', 'PAK', 586, 92),
(163, 'PW', 'PALAU', 'Palau', 'PLW', 585, 680),
(164, 'PS', 'PALESTINIAN TERRITORY, OCCUPIED', 'Palestinian Territory, Occupied', NULL, NULL, 970),
(165, 'PA', 'PANAMA', 'Panama', 'PAN', 591, 507),
(166, 'PG', 'PAPUA NEW GUINEA', 'Papua New Guinea', 'PNG', 598, 675),
(167, 'PY', 'PARAGUAY', 'Paraguay', 'PRY', 600, 595),
(168, 'PE', 'PERU', 'Peru', 'PER', 604, 51),
(169, 'PH', 'PHILIPPINES', 'Philippines', 'PHL', 608, 63),
(170, 'PN', 'PITCAIRN', 'Pitcairn', 'PCN', 612, 0),
(171, 'PL', 'POLAND', 'Poland', 'POL', 616, 48),
(172, 'PT', 'PORTUGAL', 'Portugal', 'PRT', 620, 351),
(173, 'PR', 'PUERTO RICO', 'Puerto Rico', 'PRI', 630, 1787),
(174, 'QA', 'QATAR', 'Qatar', 'QAT', 634, 974),
(175, 'RE', 'REUNION', 'Reunion', 'REU', 638, 262),
(176, 'RO', 'ROMANIA', 'Romania', 'ROM', 642, 40),
(177, 'RU', 'RUSSIAN FEDERATION', 'Russian Federation', 'RUS', 643, 70),
(178, 'RW', 'RWANDA', 'Rwanda', 'RWA', 646, 250),
(179, 'SH', 'SAINT HELENA', 'Saint Helena', 'SHN', 654, 290),
(180, 'KN', 'SAINT KITTS AND NEVIS', 'Saint Kitts and Nevis', 'KNA', 659, 1869),
(181, 'LC', 'SAINT LUCIA', 'Saint Lucia', 'LCA', 662, 1758),
(182, 'PM', 'SAINT PIERRE AND MIQUELON', 'Saint Pierre and Miquelon', 'SPM', 666, 508),
(183, 'VC', 'SAINT VINCENT AND THE GRENADINES', 'Saint Vincent and the Grenadines', 'VCT', 670, 1784),
(184, 'WS', 'SAMOA', 'Samoa', 'WSM', 882, 684),
(185, 'SM', 'SAN MARINO', 'San Marino', 'SMR', 674, 378),
(186, 'ST', 'SAO TOME AND PRINCIPE', 'Sao Tome and Principe', 'STP', 678, 239),
(187, 'SA', 'SAUDI ARABIA', 'Saudi Arabia', 'SAU', 682, 966),
(188, 'SN', 'SENEGAL', 'Senegal', 'SEN', 686, 221),
(189, 'CS', 'SERBIA AND MONTENEGRO', 'Serbia and Montenegro', NULL, NULL, 381),
(190, 'SC', 'SEYCHELLES', 'Seychelles', 'SYC', 690, 248),
(191, 'SL', 'SIERRA LEONE', 'Sierra Leone', 'SLE', 694, 232),
(192, 'SG', 'SINGAPORE', 'Singapore', 'SGP', 702, 65),
(193, 'SK', 'SLOVAKIA', 'Slovakia', 'SVK', 703, 421),
(194, 'SI', 'SLOVENIA', 'Slovenia', 'SVN', 705, 386),
(195, 'SB', 'SOLOMON ISLANDS', 'Solomon Islands', 'SLB', 90, 677),
(196, 'SO', 'SOMALIA', 'Somalia', 'SOM', 706, 252),
(197, 'ZA', 'SOUTH AFRICA', 'South Africa', 'ZAF', 710, 27),
(198, 'GS', 'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS', 'South Georgia and the South Sandwich Islands', NULL, NULL, 0),
(199, 'ES', 'SPAIN', 'Spain', 'ESP', 724, 34),
(200, 'LK', 'SRI LANKA', 'Sri Lanka', 'LKA', 144, 94),
(201, 'SD', 'SUDAN', 'Sudan', 'SDN', 736, 249),
(202, 'SR', 'SURINAME', 'Suriname', 'SUR', 740, 597),
(203, 'SJ', 'SVALBARD AND JAN MAYEN', 'Svalbard and Jan Mayen', 'SJM', 744, 47),
(204, 'SZ', 'SWAZILAND', 'Swaziland', 'SWZ', 748, 268),
(205, 'SE', 'SWEDEN', 'Sweden', 'SWE', 752, 46),
(206, 'CH', 'SWITZERLAND', 'Switzerland', 'CHE', 756, 41),
(207, 'SY', 'SYRIAN ARAB REPUBLIC', 'Syrian Arab Republic', 'SYR', 760, 963),
(208, 'TW', 'TAIWAN, PROVINCE OF CHINA', 'Taiwan, Province of China', 'TWN', 158, 886),
(209, 'TJ', 'TAJIKISTAN', 'Tajikistan', 'TJK', 762, 992),
(210, 'TZ', 'TANZANIA, UNITED REPUBLIC OF', 'Tanzania, United Republic of', 'TZA', 834, 255),
(211, 'TH', 'THAILAND', 'Thailand', 'THA', 764, 66),
(212, 'TL', 'TIMOR-LESTE', 'Timor-Leste', NULL, NULL, 670),
(213, 'TG', 'TOGO', 'Togo', 'TGO', 768, 228),
(214, 'TK', 'TOKELAU', 'Tokelau', 'TKL', 772, 690),
(215, 'TO', 'TONGA', 'Tonga', 'TON', 776, 676),
(216, 'TT', 'TRINIDAD AND TOBAGO', 'Trinidad and Tobago', 'TTO', 780, 1868),
(217, 'TN', 'TUNISIA', 'Tunisia', 'TUN', 788, 216),
(218, 'TR', 'TURKEY', 'Turkey', 'TUR', 792, 90),
(219, 'TM', 'TURKMENISTAN', 'Turkmenistan', 'TKM', 795, 7370),
(220, 'TC', 'TURKS AND CAICOS ISLANDS', 'Turks and Caicos Islands', 'TCA', 796, 1649),
(221, 'TV', 'TUVALU', 'Tuvalu', 'TUV', 798, 688),
(222, 'UG', 'UGANDA', 'Uganda', 'UGA', 800, 256),
(223, 'UA', 'UKRAINE', 'Ukraine', 'UKR', 804, 380),
(224, 'AE', 'UNITED ARAB EMIRATES', 'United Arab Emirates', 'ARE', 784, 971),
(225, 'GB', 'UNITED KINGDOM', 'United Kingdom', 'GBR', 826, 44),
(226, 'US', 'UNITED STATES', 'United States', 'USA', 840, 1),
(227, 'UM', 'UNITED STATES MINOR OUTLYING ISLANDS', 'United States Minor Outlying Islands', NULL, NULL, 1),
(228, 'UY', 'URUGUAY', 'Uruguay', 'URY', 858, 598),
(229, 'UZ', 'UZBEKISTAN', 'Uzbekistan', 'UZB', 860, 998),
(230, 'VU', 'VANUATU', 'Vanuatu', 'VUT', 548, 678),
(231, 'VE', 'VENEZUELA', 'Venezuela', 'VEN', 862, 58),
(232, 'VN', 'VIET NAM', 'Viet Nam', 'VNM', 704, 84),
(233, 'VG', 'VIRGIN ISLANDS, BRITISH', 'Virgin Islands, British', 'VGB', 92, 1284),
(234, 'VI', 'VIRGIN ISLANDS, U.S.', 'Virgin Islands, U.s.', 'VIR', 850, 1340),
(235, 'WF', 'WALLIS AND FUTUNA', 'Wallis and Futuna', 'WLF', 876, 681),
(236, 'EH', 'WESTERN SAHARA', 'Western Sahara', 'ESH', 732, 212),
(237, 'YE', 'YEMEN', 'Yemen', 'YEM', 887, 967),
(238, 'ZM', 'ZAMBIA', 'Zambia', 'ZMB', 894, 260),
(239, 'ZW', 'ZIMBABWE', 'Zimbabwe', 'ZWE', 716, 263),
(240, 'RS', 'SERBIA', 'Serbia', 'SRB', 688, 381),
(241, 'AP', 'ASIA PACIFIC REGION', 'Asia / Pacific Region', '0', 0, 0),
(242, 'ME', 'MONTENEGRO', 'Montenegro', 'MNE', 499, 382),
(243, 'AX', 'ALAND ISLANDS', 'Aland Islands', 'ALA', 248, 358),
(244, 'BQ', 'BONAIRE, SINT EUSTATIUS AND SABA', 'Bonaire, Sint Eustatius and Saba', 'BES', 535, 599),
(245, 'CW', 'CURACAO', 'Curacao', 'CUW', 531, 599),
(246, 'GG', 'GUERNSEY', 'Guernsey', 'GGY', 831, 44),
(247, 'IM', 'ISLE OF MAN', 'Isle of Man', 'IMN', 833, 44),
(248, 'JE', 'JERSEY', 'Jersey', 'JEY', 832, 44),
(249, 'XK', 'KOSOVO', 'Kosovo', '---', 0, 381),
(250, 'BL', 'SAINT BARTHELEMY', 'Saint Barthelemy', 'BLM', 652, 590),
(251, 'MF', 'SAINT MARTIN', 'Saint Martin', 'MAF', 663, 590),
(252, 'SX', 'SINT MAARTEN', 'Sint Maarten', 'SXM', 534, 1),
(253, 'SS', 'SOUTH SUDAN', 'South Sudan', 'SSD', 728, 211);

-- --------------------------------------------------------

--
-- Table structure for table `link`
--

CREATE TABLE IF NOT EXISTS `link` (
  `id` bigint(20) NOT NULL,
  `type` int(11) NOT NULL,
  `address` text NOT NULL,
  `port` int(11) NOT NULL,
  `token` text NOT NULL,
  `ios` int(11) NOT NULL DEFAULT '0',
  `userid` bigint(20) NOT NULL,
  `isp` text,
  `geo` int(11) DEFAULT NULL,
  `method` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `login_ip`
--

CREATE TABLE IF NOT EXISTS `login_ip` (
  `id` bigint(20) NOT NULL,
  `userid` bigint(20) NOT NULL,
  `ip` text NOT NULL,
  `datetime` bigint(20) NOT NULL,
  `type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mobile_verify`
--

CREATE TABLE IF NOT EXISTS `mobile_verify` (
  `id` bigint(20) NOT NULL,
  `mobile` text CHARACTER SET utf8,
  `code` text CHARACTER SET utf8,
  `expire_in` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `notice`
--

CREATE TABLE IF NOT EXISTS `notice` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `content` longtext NOT NULL,
  `content_cn` longtext,
  `markdown` longtext NOT NULL,
  `markdown_cn` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `id` bigint(20) NOT NULL,
  `close_date` bigint(20) DEFAULT NULL,
  `create_date` bigint(20) DEFAULT NULL,
  `is_auto` int(11) DEFAULT NULL,
  `notify_url` varchar(255) DEFAULT NULL,
  `order_id` varchar(255) DEFAULT NULL,
  `param` varchar(255) DEFAULT NULL,
  `pay_date` bigint(20) DEFAULT NULL,
  `pay_id` varchar(255) DEFAULT NULL,
  `pay_url` varchar(255) DEFAULT NULL,
  `price` decimal(12,2) DEFAULT NULL,
  `really_price` decimal(12,2) DEFAULT NULL,
  `return_url` varchar(255) DEFAULT NULL,
  `state` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL,
  `userid` bigint(20) DEFAULT NULL,
  `username` varchar(25) DEFAULT NULL,
  `total` decimal(12,2) DEFAULT NULL,
  `packagetype` varchar(2) DEFAULT NULL,
  `packagecart` int(5) DEFAULT NULL,
  `packageid` bigint(10) DEFAULT NULL,
  `packagexp` bigint(10) DEFAULT NULL,
  `coupon` text,
  `discount` decimal(12,2) DEFAULT NULL,
  `exp` bigint(20) DEFAULT NULL,
  `expdate` text,
  `amount` varchar(11) DEFAULT NULL,
  `wallet` text,
  `pending` varchar(11) DEFAULT NULL,
  `extra` decimal(12,2) NOT NULL DEFAULT '0.00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `package`
--

CREATE TABLE IF NOT EXISTS `package` (
  `id` bigint(20) NOT NULL,
  `type` varchar(25) DEFAULT NULL,
  `name` text,
  `cn_name` text,
  `content` text NOT NULL,
  `category` varchar(25) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `price` decimal(12,2) DEFAULT NULL,
  `expire_days` varchar(25) DEFAULT NULL,
  `allow_buy_count` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset`
--

CREATE TABLE IF NOT EXISTS `password_reset` (
  `id` int(11) NOT NULL,
  `email` varchar(32) NOT NULL,
  `token` varchar(128) NOT NULL,
  `init_time` int(11) NOT NULL,
  `expire_time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pay_qrcode`
--

CREATE TABLE IF NOT EXISTS `pay_qrcode` (
  `id` bigint(20) NOT NULL,
  `pay_url` varchar(255) DEFAULT NULL,
  `price` decimal(12,2) DEFAULT NULL,
  `type` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rule_list`
--

CREATE TABLE IF NOT EXISTS `rule_list` (
  `id` int(11) NOT NULL,
  `name` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `regex` longtext COLLATE utf8mb4_unicode_ci,
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

CREATE TABLE IF NOT EXISTS `rule_log` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `list_id` bigint(20) NOT NULL,
  `datetime` bigint(20) NOT NULL,
  `server_id` int(11) NOT NULL,
  `status` int(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `servers`
--

CREATE TABLE IF NOT EXISTS `servers` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `type` int(3) NOT NULL,
  `server` varchar(300) NOT NULL,
  `info` varchar(128) DEFAULT NULL,
  `status` varchar(128) DEFAULT NULL,
  `traffic_rate` float NOT NULL DEFAULT '1',
  `node_class` int(11) NOT NULL DEFAULT '0',
  `node_speedlimit` int(20) NOT NULL DEFAULT '0',
  `node_connector` int(11) NOT NULL DEFAULT '0',
  `node_bandwidth` bigint(20) NOT NULL DEFAULT '0',
  `node_heartbeat` bigint(20) NOT NULL DEFAULT '0',
  `node_ip` text,
  `node_group` int(11) NOT NULL DEFAULT '0',
  `online` tinyint(1) NOT NULL DEFAULT '1',
  `sort` int(3) NOT NULL DEFAULT '0',
  `method` varchar(50) NOT NULL DEFAULT 'aes-128-gcm',
  `mu_only` int(2) NOT NULL DEFAULT '1',
  `isrelay` int(3) NOT NULL DEFAULT '0',
  `relay` int(3) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `servers`
--

INSERT INTO `servers` (`id`, `name`, `type`, `server`, `info`, `status`, `traffic_rate`, `node_class`, `node_speedlimit`, `node_connector`, `node_bandwidth`, `node_heartbeat`, `node_ip`, `node_group`, `online`, `sort`, `method`, `mu_only`, `isrelay`, `relay`) VALUES
(1, 'Expired', 0, '8.8.8.8;port=443', 'GB', NULL, 0, -1, 0, 0, 0, 0, '127.0.0.1', 0, 0, 0, 'aes-128-gcm', 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `server_info`
--

CREATE TABLE IF NOT EXISTS `server_info` (
  `id` int(11) NOT NULL,
  `node_id` int(11) NOT NULL,
  `uptime` float NOT NULL,
  `load` varchar(32) NOT NULL,
  `log_time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `server_online_log`
--

CREATE TABLE IF NOT EXISTS `server_online_log` (
  `id` int(11) NOT NULL,
  `node_id` int(11) NOT NULL,
  `online_user` int(11) NOT NULL,
  `log_time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `setup`
--

CREATE TABLE IF NOT EXISTS `setup` (
  `id` int(25) NOT NULL,
  `title` text,
  `type` varchar(11) DEFAULT NULL,
  `content` text,
  `content_cn` text,
  `datetime` bigint(25) DEFAULT NULL,
  `status` int(2) NOT NULL DEFAULT '0',
  `url` text,
  `link` text,
  `icon` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `setup`
--

INSERT INTO `setup` (`id`, `title`, `type`, `content`, `content_cn`, `datetime`, `status`, `url`, `link`, `icon`) VALUES
(1, 'ClashForAndroid', '1', '', '', 1631802765, 1, '/download/Clash.apk', 'config=1', 'xpanel xpanel-clash'),
(2, 'AnXray', '1', '', NULL, 1627221354, 0, 'https://github.com/XTLS/AnXray/releases', 'anxray=1', 'icomoon icomoon-anxray'),
(3, 'V2rayNG', '1', '', NULL, 1627221316, 0, 'https://github.com/2dust/v2rayNG/releases', 'config=1', 'icomoon icomoon-v2rayng-new'),
(4, NULL, '1', NULL, NULL, NULL, 0, NULL, NULL, ''),
(5, 'ClashForWindows', '3', '', '', 1631802774, 1, '/download/Clash.exe', 'config=1', 'xpanel xpanel-clash'),
(6, 'V2rayN', '3', '', NULL, 1627221253, 0, '/download/v2rayN.zip', 'config=1', 'icomoon icomoon-v2rayn'),
(7, NULL, '3', NULL, NULL, NULL, 0, NULL, NULL, ''),
(8, NULL, '3', NULL, NULL, NULL, 0, NULL, NULL, ''),
(9, 'Shadowrocket', '2', '', '', 1631802784, 1, 'https://itunes.apple.com/us/app/shadowrocket/id932747118?mt=8', 'config=1', 'xpanel xpanel-shadowrocket'),
(10, 'QuantumultX', '2', '', NULL, 1627221126, 0, 'https://apps.apple.com/us/app/quantumult-x/id1443988620', 'quantumultx=1', 'xpanel xpanel-quantumultx'),
(11, NULL, '2', NULL, NULL, NULL, 0, NULL, NULL, ''),
(12, NULL, '2', NULL, NULL, NULL, 0, NULL, NULL, ''),
(13, 'ClashX', '4', '', '', 1631802795, 1, '/download/ClashX.dmg', 'config=1', 'xpanel xpanel-clash'),
(14, 'ClashForWindows(Mac)', '4', '', NULL, 1627379292, 0, '/download/Clash.dmg', 'clash=1', 'xpanel xpanel-clash'),
(15, NULL, '4', NULL, NULL, NULL, 0, NULL, NULL, ''),
(16, NULL, '4', NULL, NULL, NULL, 0, NULL, NULL, ''),
(17, 'Qv2ray', '5', '', '', 1631802803, 1, '/download/Qv2rayLinux.zip', 'config=1', 'icomoon icomoon-qv2ray'),
(18, 'ClashForWindows(Linux)', '5', '', NULL, 1627673297, 0, '/download/Clash.tar.gz', 'clash=1', 'xpanel xpanel-clash'),
(19, NULL, '5', NULL, NULL, NULL, 0, NULL, NULL, ''),
(20, NULL, '5', NULL, NULL, NULL, 0, NULL, NULL, ''),
(21, 'Openclash', '6', '', '', 1631802813, 1, '', 'config=1', 'xpanel xpanel-clash'),
(22, NULL, '6', NULL, NULL, NULL, 0, NULL, NULL, ''),
(23, NULL, '6', NULL, NULL, NULL, 0, NULL, NULL, ''),
(24, NULL, '6', NULL, NULL, NULL, 0, NULL, NULL, ''),
(25, 'TeamViewer (Windows)', '7', '', '', 1631802823, 1, 'https://dl.tvcdn.de/download/TeamViewer_Setup.exe', '', 'icomoon icomoon-teamviewer'),
(26, 'TeamViewer (Mac)', '7', '', '', 1628349861, 1, 'https://download.teamviewer.com/download/TeamViewer.dmg', '', 'icomoon icomoon-teamviewer'),
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

CREATE TABLE IF NOT EXISTS `telegram_session` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `type` int(11) DEFAULT NULL,
  `session_content` text,
  `datetime` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `telegram_tasks`
--

CREATE TABLE IF NOT EXISTS `telegram_tasks` (
  `id` int(11) unsigned NOT NULL,
  `type` int(8) NOT NULL COMMENT '任务类型',
  `status` int(2) NOT NULL DEFAULT '0' COMMENT '任务状态',
  `chatid` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT 'Telegram Chat ID',
  `messageid` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT 'Telegram Message ID',
  `content` text COLLATE utf8mb4_unicode_ci COMMENT '任务详细内容',
  `process` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '临时任务进度',
  `userid` int(11) NOT NULL DEFAULT '0' COMMENT '网站用户 ID',
  `tguserid` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT 'Telegram User ID',
  `executetime` bigint(20) NOT NULL COMMENT '任务执行时间',
  `datetime` bigint(20) NOT NULL COMMENT '任务产生时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Telegram 任务列表';

-- --------------------------------------------------------

--
-- Table structure for table `tmp_price`
--

CREATE TABLE IF NOT EXISTS `tmp_price` (
  `price` varchar(255) NOT NULL,
  `oid` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL,
  `user_name` varchar(128) CHARACTER SET utf8mb4 NOT NULL,
  `email` varchar(32) NOT NULL,
  `pass` varchar(256) NOT NULL,
  `passwd` varchar(16) NOT NULL,
  `method` varchar(50) NOT NULL DEFAULT 'aes-128-gcm',
  `uuid` text COMMENT 'uuid',
  `mobile` varchar(20) DEFAULT NULL,
  `t` int(11) NOT NULL DEFAULT '0',
  `u` bigint(20) NOT NULL,
  `d` bigint(20) NOT NULL,
  `transfer_enable` bigint(20) NOT NULL,
  `forbidden_ip` varchar(182) DEFAULT '',
  `forbidden_port` longtext,
  `enable` tinyint(4) NOT NULL DEFAULT '1',
  `reg_date` datetime NOT NULL,
  `money` decimal(12,2) NOT NULL,
  `expire_time` int(11) NOT NULL DEFAULT '0',
  `reg_ip` varchar(128) NOT NULL DEFAULT '127.0.0.1',
  `node_speedlimit` int(20) NOT NULL DEFAULT '0',
  `node_connector` int(11) NOT NULL DEFAULT '0',
  `is_admin` int(2) NOT NULL DEFAULT '0',
  `last_day_t` bigint(20) NOT NULL DEFAULT '0',
  `class` int(11) NOT NULL DEFAULT '0',
  `expire_in` datetime NOT NULL DEFAULT '2099-06-04 00:05:00',
  `remark` text,
  `node_group` int(11) NOT NULL DEFAULT '0',
  `reset_day` int(11) NOT NULL DEFAULT '0',
  `reset_bandwidth` decimal(12,2) NOT NULL DEFAULT '0.00',
  `telegram_id` bigint(20) DEFAULT NULL,
  `telegram_name` varchar(25) DEFAULT NULL,
  `expire_notified` tinyint(1) NOT NULL DEFAULT '0',
  `traffic_notified` tinyint(1) NOT NULL DEFAULT '0',
  `afflink` varchar(25) DEFAULT NULL,
  `notification` int(3) NOT NULL DEFAULT '1',
  `ref_by` int(11) NOT NULL DEFAULT '0',
  `notice_status` int(10) NOT NULL DEFAULT '0',
  `notice_id` text,
  `onlineips` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `user_subscribe_log`
--

CREATE TABLE IF NOT EXISTS `user_subscribe_log` (
  `id` int(11) unsigned NOT NULL,
  `user_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
  `user_id` int(11) NOT NULL COMMENT '用户 ID',
  `email` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户邮箱',
  `subscribe_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '获取的订阅类型',
  `request_ip` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '请求 IP',
  `request_time` datetime NOT NULL COMMENT '请求时间',
  `request_user_agent` text COLLATE utf8mb4_unicode_ci COMMENT '请求 UA 信息'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户订阅日志';

-- --------------------------------------------------------

--
-- Table structure for table `user_token`
--

CREATE TABLE IF NOT EXISTS `user_token` (
  `id` int(11) NOT NULL,
  `token` varchar(256) NOT NULL,
  `user_id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `expire_time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_traffic_log`
--

CREATE TABLE IF NOT EXISTS `user_traffic_log` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `u` bigint(20) NOT NULL,
  `d` bigint(20) NOT NULL,
  `node_id` int(11) NOT NULL,
  `rate` float NOT NULL,
  `traffic` varchar(32) NOT NULL,
  `log_time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

CREATE TABLE IF NOT EXISTS `onlineip` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `email` varchar(250) NOT NULL,
  `ip` longtext NOT NULL,
  `datetime` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `onlineip`
  ADD PRIMARY KEY (`id`);
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
-- Indexes for table `bought`
--
ALTER TABLE `bought`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `captcha`
--
ALTER TABLE `captcha`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

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
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `coupon`
--
ALTER TABLE `coupon`
  ADD PRIMARY KEY (`id`);


--
-- Indexes for table `email_verify`
--
ALTER TABLE `email_verify`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `isocodes`
--
ALTER TABLE `isocodes`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `mobile_verify`
--
ALTER TABLE `mobile_verify`
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
-- Indexes for table `pay_qrcode`
--
ALTER TABLE `pay_qrcode`
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
-- Indexes for table `telegram_tasks`
--
ALTER TABLE `telegram_tasks`
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

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1;
--
-- AUTO_INCREMENT for table `alive_ip`
--
ALTER TABLE `alive_ip`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bought`
--
ALTER TABLE `bought`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `captcha`
--
ALTER TABLE `captcha`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `commission`
--
ALTER TABLE `commission`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1;
--
-- AUTO_INCREMENT for table `coupon`
--
ALTER TABLE `coupon`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_verify`
--
ALTER TABLE `email_verify`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `isocodes`
--
ALTER TABLE `isocodes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1;
--
-- AUTO_INCREMENT for table `link`
--
ALTER TABLE `link`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `login_ip`
--
ALTER TABLE `login_ip`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mobile_verify`
--
ALTER TABLE `mobile_verify`
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
-- AUTO_INCREMENT for table `pay_qrcode`
--
ALTER TABLE `pay_qrcode`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `rule_list`
--
ALTER TABLE `rule_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1;
--
-- AUTO_INCREMENT for table `rule_log`
--
ALTER TABLE `rule_log`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `servers`
--
ALTER TABLE `servers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1;
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
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1;
--
-- AUTO_INCREMENT for table `telegram_session`
--
ALTER TABLE `telegram_session`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `telegram_tasks`
--
ALTER TABLE `telegram_tasks`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1;
--
-- AUTO_INCREMENT for table `user_subscribe_log`
--
ALTER TABLE `user_subscribe_log`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
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
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

ALTER TABLE `servers` ADD `node_bandwidth_limit` BIGINT(20) NOT NULL DEFAULT '0' AFTER `node_bandwidth`, ADD `bandwidthlimit_resetday` INT(5) NOT NULL DEFAULT '0' AFTER `node_bandwidth_limit`;
