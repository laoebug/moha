<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\OfficerLevel */

$this->title = 'ແກ້ໄຂຂໍ້ມູນ ຂັ້ນລັດຖະກອນ';
$this->params['breadcrumbs'][] = ['label' => 'ຂັ້ນລັດຖະກອນ', 'url' => ['index']];
$this->params['breadcrumbs'][] = 'ແກ້ໄຂຂໍ້ມູນ';
?>
<div class="card">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
