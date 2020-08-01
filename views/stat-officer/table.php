<?php
/**
 * Created by PhpStorm.
 * User: adsavin
 * Date: 09/04/2017
 * Time: 14:56
 */
/* @var $model app\models\StatOfficer */
?>
<style type="text/css" media="print">
    @page { size: landscape; }
</style>
<div class="row">
    <div class="col-sm-12">
        <div class="card">
            <div class="card-title-w-btn ">
                <h3 class="title">ຕາຕະລາງສັງລວມສະຖິຕິ ລັດຖະກອນ ປີ (<?= $year->year ?>)</h3>
            </div>
            <div class="card-body">
                <table class="table table-bordered table-hover">
                    <thead>
                    <tr>
                        <th class="text-center" rowspan="2"><?= Yii::t('app', 'No.') ?></th>
                        <th class="text-center" colspan="2" rowspan="2">ລາຍການ</th>
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
                        <th rowspan="5">I</th>
                        <th colspan="2">ຈຳນວນລັດຖະກອນທົ່ວປະເທດ (1+2)</th>
                        <th class="text-right"><?= number_format($model->center_total+ $model->province_total + $model->district_total) ?></th>
                        <th class="text-right"><?= number_format($model->center_women + $model->province_women + $model->district_women) ?></th>
                        <th class="text-right"><?= number_format($model->center_total+ $model->province_total + $model->district_total - ($model->center_women + $model->province_women + $model->district_women)) ?></th>
                    </tr>
                    <tr>
                        <th>1</th>
                        <th>ຂັ້ນກະຊວງ</th>
                        <th class="text-right"><?= number_format($model->center_total) ?></th>
                        <th class="text-right"><?= number_format($model->center_women) ?></th>
                        <th class="text-right"><?= number_format($model->center_total- $model->center_women)?></th>
                    </tr>
                    <tr>
                        <th rowspan="3">2</th>
                        <th>ຂັ້ນທ້ອງຖິ່ນ</th>
                        <th class="text-right"><?= number_format($model->province_total + $model->district_total)?></th>
                        <th class="text-right"><?= number_format($model->province_women + $model->district_women)?></th>
                        <th class="text-right"><?= number_format($model->province_total + $model->district_total - ($model->province_women + $model->district_women))?></th>
                    </tr>
                    <tr>
                        <td>ພະແນກການຂັ້ນແຂວງ</td>
                        <td class="text-right"><?= number_format($model->province_total)?></td>
                        <td class="text-right"><?= number_format($model->province_women)?></td>
                        <td class="text-right"><?= number_format($model->province_total - $model->province_women)?></td>
                    </tr>
                    <tr>
                        <td>ຫ້ອງການຂັ້ນເມືອງ</td>
                        <td class="text-right"><?= number_format($model->district_total)?></td>
                        <td class="text-right"><?= number_format($model->district_women)?></td>
                        <td class="text-right"><?= number_format($model->district_total - $model->district_women)?></td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>