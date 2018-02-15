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
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>
    <p>
        <?= Html::a('ເພີ່ມຂໍ້ມູນ', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'summary' => false,
        'emptyText' => 'ບໍ່ມີຂໍ້ມູນ',
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],
            'name',
            'url:url',
            [
                'filter' => false,
                'header' => 'ເບິ່ງ ແກ້ໄຂ',
                'format' => 'html',
                'value' => function ($data) {
                    return Html::a('<i class="fa fa-eye"></i>', ['view','id' => $data->id], ['class' => 'btn btn-warning'])
                        . ' ' .
                        Html::a('<i class="fa fa-pencil"></i>', ['update','id' => $data->id], ['class' => 'btn btn-primary']);
                }
            ]
        ],
    ]); ?>
</div>
