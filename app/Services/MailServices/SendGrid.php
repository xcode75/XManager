<?php

namespace App\Services\MailServices;
use App\Handlers\Config;

class SendGrid extends Base
{
    private $config;
    private $sg;
    private $sender;
    private $name;

    public function __construct()
    {
        $this->config = $this->getConfig();
        $this->sg = new \SendGrid($this->config['key']);
        $this->sender = $this->config['sender'];
        $this->name = $this->config['name'];
        $this->email = new \SendGrid\Mail\Mail();
    }

    public function getConfig()
    {
		$Config = new Config();
        return [
            'key' => $Config->getConfig('sendgrid_key'),
            'sender' => $Config->getConfig('sendgrid_sender'),
            'name' => $Config->getConfig('sendgrid_name')
        ];
    }

    public function send($to_address, $subject_raw, $text, $files)
    {
        $this->email->setFrom($this->sender, $this->name);
        $this->email->setSubject($subject_raw);
        $this->email->addTo($to_address,null);
        $this->email->addContent('text/html', $text);	
		
        foreach ($files as $file) {
            $this->email->addAttachment(
                base64_encode(file_get_contents($file)),
                'application/octet-stream',
                basename($file),
                'attachment',
                'backup'
            );
        }

        $response = $this->sg->send($this->email);
        echo $response->body();
    }
}
