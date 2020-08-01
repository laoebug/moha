<?php

use yii\grid\GridView;
use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $searchModel app\models\NoticeSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'ແຈ້ງການ';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="card">
    <h1><?= Html::encode($this->title) ?></h1>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'summary' => false,
        'columns' => [
            [
                'class' => 'yii\grid\SerialColumn',
                'options' => [
                    'style' => 'width: 5%'
                ]
            ],
            [
                'attribute' => 'created_date',
                'label' => 'ວັນທີ',
                'options' => [
                    'style' => 'width: 20%'
                ],
                'value' => function ($data) {
                    return \app\components\MyHelper::converttimefordisplay($data->created_date);
                }
            ],
            [
                'attribute' => 'title',
                'format' => 'html',
                'value' => function ($data) {
                    return "<a href='index.php?r=site/notice&id=" . $data->id . "'>" . $data->title . "</a>";
                }
            ],
            [
                'label' => 'ເບິ່ງ',
                'format' => 'html',
                'contentOptions' => [
                    'style' => 'text-align: center'
                ],
                'headerOptions' => [
                    'style' => 'text-align: center'
                ],
                'options' => [
                    'style' => 'width: 10%'
                ],
                'value' => function ($data) {
                    return "<a class='btn btn-primary' href='index.php?r=site/notice&id=" . $data->id . "'><i class='fa fa-eye'></i></a>";
                }
            ],
        ],
    ]); ?>
</div>
