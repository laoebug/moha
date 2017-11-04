<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\LegalType */

$this->title = Yii::t('app', 'Update {modelClass}: ', [
    'modelClass' => 'Legal Type',
]) . $model->name;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Legal Types'), 'url' => ['index']];
$this->params['breadcrumbs'][] = 'ແກ້ໄຂຂໍ້ມູນ';
?>
<div class="legal-type-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
