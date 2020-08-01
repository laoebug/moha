<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Notice */

$this->title = 'ແກ້ໄຂຂໍ້ມູນ ແຈ້ງການ';
$this->params['breadcrumbs'][] = ['label' => 'ແຈ້ງການ', 'url' => ['index']];
$this->params['breadcrumbs'][] = 'ແກ້ໄຂ';
?>
<div class="card">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
