<?php
/**
 * Created by PhpStorm.
 * User: adsavin
 * Date: 2/3/18
 * Time: 3:12 PM
 */

use yii\grid\GridView;

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
                'attribute' => 'name',
                'format' => 'html',
                'value' => function ($data) {
                    return "<a href='index.php?r=" . $data->url . "'>" . $data->name . "</a>";
                }
            ]
        ],
    ]);
    ?>
</div>
