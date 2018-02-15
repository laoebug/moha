<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Link */

$this->title = $model->name;
$this->params['breadcrumbs'][] = ['label' => 'ແກ້ໄຂຂໍ້ມູນ ເຊື່ອມຕໍ່ພາຍນອກ', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="link-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('ແກ້ໄຂຂໍ້ມູນ', ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('ລຶບ', ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'ທ່ານຕ້ອງການລຶບແທ້ບໍ?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'name',
            'url:url',
        ],
    ]) ?>

</div>
