<?php
use App\XManager;
use App\Database;

define('BASE_PATH', __DIR__ . '/..');

require __DIR__ . '/../vendor/autoload.php';
require __DIR__ . "/../config/config.php";
require __DIR__ . "/../config/clash.php";
require __DIR__ . "/../locale/i18n.php";
 
// Site startup
XManager::boot();
Database::bootDb();

(require __DIR__ . '/../slim/bootstrap.php')->run();