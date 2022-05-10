<?php

namespace App\Services\MailServices;

use Mailgun\Mailgun as MailgunService;
use App\Handlers\Config;

class Mailgun extends Base
{
    private $config;
    private $mg;
    private $domain;
    private $sender;

    public function __construct()
    {
        $this->config = $this->getConfig();
        $this->mg = MailgunService::create($this->config['key']);
        $this->domain = $this->config['domain'];
        $this->sender = $this->config['sender'];
    }

    public function getConfig()
    {
		$Config = new Config();
        return [
            'key' => $Config->getConfig('mailgun_key'),
            'domain' => $Config->getConfig('mailgun_domain'),
            'sender' => $Config->getConfig('mailgun_sender')
        ];
    }

    public function send($to, $subject, $text, $files)
    {
        $inline = array();
        foreach ($files as $file) {
            $inline[] = array('filePath' => $file, 'filename' => basename($file));
        }
        if (count($inline) == 0) {
            $this->mg->messages()->send($this->domain, [
                    'from' => $this->sender,
                    'to' => $to,
                    'subject' => $subject,
                    'html' => $text
                ]);
        } else {
            $this->mg->messages()->send($this->domain, [
                    'from' => $this->sender,
                    'to' => $to,
                    'subject' => $subject,
                    'html' => $text,
                    'inline' => $inline
                ]);
        }
    }
}
