<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\SalaryLevel */

$this->title = 'ແກ້ໄຂຂໍ້ມູນ ຂັ້ນເງິນເດືອນ';
$this->params['breadcrumbs'][] = ['label' => 'ຂັ້ນເງິນເດືອນ', 'url' => ['index']];
$this->params['breadcrumbs'][] = 'ແກ້ໄຂຂໍ້ມູນ';
?>
<div class="card">
    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>