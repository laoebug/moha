<?php

$params = require(__DIR__ . '/params.php');
$db = require(__DIR__ . '/db.php');

$config = [
    'id' => 'basic',
    'name' => 'MOHA',
    'basePath' => dirname(__DIR__),
    'bootstrap' => ['log'],
    'language' => 'la-LA',
    'sourceLanguage' => 'en-US',
    // 'controllerNamespace' => 'app\controllers',
    'components' => [
        'request' => [
            // !!! insert a secret key in the following (if it is empty) - this is required by cookie validation
            'cookieValidationKey' => 'tFaU8qIgCUkMm0Kajdu7K5a6LyuXHDj8',
        ],
        'cache' => [
            'class' => 'yii\caching\FileCache',
        ],
        'user' => [
            'identityClass' => 'app\models\User',
            'enableAutoLogin' => true,
        ],
        'errorHandler' => [
            'errorAction' => 'site/error',
        ],
        'mailer' => [
            'class' => 'yii\swiftmailer\Mailer',
            // send all mails to a file by default. You have to set
            // 'useFileTransport' to false and configure a transport
            // for the mailer to send real emails.
            'useFileTransport' => true,
        ],
        'log' => [
            'traceLevel' => YII_DEBUG ? 3 : 0,
            'targets' => [
                [
                    'class' => 'yii\log\FileTarget',
                    'levels' => ['error', 'warning'],
                ],
            ],
        ],
        'db' => $db,
//         'urlManager' => [
//             'enablePrettyUrl' => true,
//             'enableStrictParsing' => true,
//             'showScriptName' => false,
//             'rules' => [
//                   ['class' => 'yii\rest\UrlRule', 'controller' => 'myrole'],

//             ],
//         ],
        'i18n' => [
            'translations' => [
                'app*' => [
                    'class' => \yii\i18n\DbMessageSource::className(),
                    'sourceLanguage' => 'en-US',
                    'cachingDuration' => 180,
                    'enableCaching' => true,
                    'on missingTranslation' => ['app\components\TranslationEventHandler', 'handleMissingTranslation']
                ],
            ],
        ],
        'request' => [
            'cookieValidationKey' => 'ok',
            'parsers' => [
                'application/json' => 'yii\web\JsonParser', // required for POST input via `php://input`
            ]
        ],
    ],
//    'as beforeRequest' => [  // if guest user access site so, redirect to login page.
//        'class' => 'yii\filters\AccessControl',
//        'rules' => [
//            [
//                'actions' => [
//                    'login',
//                    'error'
//                ],
//                'allow' => true
//            ],
//            [
//                'allow' => true,
//                'roles' => [
//                    '@'
//                ]
//            ]
//        ]
//    ],
    'params' => $params,
];

if (YII_ENV_DEV) {
    // configuration adjustments for 'dev' environment
    $config['bootstrap'][] = 'debug';
    $config['modules']['debug'] = [
        'class' => 'yii\debug\Module',
        // uncomment the following to add your IP if you are not connecting from localhost.
        //'allowedIPs' => ['127.0.0.1', '::1'],
    ];
    $config['bootstrap'][] = 'gii';
    $config['modules']['gii'] = [
        'class' => 'yii\gii\Module',
        // uncomment the following to add your IP if you are not connecting from localhost.
        //'allowedIPs' => ['127.0.0.1', '::1'],
    ];
}

return $config;