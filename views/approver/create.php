<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\Approver */

$this->title = "ເພີ່ມ ຜູ້ອະນຸມັດ";
$this->params['breadcrumbs'][] = ['label' => 'ຜູ້ອະນຸມັດ', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="card">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
