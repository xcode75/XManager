<?php


namespace App\Services\MailServices;

use App\Handlers\Config;
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\OAuth;
use League\OAuth2\Client\Provider\Google;

class SmtpMail extends Base
{
    private $mail;
    private $config;

    public function __construct()
    {
        $this->config = $this->getConfig();
        $mail = new PHPMailer(true);
		//$mail->SMTPDebug = SMTP::DEBUG_SERVER;   
        $mail->isSMTP();                                     
        $mail->SMTPAuth = true; 		
		if($this->config['smtp_method'] == 1){
			$mail->AuthType = 'XOAUTH2';
			$provider = new Google(
				[
					'clientId' => $this->config['google_clientId'],
					'clientSecret' => $this->config['google_clientSecret'],
				]
			);
			$mail->setOAuth(
				new OAuth(
					[
						'provider' => $provider,
						'clientId' => $this->config['google_clientId'],
						'clientSecret' => $this->config['google_clientSecret'],
						'refreshToken' => $this->config['google_Token'],
						'userName' => $this->config['google_email'],
					]
				)
			);
			if ($this->config['smtp_ssl'] == 1) {
				$mail->SMTPSecure = ($this->config['google_port'] == '587' ? 'tls' : 'ssl');                         
			} 
			$mail->Port = $this->config['google_port']; 
			$mail->Host = $this->config['google_host']; 
			$mail->setFrom($this->config['sender'], $this->config['name']);
		}else{
			if ($this->config['smtp_ssl'] == 1) {
				$mail->SMTPSecure = ($this->config['port'] == '587' ? 'tls' : 'ssl');                         
			} 
			$mail->Port = $this->config['port']; 
			$mail->Host = $this->config['host']; 
			$mail->Username = $this->config['username'];               
			$mail->Password = $this->config['passsword']; 
			$mail->setFrom($this->config['sender'], $this->config['name']);	
		}       
		
        
        $mail->CharSet = PHPMailer::CHARSET_UTF8;
        $this->mail = $mail;
    }

    public function getConfig()
    {
		$Config = new Config();
        return [
            'host' 		=> $Config->getConfig('smtp_host'),
            'username' 	=> $Config->getConfig('smtp_username'),
            'port' 		=> $Config->getConfig('smtp_port'),
            'sender' 	=> $Config->getConfig('smtp_sender'),
            'name' 		=> $Config->getConfig('smtp_name'),
            'passsword' => $Config->getConfig('smtp_password'),
			'smtp_ssl' 	=> $Config->getConfig('smtp_ssl'),
			'smtp_method' 	=> $Config->getConfig('smtp_method'),
			'google_auth' 	=> $Config->getConfig('googleauth'),
			'google_email' 	=> $Config->getConfig('googleemail'),
			'google_host' 	=> $Config->getConfig('googlehost'),
			'google_port' 	=> $Config->getConfig('googleport'),
			'google_clientId' 	=> $Config->getConfig('googleclientid'),
			'google_clientSecret' 	=> $Config->getConfig('googlesecret'),
			'google_Token' 	=> $Config->getConfig('googletoken')
        ];
    }

    public function send($to, $subject, $text, $files)
    {
		$mail = $this->mail;
		$mail->addAddress($to);     
		$mail->isHTML(true);
		$mail->Subject = $subject;
		$mail->Body = $text;
		foreach ($files as $file) {
			$mail->addAttachment($file);
		}        
        if (!$mail->send()) {
            throw new \Exception($mail->ErrorInfo);
        }	
    }
}
