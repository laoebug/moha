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
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('<i class="fa fa-plus"></i> ' . Yii::t('app', 'Create') . ' ແຈ້ງການ', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'summary' => false,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],
            [
                'attribute' => 'title',
                'label' => 'ຫົວຂໍ້'
            ],
//            [
//                'attribute' => 'content',
//                'label' => 'ເນື້ອໃນ'
//            ],
            [
                'attribute' => 'start_date',
                'label' => 'ສະແດງຈາກວັນທີ'
            ],
            [
                'attribute' => 'end_date',
                'label' => 'ເຖິງວັນທີ'
            ],
            [
                'attribute' => 'show',
                'label' => 'ສະແດງ',
                'value' => function($data) {
                    return Yii::$app->params['YESNO'][$data->show];
                }
            ],
            Yii::$app->params['action'],
        ],
    ]); ?>
</div>
