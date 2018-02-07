<?php

/* @var $this yii\web\View */
/* @var $model app\models\Menu */

$this->title = $model->name;
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="card">
    <h1><?= $this->title ?></h1>
    <?= \yii\grid\GridView::widget([
        'emptyText' => '',
        'summary' => false,
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            [
                'class' => 'yii\grid\SerialColumn',
                'options' => [
                    'style' => [
                        'width' => '5%'
                    ]
                ],
            ],
            [
                'attribute' => 'name',
                'label' => 'ຊື່',
                'filterInputOptions' => [
                    'placeholder' => 'ຊອກຫາຕາມ ຊື່',
                    'class' => 'form-control',
                ],
                'value' => function ($data) {
                    return $data->name;
                }
            ],
        ],
    ]);
    ?>
</div>
