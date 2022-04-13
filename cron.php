<?php
require_once __DIR__ . '/vendor/autoload.php';

$cron = new \Jobby\Jobby();

/*---流量自动重置命令--*/
$cron->add('ServerStatusCommand', array(
    'command' => 'php bin/console.php serverstatus',
    'schedule' => '*/5 * * * *',
    'output' => 'logs/serverstatus.log',
    'enabled' => true,
));


/*---流量重置命令--*/
$cron->add('DataResetCommand', array(
    'command' => 'php bin/console.php datareset',
    'schedule' => '0 0 * * *',
    'output' => 'logs/datareset.log',
    'enabled' => true,
));

/*---汇率命令--*/
$cron->add('ExchangeRateCommand', array(  
    'command' => 'php bin/console.php updateRate',
    'schedule' => '0 */12 * * *',
    'output' => 'logs/rates.log',
    'enabled' => true,
));

/*---清除日志命令--*/
$cron->add('ClearLogsCommand', array(
    'command' => 'php bin/console.php clearlogs',
    'schedule' => '0 */6 * * *',
    'output' => 'logs/clearlogs.log',
    'enabled' => true,
));

/*---备份命令--*/
$cron->add('BackupCommand', array(
    'command' => 'php bin/console.php backup',
    'schedule' => '0 */1 * * *',
    'output' => 'logs/backup.log',
    'enabled' => true,
));

/*---检查更新命令--*/
$cron->add('CheckUpdateCommand', array(
    'command' => 'php bin/console.php versioncheck',
    'schedule' => '*/5 * * * *',
    'output' => 'logs/versioncheck.log',
    'enabled' => true,
));

/*---流量状态命令--*/
$cron->add('DataStatusCommand', array(
    'command' => 'php bin/console.php datastatus',
    'schedule' => '*/2 * * * *',
    'output' => 'logs/datastatus.log',
    'enabled' => true,
));

/*---刷新谷歌令牌命令--*/
$cron->add('RefreshTokenCommand', array(
    'command' => 'php bin/console.php refreshtoken',
    'schedule' => '*/5 * * * *',
    'output' => 'logs/refreshtoken.log',
    'enabled' => true,
));

$cron->run();
