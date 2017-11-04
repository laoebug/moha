<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Award */

$this->title = 'ແກ້ໄຂຂໍ້ມູນ ຍ້ອງຍໍຜົນງານ';
$this->params['breadcrumbs'][] = ['label' => 'ຍ້ອງຍໍຜົນງານ', 'url' => ['index']];
$this->params['breadcrumbs'][] = 'ແກ້ໄຂຂໍ້ມູນ';
?>
<div class="card">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
