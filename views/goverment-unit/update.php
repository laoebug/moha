<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\GovermentUnit */

$this->title = Yii::t('app', 'Update {modelClass}: ', [
    'modelClass' => 'Goverment Unit',
]) . $model->name;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Goverment Units'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Update');
?>
<div class="goverment-unit-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
