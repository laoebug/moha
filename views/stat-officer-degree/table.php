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
    @page { size: landscape; }
</style>
<div class="row">
    <div class="col-sm-12">
        <div class="card">
            <div class="card-title-w-btn ">
                <h3 class="title">ຈຳນວນລັດຖະກອນແຍກຕາມຊັ້ນວິຊາສະເພາະ (<?= $year->year ?>)</h3>
            </div>
            <div class="card-body">
                <table class="table table-bordered table-hover">
                    <thead>
                    <tr>
                        <th class="text-center"><?= Yii::t('app', 'No.') ?></th>
                        <th class="text-center" colspan="18"><?= Yii::t('app', 'Description') ?></th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <th class="text-center" rowspan="4">IV</th>
                        <th class="" colspan="18">ຈຳນວນລັດຖະກອນແຍກຕາມຊັ້ນວິຊາສະເພາະ</th>
                    </tr>
                    <tr>
                        <td class="text-center" colspan="2">ປະລິນຍາເອກ</td>
                        <td class="text-center" colspan="2">ເໜືອປະລິນຍາໂທ</td>
                        <td class="text-center" colspan="2">ປະລິນຍາໂທ</td>
                        <td class="text-center" colspan="2">ເໜືອປະລິນຍາຕີ</td>
                        <td class="text-center" colspan="2">ປະລິນຍາຕີ</td>
                        <td class="text-center" colspan="2">ຊັ້ນສູງ</td>
                        <td class="text-center" colspan="2">ຊັ້ນກາງ</td>
                        <td class="text-center" colspan="2">ຊັ້ນຕົ້ນ</td>
                        <td class="text-center" colspan="2">ບໍ່ມີຊັ້ນ ວິຊາສະເພາະ</td>
                    </tr>
                    <tr>
                        <?php for ($i = 0; $i< 18; $i++): ?>
                            <td class="text-center"><?= Yii::t('app', $i%2==0?'T':'W') ?></td>
                        <?php endfor; ?>
                    </tr>
                    <tr>
                        <td class="text-center"><?=  number_format($model->doctor_total  ) ?></td><td class="text-center"><?=  number_format($model->doctor_women   ) ?></td>
                        <td class="text-center"><?=  number_format($model->post_master_total) ?></td><td class="text-center"><?=  number_format($model->post_master_women ) ?></td>
                        <td class="text-center"><?=  number_format($model->master_total) ?></td><td class="text-center"><?=  number_format($model->master_women ) ?></td>
                        <td class="text-center"><?=  number_format($model->post_bachelor_total) ?></td><td class="text-center"><?=  number_format($model->post_bachelor_women ) ?></td>
                        <td class="text-center"><?=  number_format($model->bachelor_total) ?></td><td class="text-center"><?=  number_format($model->bachelor_women ) ?></td>
                        <td class="text-center"><?=  number_format($model->high_total) ?></td><td class="text-center"><?=  number_format($model->high_women ) ?></td>
                        <td class="text-center"><?=  number_format($model->middle_total) ?></td><td class="text-center"><?=  number_format($model->middle_women ) ?></td>
                        <td class="text-center"><?=  number_format($model->begin_total) ?></td><td class="text-center"><?=  number_format($model->begin_women ) ?></td>
                        <td class="text-center"><?=  number_format($model->no_total) ?></td><td class="text-center"><?=  number_format($model->no_women   ) ?></td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>