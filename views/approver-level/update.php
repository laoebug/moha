<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\ApproverLevel */

$this->title = 'ແກ້ໄຂຂໍ້ມູນ ຂັ້ນຜູ້ອະນຸມັດ ';
$this->params['breadcrumbs'][] = ['label' => 'ຂັ້ນຜູ້ອະນຸມັດ', 'url' => ['index']];
$this->params['breadcrumbs'][] = 'ແ້ກໄຂຂໍ້ມູນ';
?>
<div class="card">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
