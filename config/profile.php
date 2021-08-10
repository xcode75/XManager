<?php

$xPanel['Clash_Profiles'] = [
    'clash_new' => [
        'Checks' => [],
        'General' => [
            'port'                => 7890,
            'socks-port'          => 7891,
            'redir-port'          => 7892,
			'mixed-port'	  	  => 7893,
			'tproxy-port'         => 7894,
            'allow-lan'           => true,
            'mode'                => 'rule',
            'log-level'           => 'info',
            'external-controller' => '0.0.0.0:9090',
            'secret'              => '123456'
        ],
		'DNS' => [
            'enable'              => true,
            'ipv6'                => false,
            'listen'              => '0.0.0.0:53',
            'enhanced-mode'       => 'fake-ip',
            'fake-ip-range'       => '198.18.0.1/16',
            'nameserver'=>[
                '114.114.114.114',
                'tcp://223.5.5.5'
            ],
            'fallback'=>[
                'tls://223.5.5.5:853',
                'https://223.5.5.5/dns-query'
            ],
            'fallback-filter'=>[
                'geoip'=> true,
                'ipcidr'=>[
                    '240.0.0.0/4'
                ]
            ]
        ],
        'proxies' => [],
        'proxy-groups' => [
            [
                'name' => '🔰Global',
                'type' => 'select',
                'content' => [
                    'regex' => '(.*)',
                    'right-proxies' => [
                        '🚀Direct'
                    ],
                ]
            ],
            [
                'name' => '⚓️Others',
                'type' => 'select',
                'content' => [
                    'left-proxies' => [
                        '🔰Global',
                        '🚀Direct'
                    ]
                ]
            ],
            [
                'name' => '✈️Telegram',
                'type' => 'select',
                'content' => [
                    'left-proxies' => [
                        '🔰Global'
                    ],
                    'regex' => '(.*)',
                ]
            ],
            [
                'name' => '🎬Youtube',
                'type' => 'select',
                'content' => [
                    'left-proxies' => [
                        '🔰Global'
                    ],
                    'regex' => '(.*)',
                ]
            ],
            [
                'name' => '🎬Netflix',
                'type' => 'select',
                'content' => [
                    'left-proxies' => [
                        '🔰Global',
						'🚀Direct'
                    ],
                    'regex' => '(.*)',
                ]
            ],
            [
                'name' => '🎬Media',
                'type' => 'select',
                'content' => [
                    'left-proxies' => [
                        '🔰Global',
						'🚀Direct'
                    ],
                    'regex' => '(.*)',
                ]
            ],
            [
                'name' => '🍎Apple',
                'type' => 'select',
                'content' => [
                    'left-proxies' => [
                        '🚀Direct',
                        '🔰Global'
                    ]
                ]
            ],
            [
                'name' => '🚀Direct',
                'type' => 'select',
                'content' => [
                    'left-proxies' => [
                        'DIRECT'
                    ]
                ]
            ]
        ],
        'rules' => [
            'source' => 'clash.tpl'
        ]
    ],
    'clash_old' => [
        'Checks' => [],
        'General' => [
            'port'                => 7890,
            'socks-port'          => 7891,
            'redir-port'          => 7892,
            'allow-lan'           => true,
            'mode'                => 'Rule',
            'log-level'           => 'info'
        ],	
		'DNS' => [
            'enable'              => true,
            'ipv6'                => false,
            'listen'              => '0.0.0.0:53',
            'enhanced-mode'       => 'fake-ip',
            'fake-ip-range'       => '198.18.0.1/16',
            'nameserver'=>[
                '114.114.114.114',
                'tcp://223.5.5.5'
            ],
            'fallback'=>[
                'tls://223.5.5.5:853',
                'https://223.5.5.5/dns-query'
            ],
            'fallback-filter'=>[
                'geoip'=> true,
                'ipcidr'=>[
                    '240.0.0.0/4'
                ]
            ]
        ],		
        'Proxy' => [],
        'Proxy Group' => [
            [
                'name' => '🔰Global',
                'type' => 'select',
                'content' => [
                    'regex' => '(.*)',
                    'right-proxies' => [
                        '🚀Direct'
                    ],
                ]
            ],
            [
                'name' => '⚓️Others',
                'type' => 'select',
                'content' => [
                    'left-proxies' => [
                        '🔰Global',
                        '🚀Direct'
                    ]
                ]
            ],
            [
                'name' => '✈️Telegram',
                'type' => 'select',
                'content' => [
                    'left-proxies' => [
                        '🔰Global'
                    ],
                    'regex' => '(.*)',
                ]
            ],
            [
                'name' => '🎬Youtube',
                'type' => 'select',
                'content' => [
                    'left-proxies' => [
                        '🔰Global'
                    ],
                    'regex' => '(.*)',
                ]
            ],
            [
                'name' => '🎬Netflix',
                'type' => 'select',
                'content' => [
                    'left-proxies' => [
                        '🔰Global',
						'🚀Direct'
                    ],
                    'regex' => '(.*)',
                ]
            ],
            [
                'name' => '🎬Media',
                'type' => 'select',
                'content' => [
                    'left-proxies' => [
                        '🔰Global',
						'🚀Direct'
                    ],
                    'regex' => '(.*)',
                ]
            ],
            [
                'name' => '🍎Apple',
                'type' => 'select',
                'content' => [
                    'left-proxies' => [
                        '🚀Direct',
                        '🔰Global'
                    ]
                ]
            ],
            [
                'name' => '🚀Direct',
                'type' => 'select',
                'content' => [
                    'left-proxies' => [
                        'DIRECT'
                    ]
                ]
            ]
        ],
        'Rule' => [
            'source' => 'clash.tpl'
        ]
    ]	
];


