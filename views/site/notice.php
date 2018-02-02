<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Notice */

$this->title = $model->title;
$this->params['breadcrumbs'][] = ['label' => 'ແຈ້ງການ', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="card">
    <h1><?= Html::encode($this->title) ?></h1>
    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'created_date',
            'title',
            'content:ntext',
            'start_date',
            'end_date',
            [
                'attribute' => 'show',
                'value' => function ($data) {
                    return Yii::$app->params['YESNO'][$data->show];
                }
            ],
            [
                'attribute' => 'user_id',
                'value' => function ($data) {
                    return $data->user->username;
                }
            ],
            'position',
        ],
    ]) ?>

</div>
