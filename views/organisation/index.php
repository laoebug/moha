<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\OrganisationSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'ຈັດການຂໍ້ມູນ ອົງການຈັດຕັ້ງ';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="card">
    <h1><?= Html::encode($this->title) ?></h1>
    <p>
        <?= Html::a(Yii::t('app', 'Create'), ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],
            'name',
            'deleted',
            'position',
            Yii::$app->params['action']
        ],
    ]); ?>
</div>
