<?php
/**
 * Created by PhpStorm.
 * User: adsavin
 * Date: 09/04/2017
 * Time: 14:56
 */

$sum = ['amount' => 0, 'receive' => 0];
foreach ($models as $model) {
    $sum['amount'] += $model['amount'];
    $sum['receive'] += $model['receive'];
}
?>
<style type="text/css" media="print">
    * {
        font-family: "Saysettha OT", "Phetsarath OT" !important;
    }

    @page {
        size: landscape;
    }
</style>
<div class="row">
    <div class="col-sm-12">
        <div class="card">
            <div class="card-title-w-btn ">
                <h3 class="title">ຕາຕາລາງບັນດາໂຄງການຊ່ວຍເຫຼືອຂອງຕ່າງປະເທດປະຈຳປີ (<?= $year->year ?>)</h3>
            </div>
            <div class="card-body">
                <table class="table table-bordered table-hover">
                    <thead>
                    <tr>
                        <th class="text-center" rowspan="2">ລ/ດ</th>
                        <th class="text-center" rowspan="2">ຊື່ໂຄງການ</th>
                        <th class="text-center" rowspan="2">ລະຫັດ</th>
                        <th class="text-center" rowspan="2">ໄລຍະຈັດຕັ້ງປະຕິບັດ</th>
                        <th class="text-center" rowspan="2">ມູນຄ່າລວມໂຄງການ</th>
                        <th class="text-center" colspan="2">ປະເພດການຊ່ວຍເຫຼືອ</th>
                        <th class="text-center" rowspan="2">ຊື່ອົງການຜູ້ໃຫ້ທຶນ</th>
                        <th class="text-center" rowspan="2">ງົບປະມານທີ່ໄດ້ຮັບ ປີຜ່ານມາ</th>
                    </tr>
                    <tr>
                        <th class="text-center">ຊ່ວຍລ້າ</th>
                        <th class="text-center">ກູ້ຢືມ</th>
                    </tr>
                    </thead>
                    <tbody>
                    <?php foreach ($models as $k => $model): ?>
                        <tr>
                            <td><?= $k + 1 ?></td>
                            <td><?= $model['name'] ?></td>
                            <td class="text-center"><?= $model['code'] ?></td>
                            <td class="text-center"><?= $model['start_year'] . ' - ' . $model['end_year'] ?></td>
                            <td class="text-right"><?= number_format($model['amount']) ?></td>
                            <td class="text-center"><?= isset($model['free']) ? 'P' : ''?></td>
                            <td class="text-center"><?= isset($model['loan']) ? 'P' : ''?></td>
                            <td class="text-center"><?= $model['organisation'] ?></td>
                            <td class="text-right"><?= number_format($model['receive']) ?></td>
                        </tr>
                    <?php endforeach; ?>
                    </tbody>
                    <tfoot>
                    <tr>
                        <th colspan="2">ລວມ</th>
                        <th></th>
                        <th></th>
                        <th class="text-right"><?= number_format($sum['amount']) ?></th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th class="text-right"><?= number_format($sum['receive']) ?></th>
                    </tr>
                    </tfoot>
                </table>
            </div>
        </div>
    </div>
</div>
