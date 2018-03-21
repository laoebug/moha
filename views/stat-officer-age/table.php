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
    <div class="col-sm-12" style="overflow-x: scroll">
        <div class="card">
            <div class="card-title-w-btn ">
                <h3 class="title">ຈຳນວນລັດຖະກອນ ແຍກຕາມເກນອາຍຸ ປີ (<?= $year->year ?>)</h3>
            </div>
            <div class="card-body">
                <table class="table table-bordered table-hover">
                    <thead>
                    <tr>
                        <th class="text-center" rowspan="2"><?= Yii::t('app', 'No.') ?></th>
                        <th class="text-center" colspan="18" rowspan="2">ລາຍການ</th>
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
                            <th rowspan="4">III</th>
                            <th class="text-center" colspan="18">ຈຳນວນລັດຖະກອນ ແຍກຕາມເກນອາຍຸ</th>
                            <th class="text-center">
                                <?php
                                $total = $model->total_u25 + $model->total_25_30 + $model->total_31_35 + $model->total_36_40 +
                                    $model->total_41_45 + $model->total_46_50 + $model->total_51_55 + $model->total_56_60 + $model->total_61u;
                                echo number_format($total);
                                ?>
                            </th>
                            <th class="text-center">
                                <?php
                                $women = $model->women_u25 + $model->women_25_30 + $model->women_31_35 + $model->women_36_40 +
                                    $model->women_41_45 + $model->women_46_50 + $model->women_51_55 + $model->women_56_60 + $model->women_61u;
                                echo number_format($women);
                                ?>
                            </th>
                            <th class="text-center"><?= number_format($total-$women) ?></th>
                        </tr>
                        <tr>
                            <td class="text-center" colspan="2">ອາຍຸຕໍ່າກວ່າ 25 ປີ</td>
                            <td class="text-center" colspan="2">ອາຍຸ 25 ຫາ 30 ປີ</td>
                            <td class="text-center" colspan="2">ອາຍຸ 31 ຫາ 35 ປີ</td>
                            <td class="text-center" colspan="2">ອາຍຸ 36 ຫາ 40 ປີ</td>
                            <td class="text-center" colspan="2">ອາຍຸ 41 ຫາ 45 ປີ</td>
                            <td class="text-center" colspan="2">ອາຍຸ 46 ຫາ 50 ປີ</td>
                            <td class="text-center" colspan="2">ອາຍຸ 51 ຫາ 55 ປີ</td>
                            <td class="text-center" colspan="2">ອາຍຸ 56 ຫາ 60 ປີ</td>
                            <td class="text-center" colspan="2">ອາຍຸ 61 ປີ ຂຶ້ນໄປ</td>
                            <td colspan="3" rowspan="3"></td>
                        </tr>
                        <tr>
                            <?php for ($i = 0; $i< 18; $i++): ?>
                            <td class="text-center"><?= Yii::t('app', $i%2==0?'T':'W') ?></td>
                            <?php endfor; ?>
                        </tr>
                        <tr>
                            <td><?= number_format($model->total_u25 )  ?></td><td><?= number_format($model->women_u25  ) ?></td>
                            <td><?= number_format($model->total_25_30) ?></td><td><?= number_format($model->women_25_30) ?></td>
                            <td><?= number_format($model->total_31_35) ?></td><td><?= number_format($model->women_31_35) ?></td>
                            <td><?= number_format($model->total_36_40) ?></td><td><?= number_format($model->women_36_40) ?></td>
                            <td><?= number_format($model->total_41_45) ?></td><td><?= number_format($model->women_41_45) ?></td>
                            <td><?= number_format($model->total_46_50) ?></td><td><?= number_format($model->women_46_50) ?></td>
                            <td><?= number_format($model->total_51_55) ?></td><td><?= number_format($model->women_51_55) ?></td>
                            <td><?= number_format($model->total_56_60) ?></td><td><?= number_format($model->women_56_60) ?></td>
                            <td><?= number_format($model->total_61u ) ?></td><td><?=  number_format($model->women_61u  ) ?></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>