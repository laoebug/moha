<?php

/* @var $this yii\web\View */
/* @var $searchModel app\models\StatReligionTeacherSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$cols = [
    'buddhis_monk', 'buddhis_novice', 'buddhis_dad', 'buddhis_mom', 'buddhis_boy',
    'christ_novice_total', 'christ_novice_women', 'christ_cato_total', 'christ_cato_women',
    'christ_news_total', 'christ_news_women', 'christ_sat_total', 'christ_sat_women',
    
    'bahai_total', 'bahai_women', 'idslam_total', 'idslam_women'
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
            <h3>ສະຖິຕິ ພະສົງ, ສາມະເນນ, ຄູສອນ ແລະ ຄະນະຮັບຜິດຊອບ ການຈັດຕັ້ງສາສະໜາ  ປະຈຳປີ  <?php echo $year->year; ?> </h3>
        </div>
        <table class="table table-bordered table-hover">
            <tr>
                <th class="text-center" rowspan="4" style="vertical-align: middle;">ລ/ດ</th>

                <th class="text-center" rowspan="4" style="vertical-align: middle;">ແຂວງ</th>
                <th class="text-center" colspan="5" style="vertical-align: middle;">ສາສະໜາພຸດ</th>
                <th class="text-center" colspan="8" style="vertical-align: middle;">ສາສະໜາຄຣິດ</th>


                <th class="text-center" colspan="2" rowspan="3" style="vertical-align: middle;">ສາສະໜາບາຮາຍ</th>
                <th class="text-center" colspan="2" rowspan="3" style="vertical-align: middle;">ສາສະໜາອິດສະລາມ</th>

            </tr>
            <tr>
                <th class="text-center" rowspan="3" style="vertical-align: middle;">ພະ</th>
                <th class="text-center" rowspan="3" style="vertical-align: middle;">ຈົວ</th>
                <th class="text-center" rowspan="3" style="vertical-align: middle;">ພໍ່ຂາວ</th>
                <th class="text-center" rowspan="3" style="vertical-align: middle;">ແມ່ຂາວ</th>
                <th class="text-center" rowspan="3" style="vertical-align: middle;">ສັງກະລີ</th>

                <th class="text-center" colspan="4" style="vertical-align: middle;">ໂຣມັນກາໂທລິກ</th>
                <th class="text-center" colspan="4" style="vertical-align: middle;">ໂປເຕັດສຕັງ</th>

            </tr>

            <tr>

                <th class="text-center" colspan="2" style="vertical-align: middle;">ນັກບວດ</th>
                <th class="text-center" colspan="2" style="vertical-align: middle;">ຄູຄໍາສອນ</th>
                <th class="text-center" colspan="2" style="vertical-align: middle;">ຂ່າວປະເສີດ</th>
                <th class="text-center" colspan="2" style="vertical-align: middle;">ຄະນະວັນເສົາ</th>

            </tr>

            <tr>

                <?php for ($i = 0; $i < 6; $i++) : ?>
                    <th class="text-center" style="vertical-align: middle;">ລວມ</th>
                    <th class="text-center" style="vertical-align: middle;">ຍິງ</th>
                <?php endfor; ?>

            </tr>

            <tr>
                <th class="text-center" colspan="2">ລວມ</th>
                <?php foreach ($cols as $col) : ?>
                    <th class="text-center"><?= number_format($sum[$col]) ?></th>
                <?php endforeach; ?>
                
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