[general]
geo_location_checker=http://ip-api.com/json/?lang=EN, https://raw.githubusercontent.com/frainzy1477/QuantumultX/master/Scripts/IP_API.js
server_check_url=http://www.gstatic.com/generate_204
server_check_url=http://captive.apple.com/
dns_exclusion_list = *.cmbchina.com, *.cmpassport.com, *.jegotrip.com.cn, *.icitymobile.mobi, *.pingan.com.cn, id6.me
resource_parser_url=https://raw.githubusercontent.com/KOP-XIAO/QuantumultX/master/Scripts/resource-parser.js
excluded_routes=10.0.0.0/8, 127.0.0.0/8, 169.254.0.0/16, 192.0.2.0/24, 192.168.0.0/16, 198.51.100.0/24, 224.0.0.0/4

;ssid_suspended_list=Sophisticated, Sophisticated
;udp_whitelist=53, 123, 1900, 80-443

[dns]
server=8.8.8.8
server=8.8.4.4
server=1.0.0.1
server=1.1.1.1
server=114.114.114.114
server=223.5.5.5
server=119.29.29.29
server=/*.taobao.com/223.5.5.5
server=/*.tmall.com/223.5.5.5
server=/*.alipay.com/223.5.5.5
server=/*.alicdn.com/223.5.5.5
server=/*.aliyun.com/223.5.5.5
server=/*.jd.com/119.28.28.28
server=/*.qq.com/119.28.28.28
server=/*.tencent.com/119.28.28.28
server=/*.weixin.com/119.28.28.28
server=/*.bilibili.com/119.29.29.29
server=/hdslb.com/119.29.29.29
server=/*.163.com/119.29.29.29
server=/*.126.com/119.29.29.29
server=/*.126.net/119.29.29.29
server=/*.127.net/119.29.29.29
server=/*.netease.com/119.29.29.29
server=/*.mi.com/119.29.29.29
server=/*.xiaomi.com/119.29.29.29

[policy]
static=AdBlock, reject, direct, img-url=https://raw.githubusercontent.com/frainzy1477/Qure/master/IconSet/Color/AdBlack.png
static=Apple, direct, Outside, img-url=https://raw.githubusercontent.com/frainzy1477/Qure/master/IconSet/Color/Apple.png
static=CMedia, direct, proxy, img-url=https://raw.githubusercontent.com/frainzy1477/RULES_2/master/QuantumultX/IconSet/CMedia.png
static=GMedia, Outside, direct, img-url=https://raw.githubusercontent.com/frainzy1477/RULES_2/master/QuantumultX/IconSet/GMedia.png
static=Netflix, Outside, direct, img-url=https://raw.githubusercontent.com/frainzy1477/Qure/master/IconSet/Color/Netflix.png
static=YouTube, Outside, direct, img-url=https://raw.githubusercontent.com/frainzy1477/Qure/master/IconSet/Color/YouTube.png
static=Microsoft, direct, Outside, img-url=https://raw.githubusercontent.com/frainzy1477/RULES_2/master/QuantumultX/IconSet/Microsoft.png
static=PayPal, Outside, direct, img-url=https://raw.githubusercontent.com/frainzy1477/Qure/master/IconSet/Color/PayPal.png
static=Outside, proxy, direct, img-url=https://raw.githubusercontent.com/frainzy1477/RULES_2/master/QuantumultX/IconSet/Outside.png
static=Mainland, direct, proxy, img-url=https://raw.githubusercontent.com/frainzy1477/RULES_2/master/QuantumultX/IconSet/Mainland.png
static=Speedtest, Outside, direct, img-url=https://raw.githubusercontent.com/frainzy1477/Qure/master/IconSet/Color/Speedtest.png
static=Others, Outside, direct, img-url=https://raw.githubusercontent.com/frainzy1477/RULES_2/master/QuantumultX/IconSet/Others.png

[server_remote]



[filter_remote]
https://raw.githubusercontent.com/frainzy1477/RULES_2/master/QuantumultX/Filter/AdBlock.list, tag=AdBlock (Stick Rules), enabled=true
https://raw.githubusercontent.com/frainzy1477/RULES_2/master/QuantumultX/Filter/Apple.list, tag=Apple (Stick Rules), enabled=true
https://raw.githubusercontent.com/frainzy1477/RULES_2/master/QuantumultX/Filter/CMedia.list, tag=CMedia (Stick Rules), enabled=true
https://raw.githubusercontent.com/frainzy1477/RULES_2/master/QuantumultX/Filter/GMedia.list, tag=GMedia (Stick Rules), enabled=true
https://raw.githubusercontent.com/frainzy1477/RULES_2/master/QuantumultX/Filter/Netflix.list, tag=Netflix (Stick Rules), enabled=true
https://raw.githubusercontent.com/frainzy1477/RULES_2/master/QuantumultX/Filter/YouTube.list, tag=YouTube (Stick Rules), enabled=true
https://raw.githubusercontent.com/frainzy1477/RULES_2/master/QuantumultX/Filter/Microsoft.list, tag=Microsoft (Stick Rules), enabled=true
https://raw.githubusercontent.com/frainzy1477/RULES_2/master/QuantumultX/Filter/PayPal.list, tag=PayPal (Stick Rules), enabled=true
https://raw.githubusercontent.com/frainzy1477/RULES_2/master/QuantumultX/Filter/Outside.list, tag=Outside (Stick Rules), enabled=true
https://raw.githubusercontent.com/frainzy1477/RULES_2/master/QuantumultX/Filter/Mainland.list, tag=Mainland (Stick Rules), enabled=true
https://raw.githubusercontent.com/frainzy1477/RULES_2/master/QuantumultX/Filter/Speedtest.list, tag=Speedtest (Stick Rules), enabled=true
https://raw.githubusercontent.com/frainzy1477/RULES_2/master/QuantumultX/Filter/LAN.list, tag=LAN (Stick Rules), enabled=true

[rewrite_remote]
;https://raw.githubusercontent.com/frainzy1477/Profiles/master/Quantumult/X/Rewrite.conf, tag=Rewrite (ConnersHua), enabled=true
;https://raw.githubusercontent.com/frainzy1477/Profiles/master/Quantumult/X/rewritte, tag=Rewrite (lhie1), enabled=false
;https://raw.githubusercontent.com/NobyDa/Script/master/QuantumultX/Rewrite_lhie1.conf, tag=Rewrite (lhie1), enabled=false
https://raw.githubusercontent.com/eHpo1/Rules/master/QuantumultX/Rewrite.txt, tag=eHpo1-ads, enabled=true
https://raw.githubusercontent.com/nzw9314/QuantumultX/master/Q-Search_All_in_one.conf, tag=Q-Search, enabled=true
https://raw.githubusercontent.com/nzw9314/QuantumultX/master/Js_local_WorkingCopy.conf, tag=nzw9314, enabled=true
https://raw.githubusercontent.com/nzw9314/QuantumultX/master/Get_Cookie_New.conf, tag=nzw9314-Cookie, enabled=true


[server_local]
{$proxys['server']}

[filter_local]
ip-cidr, 10.0.0.0/8, direct
ip-cidr, 127.0.0.0/8, direct
ip-cidr, 172.16.0.0/12, direct
ip-cidr, 192.168.0.0/16, direct
ip-cidr, 224.0.0.0/24, direct
geoip, cn, direct
final,Outside

[rewrite_local]
https?://www\.zhihu\.com/question/ url request-header (\r\n)User-Agent:.+(\r\n) request-header $1User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36$2

^https?://mjappaz.yefu365.com/index.php/app/ios/ url script-response-body https://meetagit.github.io/MeetaRules/Surge/Scripting/aimeiju.js
^https?:\/\/mp\.weixin\.qq\.com\/mp\/getappmsgad url script-response-body https://Choler.github.io/Surge/Script/WeChat.js
^https?:\/\/i.weread.qq.com\/pay url script-response-body https://raw.githubusercontent.com/yxiaocai/quanx/master/js/iweread.js
^http://ctrl.playcvn.com/app/(init|ads) url script-response-body https://raw.githubusercontent.com/KOP-XIAO/QuantumultX/master/Scripts/YYeTs.js
;^https:\/\/api\.rr\.tv\/.*(profile|Medal) url script-response-body https://Choler.github.io/Surge/Script/RRtv.js
;^https:\/\/api\.rr\.tv\/.*(channel|Choice|Feed) url script-response-body https://Choler.github.io/Surge/Script/RRtv-ad.js
;^https://api.zhihu.com/topstory/follow url script-response-body https://raw.githubusercontent.com/onewayticket255/Surge-Script/master/surge%20zhihu%20feed.js
;^https://api.zhihu.com/topstory/recommend url script-response-body https://raw.githubusercontent.com/onewayticket255/Surge-Script/master/surge%20zhihu%20recommend.js
;^https://api.zhihu.com/.*/questions url script-response-body https://raw.githubusercontent.com/onewayticket255/Surge-Script/master/surge%20zhihu%20answer.js
;^https://api.zhihu.com/market/header url script-response-body https://raw.githubusercontent.com/onewayticket255/Surge-Script/master/surge%20zhihu%20market.js
;^https://app.bilibili.com/x/resource/show/tab url script-response-body https://raw.githubusercontent.com/onewayticket255/Surge-Script/master/surge%20bilibili%20tab.js
;^https://app.bilibili.com/x/v2/feed url script-response-body https://raw.githubusercontent.com/onewayticket255/Surge-Script/master/surge%20bilibili%20feed.js
;^https://app.bilibili.com/x/v2/account/mine url script-response-body https://raw.githubusercontent.com/onewayticket255/Surge-Script/master/surge%20bilibili%20account.js
;^https://app.bilibili.com/x/v2/view\?access_key url script-response-body https://raw.githubusercontent.com/onewayticket255/Surge-Script/master/surge%20bilibili%20view%20relate.js
;^https://app.bilibili.com/x/v2/rank url script-response-body https://raw.githubusercontent.com/onewayticket255/Surge-Script/master/surge%20bilibili%20rank.js
(?<=(carrier|account|sys)_region=)CN url 307 HK
(.*video_id=\w{32})(.*watermark=)(.*) url 302 $1
^https:\/\/[\s\S]*\/v1\/(aweme\/)?(feed|post)\/ url script-response-body https://Choler.github.io/Surge/Script/Aweme.js
^https:\/\/[\s\S]*\/aweme\/v1\/play\/\?video url script-response-body https://raw.githubusercontent.com/KOP-XIAO/QuantumultX/master/Amark.js
;^https://www\.tianqiapi\.com/ url script-response-body https://raw.githubusercontent.com/KOP-XIAO/QuantumultX/master/Scripts/weather.js
^https?://(api|mapi).weibo.(cn|com)/2(/groups/timeline|/statuses/unread|/statuses/extend|/comments/build_comments|/photo/recommend_list|/stories/video_stream|/statuses/positives/get|/stories/home_list|/profile/statuses|/statuses/friends/timeline|/service/picfeed) url script-response-body https://raw.githubusercontent.com/yichahucha/surge/master/wb_ad.js
^https?://(sdk|wb)app.uve.weibo.com(/interface/sdk/sdkad.php|/wbapplua/wbpullad.lua) url script-response-body https://raw.githubusercontent.com/yichahucha/surge/master/wb_launch.js
^https:\/\/twitter\.com\/ url 302 tweetbot://
^https://github.com/(Dreamacro|yichengchen|lhie1|ccg2018|SukkaW)/(clash|clashX|Rules|ClashA|Koolshare-Clash)$ url 302 https://github.com/$1/$2/tree/master

