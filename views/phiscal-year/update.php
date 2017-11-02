<?php

/* @var $this yii\web\View */
/* @var $model app\models\PhiscalYear */

$this->title = Yii::t('app', 'Update {modelClass}: ', [
    'modelClass' => 'Phiscal Year',
]) . $model->id;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Phiscal Years'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Update');
?>
<div class="card">

    <?php echo Yii::$app->controller->renderPartial ( '_form', [ 'model' => $model ] )?>
    

</div>
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
