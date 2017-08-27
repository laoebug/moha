<?php

return [
    'adminEmail' => 'admin@example.com',
    'action' => [
        'header' => Yii::t('app', 'Actions'),
        'format' => 'html',
        'value' => function($data) {
            return
                \yii\helpers\Html::a("<i class='fa fa-search'></i>", ["view", "id" => $data->id], ["class" => "btn btn-warning"])
                . " " . \yii\helpers\Html::a("<i class='fa fa-pencil'></i>", ["update", "id" => $data->id], ["class" => "btn btn-info"])
                . " " . \yii\helpers\Html::a("<i class='fa fa-trash'></i>", ["delete", "id" => $data->id], ["class" => "btn btn-danger"])
                ;
        }
    ]
];