#google
^https?://(www.)?g.cn url 302 https://www.google.com
^https?://(www.)?google.cn url 302 https://www.google.com
^https?://(www.)?google.cn/search url 302 https://www.google.com/search
^https?://coupon.m.jd.com/ url 302 https://coupon.m.jd.com/
^https?://h5.m.jd.com/ url 302 https://h5.m.jd.com/
^https?://item.m.jd.com/ url 302 https://item.m.jd.com/
^https?://m.jd.com url 302 https://m.jd.com
^https?://newcz.m.jd.com/ url 302 https://newcz.m.jd.com/
^https?://p.m.jd.com/ url 302 https://p.m.jd.com/
^https?://so.m.jd.com/ url 302 https://so.m.jd.com/
# Redirect HTTP to HTTPS
^https?:\/\/(www.)?taobao\.com\/ url 302 https://taobao.com/
^https?:\/\/(www.)?jd\.com\/ url 302 https://www.jd.com/
^https?:\/\/(www.)?mi\.com\/ url 302 https://www.mi.com/
^https?:\/\/you\.163\.com\/ url 302 https://you.163.com/
^https?:\/\/(www.)?suning\.com/ url 302 https://suning.com/
^https?:\/\/(www.)?yhd\.com url 302 https://yhd.com/

# Redirect False to True
# > IGN China to IGN Global
^https?:\/\/(www.)?ign\.xn--fiqs8s\/ url 302 http://cn.ign.com/ccpref/us
# > Fake Website Made By Makeding
^https?:\/\/(www.)?abbyychina\.com\/ url 302 http://www.abbyy.cn/
^https?:\/\/(www.)?bartender\.cc\/ url 302 https://cn.seagullscientific.com
^https?:\/\/(www.)?betterzip\.net\/ url 302 https://macitbetter.com/
^https?:\/\/(www.)?beyondcompare\.cc\/ url 302 https://www.scootersoftware.com/
^https?:\/\/(www.)?bingdianhuanyuan\.cn\/ url 302 http://www.faronics.com/zh-hans/
^https?:\/\/(www.)?chemdraw\.com\.cn\/ url 302 http://www.cambridgesoft.com/
^https?:\/\/(www.)?codesoftchina\.com\/ url 302 https://www.teklynx.com/
^https?:\/\/(www.)?coreldrawchina\.com\/ url 302 https://www.coreldraw.com/cn/
^https?:\/\/(www.)?crossoverchina\.com\/ url 302 https://www.codeweavers.com/
^https?:\/\/(www.)?easyrecoverychina\.com\/ url 302 https://www.ontrack.com/
^https?:\/\/(www.)?ediuschina\.com\/ url 302 https://www.grassvalley.com/
^https?:\/\/(www.)?flstudiochina\.com\/ url 302 https://www.image-line.com/flstudio/
^https?:\/\/(www.)?formysql\.com\/ url 302 https://www.navicat.com.cn
^https?:\/\/(www.)?guitarpro\.cc\/ url 302 https://www.guitar-pro.com/
^https?:\/\/(www.)?huishenghuiying\.com\.cn\/ url 302 https://www.corel.com/cn/
^https?:\/\/(www.)?iconworkshop\.cn\/ url 302 https://www.axialis.com/iconworkshop/
^https?:\/\/(www.)?imindmap\.cc\/ url 302 https://imindmap.com/zh-cn/
^https?:\/\/(www.)?jihehuaban\.com\.cn\/ url 302 https://sketch.io/
^https?:\/\/(www.)?keyshot\.cc\/ url 302 https://www.keyshot.com/
^https?:\/\/(www.)?mathtype\.cn\/ url 302 http://www.dessci.com/en/products/mathtype/
^https?:\/\/(www.)?mindmanager\.cc\/ url 302 https://www.mindjet.com/
^https?:\/\/(www.)?mindmapper\.cc\/ url 302 https://mindmapper.com
^https?:\/\/(www.)?mycleanmymac\.com\/ url 302 https://macpaw.com/cleanmymac
^https?:\/\/(www.)?nicelabel\.cc\/ url 302 https://www.nicelabel.com/
^https?:\/\/(www.)?ntfsformac\.cc\/ url 302 https://www.tuxera.com/products/tuxera-ntfs-for-mac-cn/
^https?:\/\/(www.)?ntfsformac\.cn\/ url 302 https://www.paragon-software.com/ufsdhome/zh/ntfs-mac/
^https?:\/\/(www.)?overturechina\.com\/ url 302 https://sonicscores.com/overture/
^https?:\/\/(www.)?passwordrecovery\.cn\/ url 302 https://cn.elcomsoft.com/aopr.html
^https?:\/\/(www.)?pdfexpert\.cc\/ url 302 https://pdfexpert.com/zh
^https?:\/\/(www.)?ultraiso\.net\/ url 302 https://cn.ezbsystems.com/ultraiso/
^https?:\/\/(www.)?vegaschina\.cn\/ url 302 https://www.vegas.com/
^https?:\/\/(www.)?xmindchina\.net\/ url 302 https://www.xmind.cn/
^https?:\/\/(www.)?xshellcn\.com\/ url 302 https://www.netsarang.com/products/xsh_overview.html
^https?:\/\/(www.)?yuanchengxiezuo\.com\/ url 302 https://www.teamviewer.com/zhcn/
^https?:\/\/(www.)?zbrushcn\.com\/ url 302 http://pixologic.com/


