<?php
/**
 * Created by PhpStorm.
 * User: adsavin
 * Date: 09/04/2017
 * Time: 14:56
 */

$total = ['total' => 0, 'women' => 0];
$sum = [];
foreach ($models as $model)
foreach ($model as $k => $m) {
    if(isset($m)) {
        if(strpos($k, 'total'))
            $total['total'] = $total['total'] + $m;
        else if(strpos($k, 'women'))
            $total['women'] = $total['women'] + $m;

        if(strpos($k, 'total') || strpos($k, 'women') || $k == 'quota' || $k == 'need') {
            if(!isset($sum[$k])) $sum[$k] = 0;
            $sum[$k] += $m;
        }
    }
}
?>

<style type="text/css" media="print">
    @page { size: landscape; }
</style>
<div class="row">
    <div class="col-sm-12">
        <div class="card">
            <div class="card-title-w-btn ">
                <h3 class="title">ຈຳນວນລັດຖະກອນເພີ່ມເຂົ້າໃໝ່ ໃນຮູບການຕ່າງໆ ແລະ ແຜນຄວາມຕ້ອງການ (<?= $year->year ?>)</h3>
            </div>
            <div class="card-body">
                <table class="table table-bordered table-hover">
                    <thead>
                    <tr>
                        <th class="text-center" rowspan="3">ພາກສ່ວນຕ່າງໆ</th>
                        <th class="text-center" rowspan="2" colspan="2">ລວມທັງໝົດ</th>
                        <th class="text-center" colspan="8">ຈຳນວນເພີ່ມເຂົ້າໃໝ່ໃນຮູບການຕ່າງໆ</th>
                        <!--                        <th class="text-center" rowspan="3">ໂກຕາທີ່ໄດ້ຮັບ</th>-->
                        <th class="text-center" rowspan="3">ຄວາມຕ້ອງການໃໝ່</th>
                    </tr>
                    <tr>
                        <th colspan="2" class="text-center">ຮັບເຂົ້າໃໝ່</th>
                        <th colspan="2" class="text-center">ມາຈາກກະຊວງ, ອົງການ, ແຂວງ</th>
                        <th colspan="2" class="text-center">ຍົກຍ້າຍມາຈາກກຳລັງປະກອບອາວຸດ</th>
                        <th colspan="2" class="text-center">ຍົກຍ້າຍມາຈາກລັດວິສາຫະກິດ</th>
                    </tr>
                    <tr>
                        <?php for ($i = 0; $i < 10; $i++): ?>
                            <th class="text-center"><?= $i % 2 == 0 ? 'ລ' : 'ຍ' ?></th>
                        <?php endfor; ?>
                    </tr>
                    <tr>
                        <th class="text-center">ກະຊວງພາຍໃນ</th>
                        <th class="text-center"><?= $total['total'] ?></th>
                        <th class="text-center"><?= $total['women'] ?></th>
                        <?php foreach ([
                                           'new_total', 'new_women', 'ministry_total', 'ministry_women',
                                           'army_total', 'army_women', 'soe_total', 'soe_women',
//                                           'quota',
                                           'need'
                                       ] as $s): ?>
                            <th class="text-center"><?= $sum[$s] ?></th>
                        <?php endforeach; ?>
                    </tr>
                    </thead>
                    <tbody>
                    <?php foreach ($models as $model): ?>
                    <tr>
                        <td><?= $model['name'] ?></td>
                        <?php
                        $t = 0; $w=0;
                        foreach ($model as $k => $m) {
                            if(isset($m)) {
                                if (strpos($k, 'total')) $t += $m;
                                else if (strpos($k, 'women')) $w += $m;
                            }
                        }
                        ?>
                        <td class="text-center"><?= number_format($t) ?></td>
                        <td class="text-center"><?= number_format($w) ?></td>
                        <td class="text-center"><?= number_format($model['new_total']) ?></td>
                        <td class="text-center"><?= number_format($model['new_women']) ?></td>
                        <td class="text-center"><?= number_format($model['ministry_total']) ?></td>
                        <td class="text-center"><?= number_format($model['ministry_women']) ?></td>
                        <td class="text-center"><?= number_format($model['army_total']) ?></td>
                        <td class="text-center"><?= number_format($model['army_women']) ?></td>
                        <td class="text-center"><?= number_format($model['soe_total']) ?></td>
                        <td class="text-center"><?= number_format($model['soe_women']) ?></td>
                        <td class="text-center"><?= number_format($model['quota']) ?></td>
                        <td class="text-center"><?= number_format($model['need']) ?></td>
                 ']   </tr>
                    <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
