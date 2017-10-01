<?php
/**
 * Created by PhpStorm.
 * User: adsavin
 * Date: 09/04/2017
 * Time: 14:56
 */
?>

<?php
$total = ['women' => 0, 'total' => 0];
$sum = [];

foreach ($models as $model)
    foreach ($columns as $m) {
        if(!isset($sum[$m])) $sum[$m] = 0;
        $sum[$m] += $model[$m];
    }

foreach ($sum as $key => $s) {
    if(strpos($key, 'total') > -1) $total['total'] += $s;
    if(strpos($key, 'women') > -1) $total['women'] += $s;
}
?>

<style type="text/css" media="print">
    @page { size: landscape; }
</style>
<div class="row">
    <div class="col-sm-12">
        <div class="card">
            <div class="card-title-w-btn ">
                <h3 class="title">ສັງລວມຈຳນວນລັດຖະກອນ ແຍກຕາມເກນອາຍຸ (<?= $year->year ?>)</h3>
            </div>
            <div class="card-body">
                <table class="table table-bordered table-hover">
                    <thead>
                    <tr>
                        <th class="text-center" rowspan="3">ພາກສ່ວນຕ່າງໆ</th>
                        <th class="text-center" rowspan="2" colspan="2">ຈ/ນ ລັດຖະກອນ ທັງໝົດ</th>
                        <th class="text-center" colspan="16">ຊັ້ນວິຊາສະເພາະ</th>
                        <th class="text-center" colspan="6">ບໍ່ມີວິຊາສະເພາະ</th>
                    </tr>
                    <tr>
                        <?php foreach($labels as $label): ?>
                            <th class="text-center" colspan="2"><?= $label ?></th>
                        <?php endforeach; ?>
                    </tr>
                    <tr>
                        <?php for($i=0;$i<24;$i++): ?>
                            <th class="text-center"><?= $i%2==0?'ລ':'ຍ'?></th>
                        <?php endfor; ?>
                    </tr>
                    <tr>
                        <th class="text-center">1. ກະຊວງພາຍໃນ ລວມທັງໝົດ</th>
                        <th class="text-center"><?= number_format($total['total']) ?></th>
                        <th class="text-center"><?= number_format($total['women']) ?></th>
                        <?php foreach($columns as $c): ?>
                            <th class="text-center"><?= number_format($sum[$c]) ?></th>
                        <?php endforeach; ?>
                    </tr>
                    </thead>
                    <tbody>
                    <?php foreach ($models as $model): ?>
                        <tr>
                            <td><?= $model['name'] ?></td>
                            <?php
                            $row = ['total' => 0, 'women' => 0];
                            foreach ($columns as $m) {
                                if(strpos($m, 'total') > -1) $row['total'] += $model[$m];
                                if(strpos($m, 'women') > -1) $row['women'] += $model[$m];
                            }
                            ?>
                            <td class="text-center"><?= number_format($row['total']) ?></td>
                            <td class="text-center"><?= number_format($row['women']) ?></td>
                            <?php foreach($columns as $c): ?>
                                <td class="text-center"><?= number_format($model[$c])?></td>
                            <?php endforeach; ?>
                        </tr>
                    <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
