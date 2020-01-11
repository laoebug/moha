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
                <h3 class="title">ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນ ແຍກຕາມວິຊາສະເພາະ (<?= $year->year ?>)</h3>
            </div>
            <div class="card-body">
                <table class="table table-bordered table-hover">
                    <thead>
                    <tr>
                        <th class="text-center" rowspan="3">ພາກສ່ວນຕ່າງໆ</th>
                        <th class="text-center" rowspan="2" colspan="2">ຈ/ນ ລັດຖະກອນ ທັງໝົດ</th>
                        <th class="text-center" colspan="16">ຊັ້ນວິຊາສະເພາະ</th>
                        <th class="text-center" colspan="6"></th>
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
                        <?php
                        $sum = [];
                        $total = ['total' => 0, 'women'=>0];
                        foreach($models as $model)
                            foreach ($columns as $column) {
                                if(!isset($sum[$column.'_total'])) $sum[$column.'_total'] = 0;
                                if(!isset($sum[$column.'_women'])) $sum[$column.'_women'] = 0;
                                $sum[$column.'_total'] += $model[$column.'_total'];
                                $sum[$column.'_women'] += $model[$column.'_women'];
                            }

                        foreach ($sum as $k => $s) {
                            if(strpos($k, 'total')) $total['total'] += $s;
                            else if(strpos($k, 'women')) $total['women'] += $s;
                        }

                        ?>
                        <th class="text-center"><?= number_format($total['total']) ?></th>
                        <th class="text-center"><?= number_format($total['women']) ?></th>

                        <?php foreach($sum as $s): ?>
                            <th class="text-center"><?= number_format($s) ?></th>
                        <?php endforeach; ?>
                    </tr>
                    </thead>
                    <tbody>
                    <?php foreach ($models as $model): ?>
                        <tr>
                            <td><?= $model['name'] ?></td>
                            <?php
                            $row = ['total' => 0, 'women' => 0];
                            foreach ($model as $k => $m) {
                                if(strpos($k, 'total')) $row['total'] += $m;
                                if(strpos($k, 'women')) $row['women'] += $m;
                            }
                            ?>
                            <?php foreach ($row as $r) : ?>
                                <td class="text-center"><?= number_format($r) ?></td>
                            <?php endforeach; ?>

                            <?php foreach($columns as $c): ?>
                                <td class="text-center">
                                    <?= number_format($model[$c.'_total']) ?>
                                </td>
                                <td class="text-center">
                                    <?= number_format($model[$c.'_women']) ?>
                                </td>
                            <?php endforeach; ?>
                        </tr>
                    <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
