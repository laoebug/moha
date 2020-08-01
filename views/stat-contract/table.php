<?php
/**
 * Created by PhpStorm.
 * User: adsavin
 * Date: 09/04/2017
 * Time: 14:56
 */

$sum = [];
$total = ['total' => 0, 'women' => 0];
$row = [];
foreach ($models as $model) {
    if(!isset($row[$model['name']])) $row[$model['name']] = ['total' => 0, 'women' => 0];
    foreach ($model as $key => $value) {
        if($key == 'name') continue;
        if(!isset($sum[$key])) $sum[$key] = 0;
        $sum[$key] += $value;

        if(strpos($key, "total") > -1) {
            $total['total'] += $value;
            $row[$model['name']]['total'] += $value;
        }
        if(strpos($key, "women") > -1) {
            $total['women'] += $value;
            $row[$model['name']]['women'] += $value;
        }
    }
}
?>
<style type="text/css" media="print">
    * {
        font-family: "Saysettha OT", "Phetsarath OT" !important;
    }
    @page { size: landscape; }
</style>
<div class="row">
    <div class="col-sm-12">
        <div class="card">
            <div class="card-title-w-btn ">
                <h3 class="title">ຕາຕະລາງສັງລວມພະນັກງານຕາມສັນຍາ (<?= $year->year ?>)</h3>
            </div>
            <div class="card-body">
                <table class="table table-bordered table-hover">
                    <thead>
                    <tr>
                        <th rowspan="4" class="text-center">ຊື່ພາກສ່ວນຕ່າງໆ</th>
                        <th rowspan="3" class="text-center" colspan="2">ຈຳນວນພະນັກງານຕາມສັນຍາທັງໝົດ</th>
                        <th class="text-center" colspan="8">ປະເພດພະນັກງານຕາມສັນຍາ</th>
                    </tr>
                    <tr>
                        <th class="text-center" colspan="4">ຕາມໂກຕາທີ່ລັດຖະບານ ອະນຸມັດ</th>
                        <th class="text-center" colspan="4">ບໍ່ນອນໃນ ໂກຕາທີ່ລັດຖະບານ ໄດ້ອະນຸມັດ (ຈ້າງເອງ)</th>
                    </tr>
                    <tr>
                        <th class="text-center" colspan="2">ບໍລິຫານ</th>
                        <th class="text-center" colspan="2">ວິຊາການ</th>
                        <th class="text-center" colspan="2">ບໍລິຫານ</th>
                        <th class="text-center" colspan="2">ວິຊາການ</th>
                    </tr>
                    <tr>
                        <?php for ($i=1;$i<=10;$i++): ?>
                            <th class="text-center"><?= $i % 2 == 1 ? 'ລ':'ຍ' ?></th>
                        <?php endfor; ?>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <th>ກະຊວງພາຍໃນ</th>
                        <td class="text-center"><?= number_format($total['total']) ?></td>
                        <td class="text-center"><?= number_format($total['women']) ?></td>
                        <td class="text-center"><?= number_format($sum['quota_manage_total']) ?></td>
                        <td class="text-center"><?= number_format($sum['quota_manage_women']) ?></td>
                        <td class="text-center"><?= number_format($sum['quota_technic_total']) ?></td>
                        <td class="text-center"><?= number_format($sum['quota_technic_women']) ?></td>
                        <td class="text-center"><?= number_format($sum['nonquota_manage_total']) ?></td>
                        <td class="text-center"><?= number_format($sum['nonquota_manage_women']) ?></td>
                        <td class="text-center"><?= number_format($sum['nonquota_technic_total']) ?></td>
                        <td class="text-center"><?= number_format($sum['nonquota_technic_women']) ?></td>
                    </tr>
                    <?php foreach ($models as $model): ?>
                    <tr>
                        <td><?= $model['name'] ?></td>
                        <td class="text-center"><?= number_format($row[$model['name']]['total']) ?></td>
                        <td class="text-center"><?= number_format($row[$model['name']]['women']) ?></td>
                        <td class="text-center"><?= number_format($model['quota_manage_total']) ?></td>
                        <td class="text-center"><?= number_format($model['quota_manage_women']) ?></td>
                        <td class="text-center"><?= number_format($model['quota_technic_total']) ?></td>
                        <td class="text-center"><?= number_format($model['quota_technic_women']) ?></td>
                        <td class="text-center"><?= number_format($model['nonquota_manage_total']) ?></td>
                        <td class="text-center"><?= number_format($model['nonquota_manage_women']) ?></td>
                        <td class="text-center"><?= number_format($model['nonquota_technic_total']) ?></td>
                        <td class="text-center"><?= number_format($model['nonquota_technic_women']) ?></td>
                    </tr>
                    <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
