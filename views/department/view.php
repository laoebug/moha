<?php $_GET['menu'] = 1; ?>
<?php

/* @var $this yii\web\View */
/* @var $model app\models\Menu */

$this->title = $model->name;
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
                'format' => 'html',
                'filterInputOptions' => [
                    'placeholder' => 'ຊອກຫາຕາມ ຊື່',
                    'class' => 'form-control',
                ],
                'value' => function ($data) {
                    return "<a href='index.php?r=".$data->url."'>".$data->name."</a>";
                }
            ],
            [
//                'attribute' => 'name',
                'label' => 'ເບິ່ງ',
                'format' => 'html',
                'value' => function ($data) {
                    return "<a href='index.php?r=".$data->url."' class='btn btn-primary'><i class='fa fa-eye'></i></a>";
                }
            ],
        ],
    ]);
    ?>
</div>
