<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\ApproverLevel */

$this->title = "ເພີ່ມ ຂັ້ນຜູ້ອະນຸມັດ";
$this->params['breadcrumbs'][] = ['label' => 'ຂັ້ນຜູ້ອະນຸມັດ', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="card">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
