<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\AidsType */

$this->title = 'ແກ້ໄຂຂໍ້ມູນ ປະເພດໂຄງການ';
$this->params['breadcrumbs'][] = ['label' => 'ປະເພດໂຄງການ', 'url' => ['index']];
$this->params['breadcrumbs'][] = 'ແກ້ໄຂຂໍ້ມູນ';
?>
<div class="ethnic-update">
    <h1><?= Html::encode($this->title) ?></h1>
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>