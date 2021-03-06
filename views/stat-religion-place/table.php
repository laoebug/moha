<?php

/* @var $this yii\web\View */
/* @var $searchModel app\models\StatReligionTeacherSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$cols = [
    'buddhis_total', 'buddhis_monk', 'buddhis_nomonk', 'buddhis_sim', 'buddhis_nosim', 'buddhis_agreement_built_temple', 'buddhis_no_agreement_built_temple',
    'christ_cato_total', 'christ_cato_not','christ_news_total', 'christ_news_not', 'christ_sat_total', 'christ_sat_not',
    'bahai_total', 'bahai_not', 'idslam_total', 'idslam_not'
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
            <h3><?= Yii::t('app', 'ສະຖິຕິສາສະໜາສະຖານ ໃນທົ່ວປະເທດ ປະຈໍາປີ') . " " . $year->year ?></h3>
        </div>
        

        <table class="table table-bordered table-hover">
            <thead>
            <tr>
                  <th class="text-center" colspan="19">
                    ສະຖິຕິສາສະໜາສະຖານ ໃນທົ່ວປະເທດ ປະຈໍາປີ <?php echo $year->year ; ?>
                  </th>
                </tr>
                <tr>


                </tr>
                <th class="text-center" rowspan="4" style="vertical-align: middle;">ລ/ດ</th>
                <th class="text-center" rowspan="4" style="vertical-align: middle;">ແຂວງ</th>
                <th class="text-center" colspan="7" style="vertical-align: middle;" >ສາສະໜາພຸດ</th>
                <th class="text-center" colspan="6" style="vertical-align: middle;">ສາສະໜາຄຣິດ</th>
                <th class="text-center" colspan="2" rowspan="3" style="vertical-align: middle;">ສາສະໜາບາຮາຍ</th>
                <th class="text-center" colspan="2" rowspan="3" style="vertical-align: middle;">ສາສະໜາອິດສະລາມ</th>


                <tr>

                  <th class="text-center" rowspan="3" style="vertical-align: middle;">ລວມ</th>
                  <th class="text-center" rowspan="3" style="vertical-align: middle;">ມີພະສົງ</th>
                  <th class="text-center" rowspan="3" style="vertical-align: middle;">ບໍ່ມີພະສົງ</th>
                  <th class="text-center" rowspan="3" style="vertical-align: middle;">ມີສິມ</th>
                  <th class="text-center" rowspan="3" style="vertical-align: middle;">ບໍ່ມີສິມ</th>
                  <th class="text-center" rowspan="3" style="vertical-align: middle;">ມີຂໍ້ຕົກລົງສ້າງວັດ</th>
                  <th class="text-center" rowspan="3" style="vertical-align: middle;" >ບໍ່ມີຂໍ້ຕົກລົງສ້າງວັດ</th>

                  <th class="text-center" colspan="2" style="vertical-align: middle;">ໂຣມັນກາໂທລິກ</th>

                  <th class="text-center" colspan="4" style="vertical-align: middle;">ໂປເຕັດສຕັງ</th>

                </tr>

                <tr>
                  <th class="text-center" rowspan="2" style="vertical-align: middle;">ລວມ</th>
                  <th class="text-center" rowspan="2" style="vertical-align: middle;">ບໍ່ຮັບຮູ້</th>
                  <th class="text-center" colspan="2" style="vertical-align: middle;">ຂ່າວປະເສີດ</th>
                  <th class="text-center" colspan="2" style="vertical-align: middle;">ຄະນະວັນເສົາ</th>


                </tr>

                <tr>
                  <th style="vertical-align: middle;">ລວມ</th>
                  <th style="vertical-align: middle;" >ບໍ່ຮັບຮູ້</th>

                  <th style="vertical-align: middle;">ລວມ</th>
                  <th style="vertical-align: middle;">ບໍ່ຮັບຮູ້</th>

                  <th style="vertical-align: middle;">ລວມ</th>
                  <th style="vertical-align: middle;">ບໍ່ຮັບຮູ້</th>

                  <th style="vertical-align: middle;">ລວມ</th>
                  <th style="vertical-align: middle;">ບໍ່ຮັບຮູ້</th>

                </tr>




                <tr>
                    <th class="text-center" colspan="1"><?= Yii::t('app', 'Total') ?></th>
                    <?php foreach ($cols as $col) : ?>
                        <th class="text-center"><?= number_format($sum[$col]) ?></th>
                    <?php endforeach; ?>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($models as $index => $model) : ?>
                    <tr>
                        <td class="text-center"><?= $index + 1 ?></td>
                        <td class="text-center"><?= $model['province_name'] ?></td>
                        <?php foreach ($cols as $col) : ?>
                            <td class="text-center"><?= number_format($model[$col]) ?></td>
                        <?php endforeach; ?>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>

    </div>
</div>