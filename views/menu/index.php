<?php

use yii\grid\GridView;
use yii\helpers\Html;
use yii\widgets\Pjax;

/* @var $this yii\web\View */
/* @var $searchModel app\models\MenuSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Menus');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="menu-index">

    <h1><?= Html::encode($this->title) ?></h1>
<!--    --><?php // echo $this->render('_search', ['model' => $searchModel]); ?>
    <p>
        <?= Html::a(Yii::t('app', 'Create Menu'), ['create'], ['class' => 'btn btn-success']) ?>
    </p>
<?php Pjax::begin(); ?>    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],
            'name',
            'url:url',
            Yii::$app->params['YESNOCOLUMN'],
            [
                'attribute' => 'menugroup_id',
                'filter' => \yii\helpers\ArrayHelper::map(\app\models\Menugroup::find()->all(), "id", "name"),
                'format' => 'html',
                'value' => function($data) {
                    if($data->menugroup)
                        return $data->menugroup->name;
                }
            ],
            Yii::$app->params["action"]
        ],
    ]); ?>
<?php Pjax::end(); ?></div>
