<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
/* @var $this yii\web\View */
/* @var $searchModel app\models\GovermentlevelSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Govermentlevels');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="govermentlevel-index">

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a(Yii::t('app', 'Create Govermentlevel'), ['create'], ['class' => 'btn btn-success']) ?>
    </p>
<?php Pjax::begin(); ?>    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'name',
            [
                    'attribute' => 'deleted',
                'value' => function($data) {
                    return Yii::$app->params['YESNO'][$data->deleted];
                }
            ],

            Yii::$app->params["action"]
        ],
    ]); ?>
<?php Pjax::end(); ?></div>
