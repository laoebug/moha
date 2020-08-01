<?php
/**
 * Created by PhpStorm.
 * User: adsavin
 * Date: 9/10/17
 * Time: 5:11 PM
 */
?>

<?php
/**
 * Created by PhpStorm.
 * User: adsavin
 * Date: 09/04/2017
 * Time: 14:56
 */
/* @var $model app\models\StatOfficerAgeDetail */
$sumtotal = ['total' => 0, 'women' => 0];
$sum = [];
$sumrow = [];

if (isset($models))
    foreach ($models as $rowindex => $m) {
        for ($i = 1; $i < 9; $i++) {
            $keytotal = "p${i}_total";
            $keywomen = "p${i}_women";

            $sumtotal['total'] += $m[$keytotal];
            $sumtotal['women'] += $m[$keywomen];

            if (!isset($sum[$keytotal])) $sum[$keytotal] = 0;
            $sum[$keytotal] += $m[$keytotal];

            if (!isset($sum[$keywomen])) $sum[$keywomen] = 0;
            $sum[$keywomen] += $m[$keywomen];

            if (!isset($sumrow[$rowindex]['total'])) $sumrow[$rowindex]['total'] = 0;
            $sumrow[$rowindex]['total'] += $m[$keytotal];

            if (!isset($sumrow[$rowindex]['women'])) $sumrow[$rowindex]['women'] = 0;
            $sumrow[$rowindex]['women'] += $m[$keywomen];
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
                <h3 class="title">ຈຳນວນລັດຖະກອນ ແຍກຕາມຕຳແໜ່ງບໍລິຫານປະເພດຕ່າງໆ (<?= isset($year) ? $year->year : 0 ?>
                    )</h3>
            </div>
            <div class="card-body">
                <table class="table table-bordered table-hover">
                    <thead>
                    <tr>
                        <th class="text-center" rowspan="3"><?= Yii::t('app', 'No.') ?></th>
                        <th class="text-center" rowspan="3">ຊື່ພາກສ່ວນຕ່າງໆ</th>
                        <th class="text-center" colspan="2" rowspan="2">ຈຳນວນລັດຖະກອນທັງໝົດ</th>
                        <th class="text-center" colspan="16"
                            colspan="16"><?= Yii::t('app', 'Description') ?></th>
                    </tr>
                    <tr>
                        <?php for ($i = 1; $i < 9; $i++) : ?>
                            <td colspan="2" class="text-center">ປະເພດ <?= $i ?></td>
                        <?php endfor; ?>
                    </tr>
                    <tr>
                        <td class="text-center">ລ</td>
                        <td class="text-center">ຍ</td>
                        <?php for ($i = 1; $i < 9; $i++) : ?>
                            <td class="text-center">ລ</td>
                            <td ng-repeat-end class="text-center">ຍ</td>
                        <?php endfor; ?>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <th colspan="2" class="text-center">ຈຳນວນລັດຖະກອນທັງໝົດ</th>
                        <th class="text-center"><?= number_format($sumtotal['total']) ?></th>
                        <th class="text-center"><?= number_format($sumtotal['women']) ?></th>
                        <?php for ($i = 1; $i < 9; $i++): ?>
                            <th class="text-center">
                                <?= number_format($sum["p${i}_total"]) ?>
                            </th>
                            <th class="text-center">
                                <?= number_format($sum["p${i}_women"]) ?>
                            </th>
                        <?php endfor; ?>
                    </tr>
                    <?php
                    if (isset($models)) :
                        foreach ($models as $rowindex => $model): ?>
                            <tr>
                                <td><?= $rowindex + 1 ?></td>
                                <td><?= $model['name'] ?></td>
                                <td class="text-center"><?= number_format($sumrow[$rowindex]['total']) ?></td>
                                <td class="text-center"><?= number_format($sumrow[$rowindex]['women']) ?></td>
                                <?php for ($i = 1; $i < 9; $i++): ?>
                                    <td class="text-center"><?= number_format($model["p${i}_total"]) ?></td>
                                    <td class="text-center"><?= number_format($model["p${i}_women"]) ?></td>
                                <?php endfor; ?>
                            </tr>
                        <?php endforeach;
                    endif;
                    ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
