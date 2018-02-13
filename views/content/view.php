<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Content */

$this->title = $model->code;
$this->params['breadcrumbs'][] = ['label' => 'ຂໍ້ມູນຕິດຕໍ່', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="card">
    <h1><?= Html::encode($this->title) ?></h1>
    <p>
        <?= Html::a('ແກ້ໄຂ', ['update', 'id' => $model->code], ['class' => 'btn btn-primary']) ?>
    </p>
    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'code',
            'value:ntext',
        ],
    ]) ?>

</div>
