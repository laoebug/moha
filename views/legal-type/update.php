<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\LegalType */

$this->title = 'ແກ້ໄຂຂໍ້ມູນ ປະເພດນິຕິກຳ';
$this->params['breadcrumbs'][] = ['label' => 'ປະເພດນິຕິກຳ', 'url' => ['index']];
$this->params['breadcrumbs'][] = 'ແກ້ໄຂຂໍ້ມູນ';
?>
<div class="card">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
