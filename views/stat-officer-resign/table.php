<?php

/**
 * Created by PhpStorm.
 * User: adsavin
 * Date: 09/04/2017
 * Time: 14:56
 */
/* @var $model app\models\StatOfficerAgeDetail */
$cols = [
    'retire_total',
    'retire_women',
    'bumnet_total',
    'bumnet_women',
    'die_total',
    'die_women',
    'leave_total',
    'leave_women',
    'fire_total',
    'fire_women',
    'resign_total',
    'resign_women',
    'lose_total',
    'lose_women',
    'move_soe_total',
    'move_soe_women',
    'moveto_ministry_total',
    'moveto_ministry_women',
];
$sums = [];
$sumtotal = ['total' => 0, 'women' => 0];
$sumrow = [];
foreach ($models as $index => $model) {
    if (!isset($sumrow[$index])) $sumrow[$index] = [];

    foreach ($cols as $col) {
        if (!isset($sums[$col])) $sums[$col] = 0;
        $sums[$col] += $model[$col];

        if (!isset($sumrow[$index]['total'])) $sumrow[$index]['total'] = 0;
        if (!isset($sumrow[$index]['women'])) $sumrow[$index]['women'] = 0;


        if (strpos($col, 'total') > 0) $sumrow[$index]['total'] += $model[$col];
        if (strpos($col, 'women') > 0) $sumrow[$index]['women'] += $model[$col];

        if (strpos($col, 'total') > 0) $sumtotal['total'] += $model[$col];
        else $sumtotal['women'] += $model[$col];
    }
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
                <h3 class="title">ຈຳນວນລັດຖະກອນທີ່ອອກໃນຮູບການຕ່າງໆ (<?= $year->year ?>)</h3>
            </div>
            <div class="card-body">
                <table class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <th class="text-center" rowspan="3">ຊື່ພາກສ່ວນຕ່າງໆ</th>
                            <th class="text-center" colspan="2" rowspan="2">ຈຳນວນລັດຖະກອນທັງໝົດ</th>
                            <th class="text-center" colspan="14">ຈຳນວນລັດຖະກອນທີ່ອອກໃນຮູບການຕ່າງໆ</th>
                            <th class="text-center" colspan="4">ຍົກຍ້າຍໄປພາກສ່ວນອື່ນໆ</th>
                        </tr>
                        <tr>
                            <th class="text-center" colspan="2">ບຳນານ</th>
                            <th class="text-center" colspan="2">ບຳເນັດ</th>
                            <th class="text-center" colspan="2">ເສຍຊີວິດ</th>
                            <th class="text-center" colspan="2">ປະລະໜ້າທີ່</th>
                            <th class="text-center" colspan="2">ຖືກວິໄນໄລ່ອອກ</th>
                            <th class="text-center" colspan="2">ລາອອກ</th>
                            <th class="text-center" colspan="2">ເສຍກຳລັງແຮງງານ</th>
                            <th class="text-center" colspan="2">ຍົກຍ້າຍໄປກຳລັງປະກອບອາວຸດ, ລັດວິສາຫະກິດ</th>
                            <th class="text-center" colspan="2">ຍົກຍ້າຍໄປອົງການ, ກະຊວງ, ແຂວງ, ນະຄອນຫຼວງ</th>
                        </tr>
                        <tr>
                            <?php for ($i = 0; $i < 10; $i++) : ?>
                                <th class="text-center">ລ</th>
                                <th class="text-center">ຍ</th>
                            <?php endfor; ?>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>ຈຳນວນລັດຖະກອນທັງໝົດ</td>
                            <td style="width: 5%"><?= number_format($sumtotal['total']) ?></td>
                            <td style="width: 5%"><?= number_format($sumtotal['women']) ?></td>
                            <?php foreach ($sums as $s => $sum) : ?>
                                <td style="width: 5%" class="text-center">
                                    <?= number_format($sum) ?>
                                </td>
                            <?php endforeach ?>
                        </tr>

                        <?php foreach ($models as $i => $m) : ?>
                            <tr>
                                <td><?= $m['name'] ?></td>
                                <td style="width: 5%" class="text-center"><?= number_format($sumrow[$i]['total']) ?></td>
                                <td style="width: 5%" class="text-center"><?= number_format($sumrow[$i]['women']) ?></td>
                                <?php
                                foreach ($cols as $k => $col) :
                                ?>
                                    <td style="width: 5%" class="text-center"><?= number_format($m[$col]) ?></td>
                                <?php endforeach; ?>
                            </tr>
                        <?php endforeach ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>