<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Stat Ethnics');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="stat-ethnic-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a(Yii::t('app', 'Create Stat Ethnic'), ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'last_update',
            'saved',
            'user_id',
            'phiscal_year_id',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
