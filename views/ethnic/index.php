<?php

use yii\grid\GridView;
use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $searchModel app\models\EthnicSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'ຈັດການຂໍ້ມູນ ຊົນເຜົ່າ';
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
            'name',
            'position',
            'deleted',
            Yii::$app->params['action']
        ],
    ]); ?>
</div>
