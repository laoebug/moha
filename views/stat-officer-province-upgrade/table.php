<?php
/**
 * Created by PhpStorm.
 * User: adsavin
 * Date: 09/04/2017
 * Time: 14:56
 */
/* @var $model app\models\StatOfficerAgeDetail */
$sum = [];

foreach ($models as $model)
    foreach ($cols as $col) {
        if(!isset($sum[$col]))
            $sum[$col] = 0;
        $sum[$col] += $model[$col];
    }

?>
<style type="text/css" media="print">
    @page { size: landscape; }
</style>
<div class="row">
    <div class="col-sm-12">
        <div class="card">
            <div class="card-title-w-btn ">
                <h3 class="title">ສະຖິຕິສັງລວມພະນັກງານ ລັດຖະກອນ ຂັ້ນທ້ອງຖິ່ນທີ່ໄປຍົກລະດັບຢູ່ພາຍໃນ ແລະ ຕ່າງປະເທດ (<?= $year->year ?>)</h3>
            </div>
            <div class="card-body">
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th class="text-center" rowspan="4"><?= Yii::t('app', 'No.') ?></th>
                        <th class="text-center" rowspan="3"><?= Yii::t('app', 'Province')?></th>
                        <th class="text-center" rowspan="2" colspan="2"><?= Yii::t('app', 'Total')?></th>

                        <th class="text-center" colspan="4">ປະລິນຍາເອກ</th>
                        <th class="text-center" colspan="4">ປະລິນຍາໂທ</th>
                        <th class="text-center" colspan="4">ປະລິນຍາຕີ</th>
                        <th class="text-center" colspan="4">ຊັ້ນສູງ</th>
                        <th class="text-center" colspan="4">ຊັ້ນກາງ</th>
                        <th class="text-center" colspan="4">ຊັ້ນຕົ້ນ</th>
                    </tr>
                    <tr>
                        <?php for($i=0;$i<12;$i++): ?>
                            <th class="text-center" colspan="2"><?= Yii::t('app', $i%2==0?'Local':'Oversea') ?></th>
                        <?php endfor; ?>
                    </tr>
                    <tr>
                        <?php for($i=0;$i<26;$i++): ?>
                            <th class="text-center"><?= Yii::t('app', $i%2==0?'T':'W') ?></th>
                        <?php endfor; ?>
                    </tr>
                    <tr>
                        <th class="text-center"><?= Yii::t('app', 'Total') ?></th>
                        <th class="text-center">
                            <?php
                            $t = ['total'=> 0, 'women' => 0];
                            foreach ($sum as $key => $s) {
                                if(strpos($key, 'total'))
                                    $t['total'] += $s;
                                if(strpos($key, 'women'))
                                    $t['women'] += $s;
                            }
                            echo number_format($t['total']);
                            ?>
                        </th>
                        <th class="text-center">
                            <?= number_format($t['total']) ?>
                        </th>
                        </th>
                        <?php foreach ($sum as $s): ?>
                            <th class="text-center"><?= $s ?></th>
                        <?php endforeach; ?>
                    </tr>
                    </thead>
                    <tbody>
                    <?php foreach ($models as $index => $model): ?>
                        <tr>
                            <td class="text-center"><?= $index+1 ?></td>
                            <td><?= $model['province_name'] ?></td>
                            <?php
                            $t = ['total' => 0, 'women' => 0];
                            foreach ($cols as $col) {
                                if(strpos($col, 'total')) $t['total'] += $model[$col];
                                if(strpos($col, 'women')) $t['women'] += $model[$col];
                            } ?>
                            <td class="text-center"><?= number_format($t['total']) ?></td>
                            <td class="text-center"><?= number_format($t['women']) ?></td>
                            <?php foreach ($cols as $col): ?>
                                <td class="text-center"><?= number_format($model[$col]) ?></td>
                            <?php endforeach; ?>
                        </tr>
                    <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>