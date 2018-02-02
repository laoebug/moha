<?php

/* @var $this yii\web\View */

$this->title = Yii::t('app', 'Dashboad');
?>
<div class="site-index">
    <div class="body-content">
        <div class="row user">
            <div class="col-md-4 text-center" style="">
                <b class="fa fa-user fa-5x"></b>
                <h4><?= Yii::$app->user->identity->username ?></h4>
                <p><?= Yii::$app->user->identity->firstname ?></p>
            </div>
            <div class="col-xs-8 card">
                <h3 class="text-center">
                    <i class="fa fa-newspaper-o"></i>
                    ແຈ້ງການ</h3>
                <hr>
                <?= \yii\grid\GridView::widget([
                    'emptyText' => '',
                    'summary' => false,
                    'showOnEmpty' => false,
                    'dataProvider' => $dataProvider,
                    'filterModel' => $searchModel,
                    'columns' => [
                        ['class' => 'yii\grid\SerialColumn'],
                        [
                            'attribute' => 'title',
                            'label' => 'ຫົວຂໍ້'
                        ],
                        [
                            'attribute' => 'id',
                            'filter' => false,
                            'format' => 'html',
                            'header' => 'ເບິ່ງ',
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
