<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Menugroup */

$this->title = Yii::t('app', 'Update {modelClass}: ', [
    'modelClass' => 'Menugroup',
]) . $model->name;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Menugroups'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Update');
?>
<div class="menugroup-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
