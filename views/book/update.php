<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Book */

$this->title = 'ແກ້ໄຂຂໍ້ມູນ ເອກະສານປະເພດປຶ້ມ';
$this->params['breadcrumbs'][] = ['label' => 'ເອກະສານປະເພດປຶ້ມ', 'url' => ['index']];
$this->params['breadcrumbs'][] = 'ແກ້ໄຂຂໍ້ມູນ';
?>
<div class="card">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
