<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\PhiscalYear */

$this->title = Yii::t('app', 'Update {modelClass}: ', [
    'modelClass' => 'Phiscal Year',
]) . $model->id;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Phiscal Years'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Update');
?>
<div class="phiscal-year-update">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
