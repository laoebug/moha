<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Ethnic */

$this->title = 'ແກ້ໄຂຂໍ້ມູນ ຊົນເຜົ່າ';
$this->params['breadcrumbs'][] = ['label' => 'ຊົນເຜົ່າ', 'url' => ['index']];
$this->params['breadcrumbs'][] = 'ແກ້ໄຂຂໍ້ມູນ';
?>
<div class="ethnic-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
