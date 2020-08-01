<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Link */

$this->title = 'ແກ້ໄຂຂໍ້ມູນ ເຊື່ອມຕໍ່ພາຍນອກ';
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Links'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'ແກ້ໄຂຂໍ້ມູນ ເຊື່ອມຕໍ່ພາຍນອກ';
?>
<div class="card">
    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
