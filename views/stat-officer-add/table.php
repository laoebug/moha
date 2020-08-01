<?php

/**
 * Created by PhpStorm.
 * User: adsavin
 * Date: 09/04/2017
 * Time: 14:56
 */
/* @var $model app\models\StatOfficerAgeDetail */
$sum = [
    'quota_total' => 0,
    'quota_women' => 0,
    'army_total' => 0,
    'army_women' => 0,
    'soe_total' => 0,
    'soe_women' => 0,
    'move_total' => 0,
    'move_women' => 0,
    'need' => 0,
];
foreach ($models as $model) {
    $sum['quota_total'] += $model['quota_total'];
    $sum['quota_women'] += $model['quota_women'];
    $sum['army_total'] += $model['army_total'];
    $sum['army_women'] += $model['army_women'];
    $sum['soe_total'] += $model['soe_total'];
    $sum['soe_women'] += $model['soe_women'];
    $sum['move_total'] += $model['move_total'];
    $sum['move_women'] += $model['move_women'];
    $sum['need'] += $model['need'];
}
?>
<style type="text/css" media="print">
    @page {
        size: landscape;
    }
</style>
<div class="row">
    <div class="col-sm-12">
        <div class="card">
            <div class="card-title-w-btn ">
                <h3 class="title">ຈຳນວນລັດຖະກອນທີ່ເພີ່ມເຂົ້າໃນຮູບການຕ່າງໆ (<?= $year->year ?>)</h3>
            </div>
            <div class="card-body">
                <table class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <th class="text-center" rowspan="4">ຊື່ພາກສ່ວນຕ່າງໆ</th>
                            <th class="text-center" colspan="2" rowspan="3">ເພີ່ມເຂົ້າຕາມການແບ່ງປັນທັງໝົດ</th>
                            <th class="text-center" colspan="8">ຈຳນວນເພີ່ມເຂົ້າໃໝ່ໃນຮູບການຕ່າງໆ</th>
                            <th class="text-center" rowspan="3">ຄວາມຕ້ອງການລັດຖະກອນໃໝ່</th>
                        </tr>
                        <tr>
                            <th colspan="8" class="text-center">ຕາມແຜນແບ່ງປັນ (ໂກຕາ) ງວດ I ແລະ III</th>
                        </tr>
                        <tr>
                            <th colspan="2" class="text-center">ເຂົ້າໃໝ່ 95%</th>
                            <th colspan="2" class="text-center">ຍົກຍ້າຍມາຈາກກຳລັງປະກອບອາວຸດ</th>
                            <th colspan="2" class="text-center">ຍົກຍ້າຍມາຈາກລັດວິສາຫະກິດ</th>
                            <th colspan="2" class="text-center">ຍົກຍ້າຍມາຈາກກະຊວງ, ອົງການ, ແຂວງ</th>
                        </tr>
                        <tr>
                            <?php for ($i = 0; $i < 5; $i++) : ?>
                                <th class="text-center">ລ</th>
                                <th class="text-center">ຍ</th>
                            <?php endfor; ?>
                            <th class="text-center">ລ</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th>ຈຳນວນລັດຖະກອນທັງໝົດ</th>
                            <th class="text-center"><?= number_format($sum['quota_total'] + $sum['army_total'] + $sum['soe_total'] + $sum['move_total']) ?></th>
                            <th class="text-center"><?= number_format($sum['quota_women'] + $sum['army_women'] + $sum['soe_women'] + $sum['move_women']) ?></th>
                            <?php foreach ($sum as $s) : ?>
                                <th class="text-center"><?= number_format($s) ?></th>
                            <?php endforeach; ?>
                        </tr>
                        <?php foreach ($models as $m) : ?>
                            <tr>
                                <td style="width: 10%"><?= $m['name'] ?></td>
                                <td class="text-center" style="width: 6%"><?= number_format($m['quota_total'] + $m['army_total'] + $m['soe_total'] + $m['move_total']) ?></td>
                                <td class="text-center" style="width: 6%"><?= number_format($m['quota_women'] + $m['army_women'] + $m['soe_women'] + $m['move_women']) ?></td>
                                <td class="text-center" style="width: 5%"><?= number_format($m['quota_total']) ?></td>
                                <td class="text-center" style="width: 5%"><?= number_format($m['quota_women']) ?></td>
                                <td class="text-center" style="width: 5%"><?= number_format($m['army_total']) ?></td>
                                <td class="text-center" style="width: 5%"><?= number_format($m['army_women']) ?></td>
                                <td class="text-center" style="width: 5%"><?= number_format($m['soe_total']) ?></td>
                                <td class="text-center" style="width: 5%"><?= number_format($m['soe_women']) ?></td>
                                <td class="text-center" style="width: 5%"><?= number_format($m['move_total']) ?></td>
                                <td class="text-center" style="width: 5%"><?= number_format($m['move_women']) ?></td>
                                <td class="text-center" style="width: 5%"><?= number_format($m['need']) ?></td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>