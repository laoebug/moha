<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
use app\components\MyHelper;
/* @var $this yii\web\View */
/* @var $searchModel app\models\PhiscalYearSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Phiscal Years');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="phiscal-year-index">

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a(Yii::t('app', 'Create Phiscal Year'), ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?php Pjax::begin(); ?>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'year',
            [
//                'header' => Yii::t('app', 'Date'),
                'attribute' => 'start_date',
                'value' => function($data) {
                    return MyHelper::convertdatefordisplay($data->start_date). " ~ " . MyHelper::convertdatefordisplay($data->end_date);
                }
            ],
            Yii::$app->params['YESNOCOLUMN'],
            [
                'attribute' => 'status',
                'format' => 'html',
                'filter' => ["O" => Yii::t('app','Opening'), "C"=>Yii::t('app','Closed')],
                'value' => function($data) {
                    switch ($data->status) {
                        case "O": return "<span class='label label-success'>".Yii::t('app','Opening')."</span>";
                        case "C": return "<span class='label label-danger'>".Yii::t('app','Closed')."</span>";
                    }
                }
            ],

            Yii::$app->params["action"]
        ],
    ]); ?>
<?php Pjax::end(); ?></div>
