<?php
/**
 * Created by PhpStorm.
 * User: adsavin
 * Date: 09/04/2017
 * Time: 14:56
 */

$sum = [];
$total = ['total' => 0, 'women' => 0];
foreach ($models as $model)
    for($i = 0; $i < 9; $i++) {
        if(!isset($sum['position'.$i.'_total'])) $sum['position'.$i.'_total'] = 0;
        $sum['position'.$i.'_total'] += $model['position'.$i.'_total'];
        $sum['position'.$i.'_women'] += $model['position'.$i.'_women'];

        $total['total'] += $model['position'.$i.'_total'];
        $women['women'] += $model['position'.$i.'_women'];
    }
?>

<style type="text/css" media="print">
    @page { size: landscape; }
</style>
<div class="row">
    <div class="col-sm-12">
        <div class="card">
            <div class="card-title-w-btn ">
                <h3 class="title">ສະຖິຕິຜູ້ທີ່ໄດ້ຮັບຕຳແໜ່ງບໍລິຫານປະເພດຕ່າງໆ (<?= $year->year ?>)</h3>
            </div>
            <div class="card-body">
                <table class="table table-bordered table-hover">
                    <thead>
                    <tr>
                        <th class="text-center" rowspan="3">ພາກສ່ວນຕ່າງໆ</th>
                        <th class="text-center" rowspan="2" colspan="2">ລວມທັງໝົດ</th>
                        <th class="text-center" colspan="16">ຕຳແໜ່ງບໍລິຫານ</th>
                    </tr>
                    <tr>
                        <?php for($i=0;$i<16;$i++): ?>
                            <th class="text-center"><?= $i%2==0?'ລ':'ຍ'?></th>
                        <?php endfor; ?>
                    </tr>
                    <tr>
                        <th class="text-center">ກະຊວງພາຍໃນ</th>
                        <th class="text-center"><?= number_format($total['total']) ?></th>
                        <th class="text-center"><?= number_format($total['women']) ?></th>

                        <?php foreach($sum as $s): ?>
                            <th class="text-center"><?= number_format($s) ?></th>
                        <?php endforeach; ?>
                    </tr>
                    </thead>
                    <tbody>
                    <?php
                    $row = ['total' => 0, 'women' => 0];
                    foreach ($models as $model):
                        foreach ($model as $k => $v) {
                            if(strpos($k, 'total') > -1) $row['total'] += $v;
                            else if(strpos($k, 'women') > -1) $row['women'] += $v;
                        }
                        ?>
                    <tr>
                        <td><?= $model['name'] ?></td>
                        <td class="text-center"><?= number_format($row['total']) ?>/td>
                        <td class="text-center"><?= number_format($row['women']) ?>/td>
                        <?php for($c = 1; $c <= 8; $c++): ?>
                            <td class="text-center"><?= $model['position'.$i.'_total'] ?></td>
                            <td class="text-center"><?= $model['position'.$i.'_women'] ?></td>
                        <?php endfor; ?>
                    </tr>
                    <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
