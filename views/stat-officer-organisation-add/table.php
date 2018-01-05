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
                <h3 class="title">ຕາຕະລາງ ສະຖິຕິ ລັດຖະກອນລວມ ອົງການຈັດຕັ້ງຂັ້ນສູນກາງ (<?= $year->year ?>)</h3>
            </div>
            <div class="card-body">
                <table class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <th class="text-center"><?= Yii::t('app', 'No.')?></th>
                            <th class="text-center">ອົງການຈັດຕັ້ງຂັ້ນສູນກາງ</th>
                            <th class="text-center"><?= Yii::t('app', 'Add')?></th>
                            <th class="text-center"><?= Yii::t('app', 'Resign')?></th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($models as $index => $model): ?>
                        <tr>
                            <td><?= $index + 1 ?></td>
                            <td><?= $model['name'] ?></td>
                            <td class="text-center"><?= number_format($model['add']) ?></td>
                            <td class="text-center"><?= number_format($model['resign']) ?></td>
                        </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>