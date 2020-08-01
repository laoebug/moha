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
        font-family: "Saysettha OT", "Phetsarath OT";
    }
    @page { size: landscape; }
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
                        <th rowspan="3" class="text-center">ຊື່ພາກສ່ວນຕ່າງໆ</th>
                        <th rowspan="2" class="text-center" colspan="2">ຈຳນວນລັດຖະກອນ ອອກທັງໝົດ</th>
                        <th class="text-center" colspan="14">ຈຳນວນລັດຖະກອນອອກໃນຮູບການຕ່າງໆ</th>
                        <th class="text-center" colspan="4">ຍົກຍ້າຍໄປພາກສ່ວນອື່ນ</th>
                    </tr>
                    <tr>
                        <th class="text-center" colspan="2">ບຳນານ</th>
                        <th class="text-center" colspan="2">ບຳເນັດ</th>
                        <th class="text-center" colspan="2">ເສຍຊີວິດ</th>
                        <th class="text-center" colspan="2">ປະລະໜ້າທີ່</th>
                        <th class="text-center" colspan="2">ຖືກວິໄນ ໄລ່ອອກ</th>
                        <th class="text-center" colspan="2">ລາອອກ</th>
                        <th class="text-center" colspan="2">ເສຍກຳລັງ ແຮງງານ</th>
                        <th class="text-center" colspan="2">ກຳລັງປະກອບອາວຸດ, ລັດວິສາຫະກິດ</th>
                        <th class="text-center" colspan="2">ອົງການ, ກະຊວງ, ແຂວງ, ນະຄອນຫຼວງ</th>
                    </tr>
                    <tr>
                        <?php for ($i=1;$i<=20;$i++): ?>
                            <th class="text-center"><?= $i % 2 == 1 ? 'ລ':'ຍ' ?></th>
                        <?php endfor; ?>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <th>ກະຊວງພາຍໃນ</th>
                        <td class="text-center"><?= number_format($total['total']) ?></td>
                        <td class="text-center"><?= number_format($total['women']) ?></td>
                        <td class="text-center"><?= number_format($sum['retire_total']) ?></td>
                        <td class="text-center"><?= number_format($sum['retire_women']) ?></td>
                        <td class="text-center"><?= number_format($sum['bumnet_total']) ?></td>
                        <td class="text-center"><?= number_format($sum['bumnet_women']) ?></td>
                        <td class="text-center"><?= number_format($sum['die_total']) ?></td>
                        <td class="text-center"><?= number_format($sum['die_women']) ?></td>
                        <td class="text-center"><?= number_format($sum['leave_total']) ?></td>
                        <td class="text-center"><?= number_format($sum['leave_women']) ?></td>
                        <td class="text-center"><?= number_format($sum['fire_total']) ?></td>
                        <td class="text-center"><?= number_format($sum['fire_women']) ?></td>
                        <td class="text-center"><?= number_format($sum['resign_total']) ?></td>
                        <td class="text-center"><?= number_format($sum['resign_women']) ?></td>
                        <td class="text-center"><?= number_format($sum['lose_total']) ?></td>
                        <td class="text-center"><?= number_format($sum['lose_women']) ?></td>
                        <td class="text-center"><?= number_format($sum['army_total']) ?></td>
                        <td class="text-center"><?= number_format($sum['army_women']) ?></td>
                        <td class="text-center"><?= number_format($sum['ministry_total']) ?></td>
                        <td class="text-center"><?= number_format($sum['ministry_women']) ?></td>
                    </tr>
                    <?php foreach ($models as $model): ?>
                    <tr >
                        <td><?= $model['name'] ?></td>
                        <td class="text-center"><?= number_format($row[$model['name']]['total']) ?></td>
                        <td class="text-center"><?= number_format($row[$model['name']]['women']) ?></td>
                        <td class="text-center"><?= number_format($model['retire_total']) ?></td>
                        <td class="text-center"><?= number_format($model['retire_women']) ?></td>
                        <td class="text-center"><?= number_format($model['bumnet_total']) ?></td>
                        <td class="text-center"><?= number_format($model['bumnet_women']) ?></td>
                        <td class="text-center"><?= number_format($model['die_total']) ?></td>
                        <td class="text-center"><?= number_format($model['die_women']) ?></td>
                        <td class="text-center"><?= number_format($model['leave_total']) ?></td>
                        <td class="text-center"><?= number_format($model['leave_women']) ?></td>
                        <td class="text-center"><?= number_format($model['fire_total']) ?></td>
                        <td class="text-center"><?= number_format($model['fire_women']) ?></td>
                        <td class="text-center"><?= number_format($model['resign_total']) ?></td>
                        <td class="text-center"><?= number_format($model['resign_women']) ?></td>
                        <td class="text-center"><?= number_format($model['lose_total']) ?></td>
                        <td class="text-center"><?= number_format($model['lose_women']) ?></td>
                        <td class="text-center"><?= number_format($model['army_total']) ?></td>
                        <td class="text-center"><?= number_format($model['army_women']) ?></td>
                        <td class="text-center"><?= number_format($model['ministry_total']) ?></td>
                        <td class="text-center"><?= number_format($model['ministry_women']) ?></td>
                    </tr>
                    <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