# Advertising Block
^https?:\/\/a\.applovin\.com\/3\.0\/ad url reject
^https?:\/\/app\.58\.com\/api\/home\/advertising\/ url reject
^https?:\/\/app\.58\.com\/api\/home\/appadv\/ url reject
^https?:\/\/app\.58\.com\/api\/home\/invite\/popupAdv url reject
^https?:\/\/app\.58\.com\/api\/log\/ url reject
^https?:\/\/.+\.58cdn\.com\.cn\/brandads\/ url reject

# A
# > Alibaba
^https?:\/\/acs\.m\.taobao\.com\/gw\/mtop\.taobao\.idle\.home\.welcome\/ url reject
^https?:\/\/acs\.m\.taobao\.com\/gw\/mtop\.trip\.activity\.querytmsresources\/ url reject
^https?:\/\/acs\.m\.taobao\.com\/gw\/mtop\.film\.mtopadvertiseapi\.queryadvertise\/ url reject
^https?:\/\/render\.alipay\.com\/p\/s\/h5data\/prod\/spring-festival-2019-h5data\/popup-h5data\.json url reject
^https?:\/\/acs\.m\.taobao\.com\/gw\/mtop\.o2o\.ad\.gateway\.get\/ url reject
# >> UC
^https?:\/\/huichuan\.sm\.cn\/jsad url reject
^https?:\/\/iflow\.uczzd\.cn\/log\/ url reject
# >> AMap
^https?:\/\/m\d{1}\.amap\.com\/ws\/valueadded\/alimama\/splash_screen\/ url reject
# > AcFun
^https?:\/\/aes\.acfun\.cn\/s\?adzones url reject
^https?:\/\/gw\.aihuishou\.com\/app-portal\/home\/getadvertisement url reject
# > APICloud
^https?:\/\/a\.apicloud\.com\/start_page\/ url reject

