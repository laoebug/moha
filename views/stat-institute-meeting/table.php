<?php
/**
 * Created by PhpStorm.
 * User: adsavin
 * Date: 09/04/2017
 * Time: 14:56
 */
?>
<style type="text/css" media="print">
    @page { size: landscape; }
</style>
<div class="row">
    <div class="col-sm-12">
        <div class="card">
            <div class="card-title-w-btn ">
                <h3 class="title">
                    ສະຖິຕິສັງລວມສະຖາບັນຈັດກອງປະຊຸມ ແລະ ຝຶກອົບຮົມໃຫ້ບັນດາກະຊວງ ອົງການຂັ້ນສູນກາງ ແລະ ທ້ອງຖິ່ນ(<?= $year->year ?>)</h3>
            </div>
            <div class="card-body">
                <table class="table table-bordered table-hover">
                    <thead>
                    <tr>
                        <th class="text-center" rowspan="2"><?= Yii::t('app', 'No.') ?></th>
                        <th class="text-center" rowspan="2">ຫົວຂໍ້ຈັດເຝິກອົບຮົມ</th>
                        <th class="text-center" colspan="2">ຈຳນວນຜູ້ເຂົ້າຮ່ວມ</th>
                        <th class="text-center" rowspan="2">ວັນເດືອນປີ</th>
                        <th class="text-center" rowspan="2">ຈຳນວນຄັ້ງ</th>
                        <th class="text-center" rowspan="2">ສະຖານທີ່</th>
                    </tr>
                    <tr>
                        <th class="text-center"><?= Yii::t('app', 'T') ?></th>
                        <th class="text-center"><?= Yii::t('app', 'W') ?></th>
                    </tr>
                    </thead>
                    <tbody>
                    <?php
                    $sum = ['women'=> 0, 'total' => 0, 'times' => 0];
                    foreach ($models as $index => $model):
                        $sum['total'] += $model['total'];
                        $sum['women'] += $model['women'];
                        $sum['times'] += $model['times'];
                        ?>
                        <tr>
                            <td class="text-center"><?= $index + 1 ?></td>
                            <td><?= $model['title'] ?></td>
                            <td class="text-center"><?= number_format($model['total']) ?></td>
                            <td class="text-center"><?= number_format($model['women']) ?></td>
                            <td class="text-center"><?= \app\components\MyHelper::convertdatefordisplay($model['start_date']).' ~ '.\app\components\MyHelper::convertdatefordisplay($model['end_date']) ?></td>
                            <td class="text-center"><?= $model['times'] ?></td>
                            <td class="text-center"><?= $model['place'] ?></td>
                        </tr>
                    <?php endforeach; ?>
                    </tbody>
                    <tfoot>
                        <tr>
                            <th class="text-center" colspan="2"><?= Yii::t('app', 'Total') ?></th>
                            <th class="text-center"><?= number_format($sum['total']) ?></th>
                            <th class="text-center"><?= number_format($sum['women']) ?></th>
                            <td></td>
                            <th class="text-center"><?= number_format($sum['times']) ?></th>
                            <td></td>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>
    </div>
</div>
