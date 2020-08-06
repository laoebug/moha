<?php

/* @var $this yii\web\View */
/* @var $searchModel app\models\StatReligionTeacherSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$cols = [
    'buddhis_total', 'buddhis_women', 'christ_cato_total', 'christ_cato_women',
    'christ_news_total', 'christ_news_women', 'christ_sat_total', 'christ_sat_women',
    'bahai_total', 'bahai_women', 'idslam_total', 'idslam_women', 'other_total', 'other_women'
];
$sum = [];
foreach ($cols as $col) $sum[$col] = 0;
foreach ($models as $model)
    foreach ($cols as $col)
        $sum[$col] += $model[$col];

?>
<style type="text/css" media="print">
    @page {
        size: landscape;
    }
</style>
<div class="row">
    <div ng-show="models" class="col-sm-12 card" style="margin-top: 2em;overflow-x: scroll">
        <div class="card-title-w-btn ">
            <h3>ສະຖິຕິປະຊາຊົນເຊື່ອຖື ສາສະໜາ ແລະ ຄວາມເຊື່ອອື່ນ ໃນທົ່ວປະເທດ ປະຈໍາປີ <?= $year->year ?></h3>
        </div>
        <table class="table table-bordered table-hover">
            <thead>
                <tr>
                    <th class="text-center" rowspan="4" style="vertical-align: middle;">ລ/ດ</th>
                    <th class="text-center" rowspan="4" style="vertical-align: middle;">ແຂວງ</th>
                    <th class="text-center" colspan="2" rowspan="3" style="vertical-align: middle;">ສາສະໜາພຸດ</th>
                    <th class="text-center" colspan="6" style="vertical-align: middle;">ສາສະໜາຄຣິດ</th>
                    <th class="text-center" colspan="2" rowspan="3" style="vertical-align: middle;">ສາສະໜາບາຮາຍ</th>
                    <th class="text-center" colspan="2" rowspan="3" style="vertical-align: middle;">ສາສະໜາອິດສະລາມ</th>
                    <th class="text-center" colspan="2" rowspan="3" style="vertical-align: middle;">ຄວາມເຊື່ອອື່ນ</th>

                </tr>

                <tr>

                    <th class="text-center" colspan="2" rowspan="2" style="vertical-align: middle;">ໂຣມັນ ກາໂທລິກ</th>
                    <th class="text-center" colspan="4" style="vertical-align: middle;">ໂປເຕັດສຕັງ</th>
                </tr>

                <tr>
                    <th class="text-center" colspan="2" style="vertical-align: middle;">ຂ່າວປະເສີດ</th>
                    <th class="text-center" colspan="2" style="vertical-align: middle;">ຄະນະວັນເສົາ</th>
                </tr>
                <tr>
                    <?php for ($i = 0; $i < 14; $i++) : ?>
                        <td class="text-center"><?= Yii::t('app', $i % 2 == 0 ? 'Total' : 'Women') ?></td>
                    <?php endfor; ?>
                </tr>

            </thead>
            <tbody>
                <?php $sum_buddhis_total = 0; ?>
                <?php $sum_buddhis_women = 0; ?>
                <?php $sum_christ_cato_total = 0; ?>
                <?php $sum_christ_cato_women = 0; ?>

                <?php $sum_christ_news_total = 0; ?>
                <?php $sum_christ_news_women = 0; ?>
                <?php $sum_christ_sat_total = 0; ?>
                <?php $sum_christ_sat_women = 0; ?>
                <?php $sum_bahai_total = 0; ?>
                <?php $sum_bahai_women = 0; ?>
                <?php $sum_idslam_total = 0; ?>
                <?php $sum_idslam_women = 0; ?>
                <?php $sum_other_total = 0; ?>
                <?php $sum_other_women = 0; ?>
                


                <?php foreach ($models as $index => $model) : ?>
                    <?php $total_col = []; ?>

                    <tr>
                        <td class="text-center"><?= $index + 1 ?></td>
                        <td><?= $model['province_name'] ?></td>
                        <?php foreach ($cols as $col) : ?>

                            <td class="text-center">
                                <?= number_format($model[$col]) ?>


                                <?php if ($col == 'buddhis_total') : ?>
                                    <?php $sum_buddhis_total = $sum_buddhis_total + $model[$col]; ?>
                                <?php endif; ?>

                                <?php if ($col == 'buddhis_women') : ?>
                                    <?php $sum_buddhis_women = $sum_buddhis_women + $model[$col]; ?>
                                <?php endif; ?>

                                <?php if ($col == 'christ_cato_total') : ?>
                                    <?php $sum_christ_cato_total = $sum_christ_cato_total + $model[$col]; ?>
                                <?php endif; ?>

                                <?php if ($col == 'christ_cato_women') : ?>
                                    <?php $sum_christ_cato_women = $sum_christ_cato_women + $model[$col]; ?>
                                <?php endif; ?>

                                <?php if ($col == 'christ_news_total') : ?>
                                    <?php $sum_christ_news_total = $sum_christ_news_total + $model[$col]; ?>
                                <?php endif; ?>

                                <?php if ($col == 'christ_news_women') : ?>
                                    <?php $sum_christ_news_women = $sum_christ_news_women + $model[$col]; ?>
                                <?php endif; ?>


                                <?php if ($col == 'christ_sat_total') : ?>
                                    <?php $sum_christ_sat_total = $sum_christ_sat_total + $model[$col]; ?>
                                <?php endif; ?>

                                <?php if ($col == 'christ_sat_women') : ?>
                                    <?php $sum_christ_sat_women = $sum_christ_sat_women + $model[$col]; ?>
                                <?php endif; ?>

                                <?php if ($col == 'bahai_total') : ?>
                                    <?php $sum_bahai_total = $sum_bahai_total + $model[$col]; ?>
                                <?php endif; ?>

                                <?php if ($col == 'bahai_women') : ?>
                                    <?php $sum_bahai_women = $sum_bahai_women + $model[$col]; ?>
                                <?php endif; ?>


                                <?php if ($col == 'idslam_total') : ?>
                                    <?php $sum_idslam_total = $sum_idslam_total + $model[$col]; ?>
                                <?php endif; ?>

                                <?php if ($col == 'idslam_women') : ?>
                                    <?php $sum_idslam_women= $sum_idslam_women+ $model[$col]; ?>
                                <?php endif; ?>



                                <?php if ($col == 'other_total') : ?>
                                    <?php $sum_other_total = $sum_other_total + $model[$col]; ?>
                                <?php endif; ?>

                                <?php if ($col == 'other_women') : ?>
                                    <?php $sum_other_women = $sum_other_women + $model[$col]; ?>
                                <?php endif; ?>

                                
                                
                                
                                
                            </td>

                        <?php endforeach; ?>
                        
                    </tr>


                <?php endforeach; ?>

                <tr>
                    <th style="width: 10%" class="text-center" colspan="2">ລວມ</th>
                    <th style="width: 10%" class="text-center"><?= number_format($sum_buddhis_total); ?></th>
                    <th style="width: 10%" class="text-center"><?= number_format($sum_buddhis_women); ?></th>

                    <th style="width: 10%" class="text-center"><?= number_format($sum_christ_cato_total); ?></th>
                    <th style="width: 10%" class="text-center"><?= number_format($sum_christ_cato_women); ?></th>

                    <th style="width: 10%" class="text-center"><?= number_format($sum_christ_news_total); ?></th>
                    <th style="width: 10%" class="text-center"><?= number_format($sum_christ_news_women); ?></th>



                    <th style="width: 10%" class="text-center"><?= number_format($sum_christ_sat_total); ?></th>
                    <th style="width: 10%" class="text-center"><?= number_format($sum_christ_sat_women); ?></th>


                    <th style="width: 10%" class="text-center"><?= number_format($sum_bahai_total); ?></th>
                    <th style="width: 10%" class="text-center"><?= number_format($sum_bahai_women); ?></th>


                    <th style="width: 10%" class="text-center"><?= number_format($sum_idslam_total); ?></th>
                    <th style="width: 10%" class="text-center"><?= number_format($sum_idslam_women); ?></th>

                    <th style="width: 10%" class="text-center"><?= number_format($sum_other_total); ?></th>
                    <th style="width: 10%" class="text-center"><?= number_format($sum_other_women); ?></th>

                </tr>

            </tbody>
        </table>
    </div>
</div>