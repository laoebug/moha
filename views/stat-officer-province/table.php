<?php
/**
 * Created by PhpStorm.
 * User: adsavin
 * Date: 09/04/2017
 * Time: 14:56
 */
/* @var $model app\models\StatOfficerAgeDetail */
?>
<style type="text/css" media="print">
    /*@page { size: landscape; }*/
</style>
<div class="row">
    <div class="col-sm-12">
        <div class="card">
            <div class="card-title-w-btn ">
                <h3 class="title">ຕາຕະລາງ ສະຖິຕິລັດຖະກອນລວມຂອງບັນດາແຂວງ/ນະຄອນຫຼວງ (<?= $year->year ?>)</h3>
            </div>
            <div class="card-body">
                <table class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <th class="text-center"><?= Yii::t('app', 'No.')?></th>
                            <th class="text-center">ແຂວງ/ນະຄອນຫຼວງ</th>
                            <th class="text-center"><?= Yii::t('app', 'Total')?></th>
                            <th class="text-center"><?= Yii::t('app', 'Women')?></th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($models as $index => $model): ?>
                        <tr>
                            <td><?= $index + 1 ?></td>
                            <td><?= $model['province_name'] ?></td>
                            <td class="text-center"><?= number_format($model['total']) ?></td>
                            <td class="text-center"><?= number_format($model['women']) ?></td>
                        </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>