<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\StudyLevelSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'ຈັດການຂໍ້ມູນ ຊັ້ນວິຊາສະເພາະ';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="card">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); 
    ?>

    <p>
        <?= Html::a(Yii::t('app', 'Create'), ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'name',
            'deleted',
            'position',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>