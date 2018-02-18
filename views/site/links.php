<?php

use yii\grid\GridView;
use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $searchModel app\models\LinkSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'ເຊື່ອມຕໍ່ພາຍນອກ';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="card">
    <h1><?= Html::encode($this->title) ?></h1>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'summary' => false,
        'emptyText' => 'ບໍ່ມີຂໍ້ມູນ',
        'columns' => [
            [
                'class' => 'yii\grid\SerialColumn',
                'options' => [
                    'style' => "width: 5%"
                ]
            ],
            [
                'attribute' => 'name',
                'filterInputOptions' => ['placeholder' => 'ຊອກຫາຕາມຊື່', 'class' => 'form-control'],
                'format' => 'html',
                'value' => function ($data) {
                    return "<a href='" . $data->url . "' target='_blank'>" . $data->name . "</a>";
                }
            ]
        ],
    ]); ?>
</div>