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
                <h3 class="title">ຈຳນວນພະນັກງານຕາມສັນຍາ (<?= $year->year ?>)</h3>
            </div>
            <div class="card-body">
                <table class="table table-bordered table-hover">
                    <thead>
                    <tr>
                        <th class="text-center" rowspan="2"><?= Yii::t('app', 'No.')?></th>
                        <th class="text-center" rowspan="2" colspan="2">ລາຍການ</th>
                        <th class="text-center" colspan="3">ຈຳນວນລັດຖະກອນ</th>
                    </tr>
                    <tr>
                        <th class="text-center"><?= Yii::t('app', 'Total')?></th>
                        <th class="text-center"><?= Yii::t('app', 'Women')?></th>
                        <th class="text-center"><?= Yii::t('app', 'Men')?></th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <th class="text-center" rowspan="7">VII</th>
                        <th colspan="2">ຈຳນວນພະນັກງານຕາມສັນຍາ (1+2)</th>
                        <th class="text-center">
                            <?= number_format($total = $model['admin_approve_total'] + $model['admin_non_total'] + $model['officer_approve_total'] + $model['officer_non_total']) ?>
                        </th>
                        <th class="text-center">
                            <?= number_format($women = $model['admin_approve_women'] + $model['admin_non_women'] + $model['officer_approve_women'] + $model['officer_non_women']) ?>
                        </th>
                        <th class="text-center">
                            <?= number_format($total - $women) ?>
                        </th>
                    </tr>
                    <tr>
                        <td colspan="2">1. ພະນັກງານຕາມສັນຍາ (ບໍລິຫານຮັບໃຊ້)</td>
                        <td class='text-center'>
                            <?= number_format($totsl = $model['admin_approve_total'] - $model['admin_non_total']) ?>
                        </td>
                        <td class='text-center'>
                            <?= number_format($women = $model['admin_approve_women'] - $model['admin_non_women']) ?>
                        </td>
                        <td class='text-center'>
                            <?= number_format($total - $women) ?>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>ຮັບເຈົ້າຕາມຈຳນວນຕົວເລກທີ່ລັດຖະບານອະນຸມັດ</td>
                        <td class="text-center">
                            <?= number_format($model['admin_approve_total']) ?>
                        </td>
                        <td class="text-center">
                            <?= number_format($model['admin_approve_women']) ?>
                        </td>
                        <td class="text-center">
                            <?= number_format($model['admin_approve_total'] - $model['admin_approve_women']) ?>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>ຮັບເຂົ້າໂດຍບໍ່ນອນໃນຈຳນວນຕົວເລກທີ່ລັດຖະບານອະນຸມັດ (ຈ້າງເອງ)</td>
                        <td class="text-center">
                            <?= number_format($model['admin_non_total']) ?>
                        </td>
                        <td class="text-center">
                            <?= number_format($model['admin_non_women']) ?>
                        </td>
                        <td class="text-center">
                            <?= number_format($model['admin_non_total'] - $model['admin_non_women']) ?>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">2. ພະນັກງານຕາມສັນຍາ (ວິຊາການ)</td>
                        <td class="text-center">
                            <?= number_format($model['officer_approve_total'] + $model['officer_non_total']) ?>
                        </td>
                        <td class="text-center">
                            <?= number_format($model['officer_approve_women'] + $model['officer_non_women']) ?>
                        </td>
                        <td class="text-center">
                            <?= number_format($model['officer_approve_total'] + $model['officer_non_total'] - ($model['officer_approve_women'] + $model['officer_non_women'])) ?>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>ຮັບເຈົ້າຕາມຈຳນວນຕົວເລກທີ່ລັດຖະບານອະນຸມັດ</td>
                        <td class="text-center">
                            <?= number_format($model['officer_approve_total']) ?>
                        </td>
                        <td class="text-center">
                            <?= number_format($model['officer_approve_women']) ?>
                        </td>
                        <td class="text-center">
                            <?= number_format($model['officer_approve_total'] - $model['officer_approve_women']) ?>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>ຮັບເຂົ້າໂດຍບໍ່ນອນໃນຈຳນວນຕົວເລກທີ່ລັດຖະບານອະນຸມັດ (ຈ້າງເອງ)</td>
                        <td class="text-center">
                            <?= number_format($model['officer_non_total']) ?>
                        </td>
                        <td class="text-center">
                            <?= number_format($model['officer_non_women']) ?>
                        </td>
                        <td class="text-center">
                            <?= number_format($model['officer_non_total'] - $model['officer_non_women']) ?>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>