<?php

use yii\grid\GridView;
use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $searchModel app\models\ContentSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'ຕິດຕໍ່ພວກເຮົາ';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="card">
    <h1><?= Html::encode($this->title) ?></h1>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'summary' => false,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn',
                'options' => [
                    'style' => 'width: 5%'
                ]
            ],
            [
                'attribute' => 'code',
                'options' => [
                    'style' => 'width: 20%'
                ]
            ],
            [
                'attribute' => 'value',
            ],
            [
                'header' => Yii::t('app', ''),
                'format' => 'html',
                'value' => function($data) {
                    return \yii\helpers\Html::a("<i class='fa fa-pencil'></i>", ["update", "id" => $data->code], ["class" => "btn btn-info"])
                        ;
                }
            ],
        ],
    ]); ?>
</div>
