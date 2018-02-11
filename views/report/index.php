<?php $_GET['menu']=1;?>
<?php
/**
 * Created by PhpStorm.
 * User: adsavin
 * Date: 2/3/18
 * Time: 3:12 PM
 */

use yii\grid\GridView;
$this->title = 'ລາຍງານ';
?>
<div class="card">
    <h3 class="">ຊອກຫາຂໍ້ມູນສະຖິຕິ</h3>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'summary' => '',
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],
            [
                'filterInputOptions' => [
                    'placeholder' => 'ຊອກຫາຕາມ ຊື່ສະຖິຕິ',
                    'class' => 'form-control datepicker',
                ],
                'attribute' => 'name',
                'format' => 'html',
                'value' => function ($data) {
                    return "<a href='index.php?r=" . $data->url . "'>" . $data->name . "</a>";
                }
            ],
            [
                'label' => 'ເບິ່ງ',
                'format' => 'html',
                'value' => function ($data) {
                    return "<a href='index.php?r=" . $data->url . "' class='btn btn-primary'><i class='fa fa-eye'></i></a>";
                }
            ]
        ],
    ]);
    ?>
</div>