# B
# > Baidu
^https?:\/\/update\.pan\.baidu\.com\/statistics url reject
^https?:\/\/issuecdn\.baidupcs\.com\/issue\/netdisk\/guanggao\/ url reject
^https?:\/\/cover.baidu.com\/cover\/page\/dspSwitchAds\/ url reject
^https?:\/\/c\.tieba\.baidu\.com\/c\/s\/splashSchedule url reject
^https?:\/\/.+\/client\/phpui2\/ url reject
# > ByteDance
^https?:\/\/.+\.pstatp\.com\/img\/ad url reject
^https?:\/\/.+\.(musical|snssdk)\.(com|ly)\/(api|motor)\/ad\/ url reject
^https?:\/\/dsp\.toutiao\.com\/api\/xunfei\/ads\/ url reject
^https?:\/\/.+\.snssdk\.com\/motor\/operation\/activity\/display\/config\/V2\/ url reject
# > bilibili
^https?:\/\/app\.bilibili\.com\/x\/v2\/splash\/ url reject
^https?:\/\/www\.myhug\.cn\/ad\/ url reject
^https?:\/\/7n\.bczcdn\.com\/launchad\/ url reject
^https?:\/\/channel\.beitaichufang\.com\/channel\/api\/v1\/promote\/ios\/start\/page url reject
^https?:\/\/iapi\.bishijie\.com\/actopen\/advertising\/ url reject
^https?:\/\/app\.api\.ke\.com\/config\/config\/bootpage url reject

# C
# > China CITIC Bank
^https?:\/\/creditcard\.ecitic\.com\/citiccard\/wtk\/piwik\/piwik\.php url reject
# > China Merchants Bank
^https?:\/\/mlife\.cmbchina\.com/ClientFaceService\/preCacheAdvertise\.json url reject
^https?:\/\/mlife\.cmbchina\.com\/ClientFaceService\/getAdvertisement\.json url reject
# > China Minsheng Bank
^https?:\/\/www\.cmbc\.com\.cn\/m\/image\/loadingpage\/ url reject
# > China Guangfa Bank
^https?:\/\/mps\.95508\.com\/mps\/club\/cardPortals\/adv\/\d{25}\.(png|jpg) url reject
# > China Mobile
^https?:\/\/app\.10086\.cn\/biz-orange\/DN\/(findSale|homeSale)\/getsaleAdver url reject
# > China Unicom
^https?:\/\/m\.client\.10010\.com\/mobileService\/customer\/accountListData\.htm url reject
^https?:\/\/m\.client\.10010\.com\/uniAdmsInterface\/getWelcomeAd url reject
# > CNTV
^https?:\/\/cntv\.hls\.cdn\.myqcloud\.com\/.+\?maxbr=850 url reject
^https?:\/\/asp\.cntv\.myalicdn\.com\/.+\?maxbr=850 url reject
^https?:\/\/www\.cntv\.cn\/nettv\/adp\/ url reject
^https?:\/\/v\.cctv\.com\/.+850 url reject
^https?:\/\/(api|atrace)\.chelaile\.net\.cn\/adpub\/ url reject
^https?:\/\/api\.chelaile\.net\.cn\/goocity\/advert\/ url reject
^https?:\/\/atrace\.chelaile\.net\.cn\/exhibit\?&adv_image url reject
^https?:\/\/pic1\.chelaile\.net\.cn\/adv\/ url reject
^https?:\/\/cap\.caocaokeji\.cn\/advert-bss\/ url reject
# > CamScanner
^https?:\/\/api\.intsig\.net\/user\/cs\/operating\/app\/get_startpic\/ url reject

# ^https?:\/\/.+\/v2\/app_ads\/ url reject
# ^https?:\/\/.+\/api\/v2\/movie\/.+/ad\? url reject
# ^https?:\/\/erebor\.douban\.com\/count\/\?ad= url reject
^https?:\/\/img\d{1}\.doubanio\.com\/view\/dale-online\/dale_ad/ url reject
# ^https?:\/\/frodo\.douban\.com\/api\/v2\/movie\/ad url reject

^https?:\/\/rtbapi\.douyucdn\.cn\/japi\/sign\/app\/getinfo url reject
^https?:\/\/mapi\.dangdang\.com\/index\.php\?action=init url reject
^https?:\/\/api\.daydaycook\.com\.cn\/daydaycook\/server\/ad\/ url reject
^https?:\/\/cms\.daydaycook\.com\.cn\/api\/cms\/advertisement\/ url reject
^https?:\/\/www\.dandanzan\.com\/res\/gdsefse\.js url reject

# E
# > eLong(123.59.31.1,119.18.193.135)
^https?:\/\/mobile-api2011\.elong\.com\/(adgateway|adv)\/ url reject

# F
# > Foodie
^https?:\/\/foodie-api\.yiruikecorp\.com\/v1\/(banner|notice)\/overview url reject
# > FOTOABLE
^https?:\/\/cdn\.api\.fotoable\.com\/Advertise\/ url reject
^https?:\/\/www\.flyertea\.com\/source\/plugin\/mobile\/mobile\.php\?module=advis url reject

