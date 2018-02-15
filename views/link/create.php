<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\Link */

$this->title = 'ເພີ່ມຂໍ້ມູນ ເຊື່ອມຕໍ່ພາຍນອກ';
$this->params['breadcrumbs'][] = ['label' => 'ເພີ່ມຂໍ້ມູນ ເຊື່ອມຕໍ່ພາຍນອກ', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="card">
    <h1><?= Html::encode($this->title) ?></h1>
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
