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
                <h3 class="title">ສະຖິຕິສູນຄົ້ນຄວ້າວຽກງານການປົກຄອງ (<?= $year->year ?>)</h3>
            </div>
            <div class="card-body">
                <table class="table table-bordered table-hover">
                    <thead>
                    <tr>
                        <th class="text-center" rowspan="2"><?= Yii::t('app', 'No.') ?></th>
                        <th class="text-center" rowspan="2">ຫົວຂໍ້ກິດຈະກຳ</th>
                        <th class="text-center" colspan="2">ຈຳນວນຜູ້ເຂົ້າຮ່ວມທັງໝົດ</th>
                        <th class="text-center" colspan="2">ທຶນສະໜັບສະໜູນ</th>
                        <th class="text-center" rowspan="2">ພາກສ່ວນເຂົ້າຮ່ວມ</th>
                        <th class="text-center" rowspan="2">ວັນ ເດືອນ ປີ</th>
                        <th class="text-center" rowspan="2">ຈຳນວນຄັ້ງ</th>
                        <th class="text-center" rowspan="2">ສະຖານທີ່</th>
                        <th class="text-center" rowspan="2"><?= Yii::t('app', 'Remark') ?></th>
                    </tr>
                    <tr>
                        <th class="text-center"><?= Yii::t('app', 'T') ?></th>
                        <th class="text-center"><?= Yii::t('app', 'W') ?></th>
                        <th class="text-center">ລັດຖະບານ</th>
                        <th class="text-center">ທຶນຊ່ວຍເຫຼືອ</th>
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
                            <td class="text-center"><?= $model['goverment'] ?></td>
                            <td class="text-center"><?= $model['dornor'] ?></td>
                            <td class="text-center"><?= $model['attendance'] ?></td>
                            <td class="text-center"><?= \app\components\MyHelper::convertdatefordisplay($model['start_date']) . ' ~ ' . \app\components\MyHelper::convertdatefordisplay($model['end_date']) ?></td>
                            <td class="text-center"><?= number_format($model['times']) ?></td>
                            <td class="text-center"><?= $model['place'] ?></td>
                            <td><?= $model['remark'] ?></td>
                        </tr>
                    <?php endforeach; ?>
                    </tbody>
                    <tfoot>
                    <tr>
                        <th class="text-center" colspan="2"><?= Yii::t('app', 'Total') ?></th>
                        <th class="text-center"><?= $sum['total'] ?></th>
                        <th class="text-center"><?= $sum['women'] ?></th>
                        <td colspan="4"></td>
                        <th class="text-center"><?= $sum['times'] ?></th>
                        <td colspan="2"></td>
                    </tr>
                    </tfoot>
                </table>
            </div>
        </div>
    </div>
</div>