# G
# > Google
#^https?:\/\/.+\.googlevideo\.com\/.+&oad url reject
#^https?:\/\/.+\.googlevideo\.com\/.+ctier url reject
^https?:\/\/youtubei\.googleapis\.com\/youtubei\/.+ad_ url reject
^https?:\/\/youtubei\.googleapis\.com\/youtubei\/.+log_ url reject
^https?:\/\/.+\.youtube\.com\/get_midroll_ url reject
^https?:\/\/premiumyva\.appspot\.com\/vmclickstoadvertisersite url reject
^https?:\/\/.+\.youtube\.com\/api\/stats\/ads url reject
^https?:\/\/.+\.youtube\.com\/api\/stats\/.+adformat url reject
^https?:\/\/.+\.youtube\.com\/pagead\/ url reject
^https?:\/\/.+\.youtube\.com\/ptracking url reject

# > Gofun
^https?:\/\/gateway\.shouqiev\.com\/fsda\/app\/bootImage\.json url reject
^https?:\/\/m\.ibuscloud.com\/v2\/app\/getStartPage url reject
^https?:\/\/smkmp\.96225.com\/smkcenter\/ad/ url reject
^https?:\/\/games\.mobileapi\.hupu\.com\/.+\/status\/init url reject
^https?:\/\/games\.mobileapi\.hupu\.com\/.+\/(interfaceAdMonitor|interfaceAd)\/ url reject
^https?:\/\/47\.97\.20\.12\/ad\/ url reject

# > iFlytek
^https?:\/\/imeclient\.openspeech\.cn\/adservice\/ url reject
# > iQiyi
^https?:\/\/iface\.iqiyi\.com\/api\/getNewAdInfo url reject
^https?:\/\/.+\/(mixer|track2)\? url reject
^https?:\/\/act\.vip\.iqiyi\.com\/interact\/api\/show.do url reject
^https?:\/\/act\.vip\.iqiyi\.com\/interact\/api\/v2\/show url reject

# J
# > JD
^https?:\/\/api\.m\.jd.com\/client\.action\?functionId=start url reject
^https?:\/\/(bdsp-x|dsp-x)\.jd\.com\/adx\/ url reject
^https?:\/\/ms\.jr\.jd\.com\/gw\/generic\/base\/na\/m\/adInfo url reject
# > JiemianNews
^https?:\/\/img\.jiemian\.com\/ads\/ url reject
^https?:\/\/api\.jxedt\.com\/ad\/ url reject
^https?:\/\/richmanapi\.jxedt\.com\/api\/ad\/ url reject

# K
# > Keep
^https?:\/\/api\.gotokeep\.com\/ads\/ url reject
# > Kingsoft WPS
^https?:/\/\counter\.ksosoft.com\/ad\.php url reject
^https?:\/\/ios\.wps\.cn\/ad-statistics-service url reject
^https?:\/\/mobile-pic\.cache\.iciba\.com\/feeds_ad\/ url reject
^https?:\/\/.+\.kingsoft-office-service\.com\/ad url reject
# > Kingsoft PowerWord
^https?:\/\/counter\.ksosoft\.com\/ad\.php url reject
^https?:\/\/dict-mobile\.iciba\.com\/interface\/index\.php\?.+(c=ad|collectFeedsAdShowCount|KSFeedsAdCardViewController) url reject
^https?:\/\/service\.iciba\.com\/popo\/open\/screens\/v3\?adjson url reject
^https?:\/\/api\.kkmh\.com\/.+(ad|advertisement)\/ url reject


# L
# > Le
^https?:\/\/.+\/letv-gug\/ url reject
# > luckin coffee(59.151.53.6,218.11.3.70)
^https?:\/\/.+\/resource\/m\/sys\/app\/adpos url reject
^https?:\/\/.+\/resource\/m\/promo\/adsense url reject

# M
# > MI
^https?:\/\/api\.m\.mi\.com\/v1\/app\/start url reject
^https?:\/\/api\.jr\.mi\.com\/v1\/adv\/ url reject
^https?:\/\/api\.jr\.mi\.com\/jr\/api\/playScreen url reject
# > MI_Fit
^https?:\/\/api-mifit\.huami\.com\/discovery\/mi\/discovery\/homepage_ad\? url reject
^https?:\/\/api-mifit\.huami\.com\/discovery\/mi\/discovery\/sleep_ad\? url reject
^https?:\/\/api-mifit\.huami\.com\/discovery\/mi\/discovery\/sport_ad\? url reject
^https?:\/\/api-mifit\.huami\.com\/discovery\/mi\/discovery\/sport_summary_ad\? url reject
^https?:\/\/api-mifit\.huami\.com\/discovery\/mi\/discovery\/sport_training_ad\? url reject
^https?:\/\/api-mifit\.huami\.com\/discovery\/mi\/discovery\/step_detail_ad\? url reject
^https?:\/\/api-mifit\.huami\.com\/discovery\/mi\/discovery\/training_video_ad\? url reject
# > MogoRenter
^https?:\/\/api\.mgzf\.com\/renter-operation\/home\/startHomePage url reject
# > MojiWeather
^https?:\/\/cdn\.moji\.com\/(adoss|adlink)\/ url reject
^https?:\/\/mob\.mddcloud\.com\.cn\/api\/(ad|advert)\/ url reject
^https?:\/\/mangaapi\.manhuaren\.com\/v1\/public\/getStartPageAds url reject
^https?:\/\/img\.meituan\.net\/midas\/ url reject
^https?:\/\/p\d{1}\.meituan\.net\/(adunion|display|linglong|mmc|wmbanner)\/ url reject
^https?:\/\/s3plus\.meituan\.net\/.+\/linglong\/ url reject
^https?:\/\/capi.mwee.cn/app-api/V12/app/getstartad url reject
^https?:\/\/.+\/v1\/iflyad\/ url reject
^https?:\/\/.+\/cdn-adn\/ url reject
^https?:\/\/ggic\.cmvideo\.cn\/ad\/ url reject
^https?:\/\/ggic2\.cmvideo\.cn\/ad\/ url reject
^https?:\/\/.+/img\/ad\.union\.api\/ url reject
^https?:\/\/b-api\.ins\.miaopai\.com\/1\/ad/ url reject
^https?:\/\/mapi\.mafengwo\.cn\/ad\/ url reject
^https?:\/\/mapi\.mafengwo\.cn\/travelguide\/ad\/ url reject

