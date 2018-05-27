<?php

use yii\grid\GridView;
use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $searchModel app\models\ApproverSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'ຜູ້ອະນຸມັດ';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="card">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a(Yii::t('app', 'Create'), ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],
            [
                'attribute' => 'approver_level_id',
                'value' => function($data) {
                    if($data->approverLevel)
                        return $data->approverLevel->name;
                }
            ],
            [
                'attribute' => 'ministry_id',
                'value' => function($data) {
                    return isset($data->ministry)? $data->ministry->name : '-';
                }
            ],
            [
                'attribute' => 'province_id',
                'value' => function($data) {
                    return isset($data->province)? $data->province->province_name : '-';
                }
            ],
            'deleted',
            Yii::$app->params['action']
        ],
    ]); ?>
</div>
