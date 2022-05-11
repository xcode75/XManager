<?php

use Psr\Container\ContainerInterface;
use Symfony\Component\Console\Application;
use Symfony\Component\Console\Input\ArgvInput;
use App\XManager;


require_once __DIR__ . '/../vendor/autoload.php';
require_once __DIR__ . "/../config/config.php";
require_once __DIR__ . "/../locale/i18n.php";

XManager::boot();

/** @var ContainerInterface $container */
$container = (require __DIR__ . '/../slim/bootstrap.php')->getContainer();

$application = $container->get(Application::class);

$application->run();