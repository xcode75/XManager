<?php


namespace App\Services\MailServices;

abstract class Base
{
    abstract public function send($to, $subject, $text, $file);
}
