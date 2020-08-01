<?php

/* @var $this yii\web\View */
/* @var $model app\models\Notice */

$this->title = 'ກົມ';
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
                'format' => 'html',
                'value' => function ($data) {
                    return '<a href="index.php?r=department/view&id='.$data->id.'">'.$data->name.'</a>';
                }
            ],
        ],
    ]);
    ?>
</div>
