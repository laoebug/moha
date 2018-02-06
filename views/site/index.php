<?php

/* @var $this yii\web\View */

$this->title = Yii::t('app', 'Dashboad');
$this->params['breadcrumbs'] = null;
?>
<div class="site-index">
    <div class="body-content">
        <div class="row user">
            <div class="col-xs-10 col-xs-offset-1 card">
                <h3 class="text-center">
                    <i class="fa fa-newspaper-o"></i>
                    ແຈ້ງການ</h3>
                <hr>
                <?= \yii\grid\GridView::widget([
                    'emptyText' => '',
                    'summary' => false,
//                    'showOnEmpty' => false,
                    'dataProvider' => $dataProvider,
                    'filterModel' => $searchModel,
                    'columns' => [
                        ['class' => 'yii\grid\SerialColumn'],
                        [
                            'attribute' => 'created_date',
                            'label' => 'ວັນທີ',
                            'options' => [
                                'style' => [
                                    'width' => '30%'
                                ]
                            ],
                            'filterInputOptions' => [
                                'placeholder' => 'ຊອກຫາຕາມ ວັນທີ',
                                'class' => 'form-control datepicker',
                            ],
                            'value' => function ($data) {
                                return \app\components\MyHelper::converttimefordisplay($data->created_date);
                            }
                        ],
                        [
                            'attribute' => 'title',
                            'label' => 'ຫົວຂໍ້',
                            'filterInputOptions' => [
                                'placeholder' => 'ຊອກຫາຕາມ ຫົວຂໍ້',
                                'class' => 'form-control'
                            ],
                        ],
                        [
                            'attribute' => 'id',
                            'filter' => false,
                            'format' => 'html',
                            'header' => 'ເບິ່ງ',
                            'options' => [
                                'style' => [
                                    'width' => '50px'
                                ]
                            ],
                            'value' => function ($data) {
                                return '<a class="btn btn-primary" href="index.php?r=site/notice&id=' . $data->id . '"><i class="fa fa-eye"></i></a>';
                            }
                        ]
                    ],
                ]); ?>
            </div>
        </div>
    </div>
</div>
