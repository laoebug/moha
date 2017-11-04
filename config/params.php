<?php

return [
    'adminEmail' => 'admin@example.com',
    'action' => [
        'header' => Yii::t('app', ''),
        'format' => 'html',
        'value' => function($data) {
            return
//                \yii\helpers\Html::a("<i class='fa fa-search'></i>", ["view", "id" => $data->id], ["class" => "btn btn-warning"])
                 " " . \yii\helpers\Html::a("<i class='fa fa-pencil'></i>", ["update", "id" => $data->id], ["class" => "btn btn-info"])
//                . " " . \yii\helpers\Html::a("<i class='fa fa-trash'></i>", ["delete", "id" => $data->id], ["class" => "btn btn-danger"])
                ;
        }
    ],
    'YESNO' => [
//        Yii::t('app', 'NO'),
//        Yii::t('app', 'YES'),
        'NO',
        'YES'
    ],
    'YESNOCLASS' => [
        "success", "danger"
    ],
    'YESNOLABEL' => [
        "<span class='label label-success'>NO</span>",
        "<span class='label label-danger'>YES</span>"
    ],
    'YESNOCOLUMN' => [
        'attribute' => 'deleted',
        'format' => 'html',
        'filter' => ["NO", "YES"],
        'value' => function($data) {
            return Yii::$app->params["YESNOLABEL"][$data->deleted];
        }
    ],
    "DEFAULT_ADMIN_ROLE"=>"Super Admin"
];
