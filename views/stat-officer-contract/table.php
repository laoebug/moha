<?php

/**
 * Created by PhpStorm.
 * User: adsavin
 * Date: 09/04/2017
 * Time: 14:56
 */
/* @var $model app\models\StatOfficerAgeDetail */
$sum = [
    'admin_approve_total' => 0,
    'admin_approve_women' => 0,
    'admin_non_total' => 0,
    'admin_non_women' => 0,
    'officer_approve_total' => 0,
    'officer_approve_women' => 0,
    'officer_non_total' => 0,
    'officer_non_women' => 0
];

foreach ($models as $i => $model) {
    $sum['admin_approve_total'] += $model['admin_approve_total'];
    $sum['admin_approve_women'] += $model['admin_approve_women'];
    $sum['admin_non_total'] += $model['admin_non_total'];
    $sum['admin_non_women'] += $model['admin_non_women'];
    $sum['officer_approve_total'] += $model['officer_approve_total'];
    $sum['officer_approve_women'] += $model['officer_approve_women'];
    $sum['officer_non_total'] += $model['officer_non_total'];
    $sum['officer_non_women'] += $model['officer_non_women'];
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
                <h3 class="title">ຈຳນວນພະນັກງານຕາມສັນຍາ (<?= $year->year ?>)</h3>
            </div>
            <div class="card-body">
                <table class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <th rowspan="4" class="text-center">ຊື່ພາກສ່ວນຕ່າງໆ</th>
                            <th colspan="2" rowspan="3" class="text-center">ຈຳນວນພະນັກງານຕາມສັນຍາທັງໝົດ</th>
                            <th colspan="8" class="text-center">ປະເພດພະນັກງານຕາມສັນຍາ</th>
                        </tr>
                        <tr>
                            <th colspan="4" class="text-center">ໂຄຕາລັດຖະບານອະນຸມັດ</th>
                            <th colspan="4" class="text-center">ບໍ່ນອນໃນ ໂຄຕາລັດຖະບານອະນຸມັດ (ຈ້າງເອງ)</th>
                        </tr>
                        <tr>
                            <th colspan="2" class="text-center">ບໍລິຫານຮັບໃຊ້</th>
                            <th colspan="2" class="text-center">ວິຊາການ</th>
                            <th colspan="2" class="text-center">ບໍລິຫານຮັບໃຊ້</th>
                            <th colspan="2" class="text-center">ວິຊາການ</th>
                        </tr>
                        <tr>
                            <?php for ($i = 0; $i < 5; $i++) : ?>
                                <th class="text-center" style="width: 8%">ລ</th>
                                <th class="text-center" style="width: 8%">ຍ</th>
                            <?php endfor; ?>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th>ຈຳນວນລັດຖະກອນທັງໝົດ</th>
                            <th class="text-center">
                                <?= number_format(
                                    $sum['admin_approve_total'] + $sum['admin_non_total'] + $sum['officer_approve_total'] + $sum['officer_non_total']
                                )
                                ?>
                            </th>
                            <th class="text-center">
                                <?= number_format(
                                    $sum['admin_approve_women'] + $sum['admin_non_women'] + $sum['officer_approve_women'] + $sum['officer_non_women']
                                )
                                ?>
                            </th>
                            <th class="text-center"><?= number_format($sum['admin_approve_total']) ?></th>
                            <th class="text-center"><?= number_format($sum['admin_approve_women']) ?></th>
                            <th class="text-center"><?= number_format($sum['admin_non_total']) ?></th>
                            <th class="text-center"><?= number_format($sum['admin_non_women']) ?></th>
                            <th class="text-center"><?= number_format($sum['officer_approve_total']) ?></th>
                            <th class="text-center"><?= number_format($sum['officer_approve_women']) ?></th>
                            <th class="text-center"><?= number_format($sum['officer_non_total']) ?></th>
                            <th class="text-center"><?= number_format($sum['officer_non_women']) ?></th>
                        </tr>
                        <?php foreach ($models as $m) : ?>
                            <tr>
                                <td><?= $m['name'] ?></td>
                                <td class="text-center">
                                    <?= number_format($m['admin_approve_total'] + $m['admin_non_total'] + $m['officer_approve_total'] + $m['officer_non_total']) ?>
                                </td>
                                <td class="text-center">
                                    <?= number_format($m['admin_approve_women'] + $m['admin_non_women'] + $m['officer_approve_women'] + $m['officer_non_women']) ?>
                                </td>
                                <td class="text-center"><?= number_format($m['admin_approve_total']) ?> </td>
                                <td class="text-center"><?= number_format($m['admin_approve_women']) ?> </td>
                                <td class="text-center"><?= number_format($m['admin_non_total']) ?> </td>
                                <td class="text-center"><?= number_format($m['admin_non_women']) ?> </td>
                                <td class="text-center"><?= number_format($m['officer_approve_total']) ?> </td>
                                <td class="text-center"><?= number_format($m['officer_approve_women']) ?> </td>
                                <td class="text-center"><?= number_format($m['officer_non_total']) ?> </td>
                                <td class="text-center"><?= number_format($m['officer_non_women']) ?> </td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>