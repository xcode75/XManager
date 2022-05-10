<?php

namespace App\Services\MailServices;

use App\Handlers\Config;
use Aws\Sdk;
use Aws\Ses\SesClient; 
use Aws\Exception\AwsException;
use Aws\Credentials\Credentials;


class AmazonSes extends Base
{
    
	private $config;
    private $SesClient;
    private $sender;
	
    public function __construct()
    {
        $this->config = $this->getConfig();
		
		$credentials = new Credentials(
			$this->config['aws_key'], 
			$this->config['aws_secret']
		);
		$this->sender = $this->config['aws_sender'];
		
        $this->SesClient = new Aws\Ses\SesClient([
			'version' => 'latest',
			'region' => $this->config['aws_region'],
			'credentials' => $credentials
		]);
        
    }
	
    public function getConfig()
    {
		$Config = new Config();
        return [
            'aws_key' => $Config->getConfig('aws_key'),
			'aws_secret' => $Config->getConfig('aws_secret'),
            'aws_sender' => $Config->getConfig('aws_sender'),
			'aws_region' => $Config->getConfig('aws_region')
        ];
    }

    public function send($to_address, $subject, $text)
    {
		$this->SesClient->sendEmail([
			'Destination' => [
				'ToAddresses' => [$to_address],
			],
			'Source' => $this->sender,
			'Message' => [
				'Body' => [
					'Html' => [
						'Charset' => 'UTF-8',
						'Data' => $text,
					],
					'Text' => [
						'Charset' => 'UTF-8',
						'Data' => $text,
					],
				],
				'Subject' => [
					'Charset' => 'UTF-8',
					'Data' => $subject,
				],
			],
		]);	
	}
}
 