# N
# > NetEase
# > NetEase Youdao
^https?:\/\/oimage([a-z])([0-9])\.ydstatic\.com\/.+adpublish url reject
^https?:\/\/dsp-impr2\.youdao\.com\/adload.s\? url reject
# > NetEase News
^https?:\/\/c\.m\.163\.com\/nc\/gl\/ url reject
# > NetEase MoneyKeeper
^https?:\/\/client\.mail\.163\.com\/apptrack\/confinfo\/searchMultiAds url reject
# > NetEase CloudMusic
^https?:\/\/.+\/eapi\/(ad|log)\/ url reject
# > NetEase 
^https?:\/\/sp\.kaola\.com\/api\/openad url reject
# > NetEase Yanxuan
^https?:\/\/support\.you\.163\.com\/xhr\/boot\/getBootMedia\.json url reject

^https?:\/\/nnapp\.cloudbae\.cn\/mc\/api\/advert/ url reject
# > NationalGeographic
^https?:\/\/dili\.bdatu\.com\/jiekou\/ad\/ url reject
# > NationalGeographicChina
^https?:\/\/wap\.ngchina\.cn\/news\/adverts\/ url reject

# O
# > ofo
^https?:\/\/supportda\.ofo\.com\/adaction\? url reject
^https?:\/\/ma\.ofo\.com\/ads\/ url reject
^https?:\/\/activity2\.api\.ofo\.com\/ofo\/Api\/v2\/ads url reject
^https?:\/\/ma\.ofo\.com\/adImage\/ url reject

# P
# > PeanutWiFiMpass
^https?:\/\/cmsapi\.wifi8\.com\/v\d{1}\/(emptyAd|adNew)\/ url reject

^https?:\/\/pss\.txffp\.com\/piaogen\/images\/launchScreen/ url reject

# Q
# > Qdaily
^https?:\/\/app3\.qdaily\.com\/app3\/boot_advertisements\.json url reject
^https?:\/\/notch\.qdaily\.com\/api\/v2\/boot_ad url reject
# > 
^https?:\/\/open\.qyer\.com\/qyer\/startpage\/ url reject
^https?:\/\/open\.qyer.com\/qyer\/config\/get url reject
^https?:\/\/media\.qyer\.com\/ad\/ url reject

# > R
^https?:\/\/msspjh\.emarbox\.com\/getAdConfig url reject
^https?:\/\/api\.videozhishi\.com\/api\/getAdvertising url reject
^https?:\/\/api\.rr\.tv\/ad\/ url reject

# S
# > Sina
^https?:\/\/edit\.sinaapp\.com\/ua\?t=adv url reject
# > Sina Weibo
^https?:\/\/sdkapp\.uve\.weibo\.com\/interface\/sdk\/sdkad\.php url reject
^https?:\/\/wbapp\.uve\.weibo\.com\/wbapplua\/wbpullad\.lua url reject
^https?:\/\/sdkapp\.uve\.weibo\.com/\interface\/sdk\/actionad\.php url reject
# > Sina 
^https?:\/\/tqt\.weibo\.cn\/overall\/redirect\.php\?r=tqt_sdkad url reject
^https?:\/\/tqt\.weibo\.cn\/overall\/redirect\.php\?r=tqtad url reject
^https?:\/\/tqt\.weibo\.cn\/.+advert\.index url reject
^https?:\/\/tqt\.weibo\.cn\/api\/advert\/ url reject
# > Sohu
^https?:\/\/api\.k\.sohu\.com\/api\/news\/adsense url reject
^https?:\/\/pic\.k\.sohu\.com\/img8\/wb\/tj\/ url reject
^https?:\/\/s1\.api\.tv\.itc\.cn\/v4\/mobile\/control\/switch\.json url reject
^https?:\/\/api\.tv\.sohu\.com\/agg\/api\/app\/config\/bootstrap url reject
# > StarFans
^https?:\/\/a\.sfansclub\.com\/business\/t\/ad\/ url reject
^https?:\/\/a\.sfansclub\.com\/business\/t\/boot\/screen\/index url reject
^https?:\/\/api\.smzdm\.com\/v1\/util\/loading url reject
^https?:\/\/service\.4gtv\.tv\/4gtv\/Data\/GetAD url reject
^https?:\/\/service\.4gtv\.tv\/4gtv\/Data\/ADLog url reject
^https?:\/\/api\.qiuduoduo\.cn\/guideimage url reject
# > 识货
^https?:\/\/www\.shihuo\.cn\/app3\/saveAppInfo url reject
^https?:\/\/gw-passenger\.01zhuanche\.com\/gw-passenger\/car-rest\/webservice\/passenger\/recommendADs url reject
^https?:\/\/gw-passenger\.01zhuanche\.com\/gw-passenger\/zhuanche-passenger-token\/leachtoken\/webservice\/homepage\/queryADs url reject

