<?php

/* @var $this yii\web\View */
/* @var $model app\models\PhiscalYear */

$this->title = 'ແກ້ໄຂຂໍ້ມູນ ສົກປີ';
$this->params['breadcrumbs'][] = ['label' => 'ສົກປີ', 'url' => ['index']];
$this->params['breadcrumbs'][] = 'ແກ້ໄຂຂໍ້ມູນ';
?>
<div class="card">

    <h1><?= \yii\helpers\Html::encode($this->title) ?></h1>

    <?php echo Yii::$app->controller->renderPartial ( '_form', [ 'model' => $model ] )?>
</div>
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
