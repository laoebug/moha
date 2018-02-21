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
                <h3 class="title">ຈຳນວນລັດຖະກອນ ແຍກຕາມຕຳແໜ່ງບໍລິຫານປະເພດຕ່າງໆ (<?= $year->year ?>)</h3>
            </div>
            <div class="card-body">
                <table class="table table-bordered table-hover">
                    <thead>
                    <tr>
                        <th class="text-center" rowspan="2"><?= Yii::t('app', 'No.') ?></th>
                        <th class="text-center" rowspan="2" colspan="16"><?= Yii::t('app', 'Description') ?></th>
                        <th class="text-center" colspan="3">ຈຳນວນລັດຖະກອນ</th>
                    </tr>
                    <tr>
                        <th class="text-center"><?= Yii::t('app', 'Total') ?></th>
                        <th class="text-center"><?= Yii::t('app', 'Women') ?></th>
                        <th class="text-center"><?= Yii::t('app', 'Men') ?></th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <th class="text-center" rowspan="4">VIII</th>
                        <th class="text-center" colspan="16">ຈຳນວນລັດຖະກອນ ແຍກຕາມຕຳແໜ່ງບໍລິຫານປະເພດຕ່າງໆ</th>
                        <th class="text-center"><?= number_format($model->p1_total + $model->p2_total + $model->p3_total + $model->p4_total + $model->p5_total + $model->p6_total + $model->p7_total + $model->p8_total) ?></th>
                        <th class="text-center"><?= number_format($model->p1_women + $model->p2_women + $model->p3_women + $model->p4_women + $model->p5_women + $model->p6_women + $model->p7_women + $model->p8_women) ?></th>
                        <th class="text-center"><?= number_format($model->p1_total + $model->p2_total + $model->p3_total + $model->p4_total + $model->p5_total + $model->p6_total + $model->p7_total + $model->p8_total - ($model->p1_women + $model->p2_women + $model->p3_women + $model->p4_women + $model->p5_women + $model->p6_women + $model->p7_women + $model->p8_women)) ?></th>
                    </tr>
                    <tr>
                        <?php for ($i = 1; $i < 9; $i++): ?>
                            <td colspan="2" class="text-center"><?= Yii::t('app', 'ປະເພດ') . " $i" ?></td>
                        <?php endfor; ?>
                    </tr>
                    <tr>
                        <?php for ($i = 1; $i < 17; $i++): ?>
                            <td class="text-center"><?= Yii::t('app', $i % 2 == 1 ? 'T' : 'W') ?></td>
                        <?php endfor; ?>
                    </tr>
                    <tr>
                        <?php for ($i = 1; $i < 9; $i++): ?>
                            <td class="text-center"><?= number_format($model['p' . $i . '_total']) ?></td>
                            <td class="text-center"><?= number_format($model['p' . $i . '_women']) ?></td>
                        <?php endfor; ?>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