# T
# > Tencent
# >> Tencent Futubull
^https?:\/\/api5\.futunn\.com\/ad\/ url reject
# >> Tencent Game
^https?:\/\/ssl\.kohsocialapp\.qq\.com:10001\/game\/buttons url reject
^https?:\/\/qt\.qq\.com\/lua\/mengyou\/get_splash_screen_info url reject
# >> Tencent Maps
^https?:\/\/3gimg\.qq\.com\/tencentMapTouch\/app\/activity\/ url reject
# >> Tencent QQLive
^https?:\/\/btrace.qq.com url reject
^https?:\/\/vv\.video\.qq\.com\/getvmind\? url reject
^https?:\/\/.+\.mp4\?cdncode=.+&sdtfrom=v3004 url reject
# >> Tencent QQNews
^https?:\/\/r\.inews\.qq\.com\/getFullScreenPic url reject
^https?:\/\/r\.inews\.qq\.com\/adsBlacklist url reject
^https?:\/\/r\.inews\.qq\.com\/getQQNewsRemoteConfig url reject
# >> Tencent WeChat
^https?:\/\/mp\.weixin\.qq.com\/mp\/ad_complaint url reject
^https?:\/\/mp\.weixin\.qq.com\/mp\/advertisement_report url reject
^https?:\/\/mp\.weixin\.qq.com\/mp\/ad_video url reject
# > Thunder
^https?:\/\/images\.client\.vip\.xunlei\.com\/.+\/advert\/ url reject
# > TV_Home
^https?:\/\/api\.gaoqingdianshi\.com\/api\/v2\/ad\/ url reject
# > The_Paper
^https?:\/\/adpai\.thepaper\.cn\/.+&ad= url reject
^https?:\/\/agent-count\.pconline\.com\.cn\/counter\/adAnalyse\/ url reject
^https?:\/\/mrobot\.pconline\.com\.cn\/v3\/ad2p url reject
^https?:\/\/mrobot\.pconline\.com\.cn\/s\/onlineinfo\/ad\/ url reject
^https?:\/\/mrobot\.pcauto\.com\.cn\/v3\/ad2p url reject
^https?:\/\/mrobot\.pcauto\.com\.cn\/xsp\/s\/auto\/info\/preload\.xsp url reject

# V
# > VUE
^https?:\/\/static\.vuevideo\.net\/styleAssets\/.+\/splash_ad url reject
^https?:\/\/static\.vuevideo\.net\/styleAssets\/advertisement\/ url reject

# W
# > WeDoctor
^https?:\/\/app\.wy\.guahao\.com\/json\/white\/dayquestion\/getpopad url reject
# > Weico
^https?:\/\/overseas\.weico\.cc/portal\.php\?a=get_coopen_ads url reject
^https?:\/\/api-release\.wuta-cam\.com\/ad_tree url reject
^https?:\/\/res-release\.wuta-cam\.com\/json\/ads_component_cache\.json url reject
^https?:\/\/snailsleep\.net\/snail\/v1\/screen\/qn\/get\? url reject
^https?:\/\/snailsleep\.net\/snail\/v1\/adTask\/ url reject
^https?:\/\/nochange\.ggsafe\.com\/ad\/ url reject
^https?:\/\/thor\.weidian\.com\/ares\/home\.splash\/ url reject
^https?:\/\/api\.wallstreetcn\.com\/apiv1\/advertising\/ url reject

# X
^https?:\/\/api\.xiachufang\.com\/v2\/ad/ url reject
# >
^https?:\/\/acs\.m\.taobao\.com\/gw\/mtop\.alimusic\.common\.mobileservice\.startinit\/ url reject

^https?:\/\/api\.psy-1\.com\/cosleep\/startup url reject

^https?:\/\/portal-xunyou\.qingcdn\.com\/api\/v1\/ios\/configs\/(splash_ad|ad_urls) url reject
^https?:\/\/portal-xunyou\.qingcdn\.com\/api\/v\d{1}\/ios\/ads\/ url reject

# Y
# > Yahoo!
^https?:\/\/m\.yap\.yahoo\.com\/v18\/getAds\.do url reject
# > Youtube++
^https?:\/\/api\.catch\.gift\/api\/v3\/pagead\/ url reject
# > YOUKU
^https?:\/\/.+\.mp4\?ccode=0902 url reject
^https?:\/\/.+\.mp4\?sid= url reject
# > YYeTs
^https?:\/\/ctrl\.(playcvn|zmzapi)\.(com|net)\/app\/(ads|init) url reject
# > 
^https?:\/\/i\.ys7\.com\/api\/ads url reject
# > 
^https?:\/\/.+\.iydsj\.com\/api\/.+\/ad url reject
# >
^https?:\/\/app\.mixcapp\.com\/mixc\/api\/v2\/ad url reject

# Z
# > 
^https?:\/\/a\.qiumibao\.com\/activities\/config\.php url reject
^https?:\/\/.+\/allOne\.php\?ad_name url reject
# > 
^https?:\/\/www\.zhihu\.com\/api\/v4\/community-ad\/ url reject
^https?:\/\/api\.zhihu\.com\/real_time_launch url reject
^https?:\/\/api\.zhihu\.com\/launch url reject
# > 
^https?:\/\/(api|b)\.zhuishushenqi\.com\/advert url reject
^https?:\/\/api\.zhuishushenqi\.com\/notification\/shelfMessage url reject
^https?:\/\/api\.zhuishushenqi\.com\/splashes\/ios url reject
^https?:\/\/api\.zhuishushenqi\.com\/notification\/shelfMessage url reject
^https?:\/\/api\.zhuishushenqi\.com\/user\/bookshelf-updated url reject
^https?:\/\/itunes\.apple\.com\/lookup\?id=575826903 url reject


^https:\/\/m\.creditcard\.ecitic\.com\/citiccard\/mbk\/.+.\/appStartAdv url reject


^https:\/\/mp\.weixin\.qq\.com\/mp\/getappmsgad\?f= url reject


[filter_local]
#本地分流
;user-agent, ?abc*, proxy
;host, www.google.com, proxy
;host-keyword, adsite, reject
;host-suffix, googleapis.com, proxy

#绕过企业证书过期
host, ocsp.apple.com, reject

#屏蔽系统更新
host, mesu.apple.com, 🚫屏蔽系统更新
host, gdmf.apple.com, 🚫屏蔽系统更新

#迅雷版权问题
host, hub5idx.v6.shub.sandai.net, reject
host, hub5emu.v6.shub.sandai.net, reject
host, hub5btmain.v6.shub.sandai.net, reject

#去掉YouTube++底部广告
host-suffix, ehg-youtube.hitbox.com, reject

#网易云音乐
host-suffix, music.126.net, direct

ip-cidr, 10.0.0.0/8, direct
ip-cidr, 127.0.0.0/8, direct
ip-cidr, 172.16.0.0/12, direct
ip-cidr, 192.168.0.0/16, direct
ip-cidr, 224.0.0.0/24, direct
geoip, cn, direct
final, proxy

[mitm]
passphrase = 42950F11
p12 = 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
;passphrase =
;p12 =
hostname = *.360buyimg.com, *.cnbetacdn.com, *.doubanio.com, *.iydsj.com, *.pstatp.com, *.uve.weibo.com, *.ydstatic.com, *.youtube.com, 101.201.62.22, 113.105.222.132, 113.96.109.*, 118.178.214.118, 121.14.89.216, 121.9.212.178, 14.21.76.30, 183.232.237.194, 183.232.246.225, 183.60.159.227, 59.37.96.220, 789.kakamobi.cn, a.applovin.com, aarkissltrial.secure2.footprint.net, acs.m.taobao.com, activity2.api.ofo.com, adm.10jqka.com.cn, adproxy.autohome.com.cn, afd.baidu.com, api.app.vhall.com, api.bilibili.com, api.chelaile.net.cn, api.douban.com, api.feng.com, api.fengshows.com, api.gotokeep.com, api.huomao.com, api.jr.mi.com, api.k.sohu.com, api.kkmh.com, api.laifeng.com, api.m.jd.com, api.m.mi.com, api.mddcloud.com.cn, api.psy-1.com, api.rr.tv, api.smzdm.com, api.tv.sohu.com, api.weibo.cn, api.xiachufang.com, api.zhihu.com, api.zhuishushenqi.com, api5.futunn.com, api-mifit.huami.com, api-mifit-cn.huami.com, api-release.wuta-cam.com, app.10086.cn, app.bilibili.com, app.m.zj.chinamobile.com, app.mixcapp.com, app.wy.guahao.com, app2.autoimg.cn, appsdk.soku.com, atrace.chelaile.net.cn, b.zhuishushenqi.com, c.m.163.com, capi.douyucdn.cn, capi.mwee.cn, cdn.kuaidi100.com, cdn.moji.com, classbox2.kechenggezi.com, client.mail.163.com, connect.facebook.net, consumer.fcbox.com, creatives.ftimg.net, d.1qianbao.com, daoyu.sdo.com, dapis.mting.info, dl.app.gtja.com, dongfeng.alicdn.com, dsp-impr2.youdao.com, e.dangdang.com, erebor.douban.com, fm.fenqile.com, frodo.douban.com, fuss10.elemecdn.com, g1.163.com, gorgon.youdao.com, hm.xiaomi.com, hui.sohu.com, huichuan.sm.cn, i.weread.qq.com, i1.hoopchina.com.cn, iface.iqiyi.com, iface2.iqiyi.com, img.jiemian.com, img.zuoyebang.cc, img01.10101111cdn.com, img1.126.net, img1.doubanio.com, img3.doubanio.com, impservice.dictapp.youdao.com, impservice.youdao.com, interface.music.163.com, ios.wps.cn, kano.guahao.cn, lf.snssdk.com, lives.l.qq.com, m.aty.sohu.com, m.client.10010.com, m.ibuscloud.com, m.yap.yahoo.com, m5.amap.com, ma.ofo.com, mage.if.qidian.com, mapi.appvipshop.com, mbl.56.com, mimg.127.net, mlife.cmbchina.com, mmg.aty.sohu.com, mmgr.gtimg.com, mp.weixin.qq.com, ms.jr.jd.com, nex.163.com, oimagea4.ydstatic.com, oimagec2.ydstatic.com, p.kuaidi100.com, p1.music.126.net, pic.k.sohu.com, pic1.chelaile.net.cn, pic1cdn.cmbchina.com, pic2.zhimg.com, r.inews.qq.com, resource.cmbchina.com, res-release.wuta-cam.com, ress.dxpmedia.com, rm.aarki.net, rtbapi.douyucdn.cn, service.4gtv.tv, slapi.oray.net, smkmp.96225.com, snailsleep.net, ssl.kohsocialapp.qq.com, sso.ifanr.com, static.api.m.panda.tv, static1.keepcdn.com, staticlive.douyucdn.cn, storage.wax.weibo.com, supportda.ofo.com, ups.youku.com, wapwenku.baidu.com, wenku.baidu.com, www.facebook.com, www.ft.com, www.oschina.net, www.zhihu.com, *.googlevideo.com, *.youtubei.googleapis.com, alipay.10010.com, twitter.com, *.tiktokv.com, *.byteoversea.com, *.musical.ly, *.snssdk.com, *.akamaized.net, *.amemv.com,*.chelaile.net.cn,*.k.sohu.com,*.kingsoft-office-service.com,*.meituan.net,*.ofo.com,a.apicloud.com,a.sfansclub.com,a.qiumibao.com,a.wkanx.com,act.vip.iqiyi.com,api.daydaycook.com.cn,api.intsig.net,api.jxedt.com, api.mgzf.com,api.wallstreetcn.com,app.58.com,app.api.ke.com, .caocaokeji.cn, channel.beitaichufang.com,cms.daydaycook.com.cn,creditcard.ecitic.com,gateway.shouqiev.com,gw-passenger.01zhuanche.com,mobile-api2011.elong.com,i.ys7.com,iapi.bishijie.com,m*.amap.com,m.creditcard.ecitic.com,mapi.mafengwo.cn,media.qyer.com, mob.mddcloud.com.cn,mrobot.pcauto.com.cn,mrobot.pconline.com.cn, msspjh.emarbox.com,newsso.map.qq.com,nnapp.cloudbae.cn,open.qyer.com,pss.txffp.com,portal-xunyou.qingcdn.com,render.alipay.com, smkmp.962sp.kaola.com, static.vuevideo.net,support.you.163.com,thor.weidian.com,www.dandanzan.com,www.flyertea.com,zhidao.baidu.com, *google*, *github.com,api.weibo.cn,mapi.weibo.com, mjappaz.yefu365.com, ctrl.playcvn.com