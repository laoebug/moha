<?php

/* @var $this yii\web\View */
/* @var $searchModel app\models\StatReligionTeacherSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$cols = [
    'buddhis_total', 'buddhis_monk','buddhis_nomonk', 'buddhis_sim', 'buddhis_nosim','buddhis_agreement_built_temple','buddhis_no_agreement_built_temple',
    'christ_news_total', 'christ_news_not', 'christ_sat_total', 'christ_sat_not', 'christ_cato_total', 'christ_cato_not',
    'bahai_total', 'bahai_not', 'idslam_total', 'idslam_not'
];
$sum = [];
foreach ($cols as $col) $sum[$col] = 0;
foreach ($models as $model)
    foreach ($cols as $col)
        $sum[$col] += $model[$col];

?>
<style type="text/css" media="print">
    @page { size: landscape; }
</style>
<div class="row">
    <div ng-show="models" class="col-sm-12 card" style="margin-top: 2em;overflow-x: scroll">
        <div class="card-title-w-btn ">
            <h3><?= Yii::t('app', 'ສະຖຕິສາສະນະສະຖານ ໃນທົ່ວປະເທດສົກປີ'). " " . $year->year ?></h3>
        </div>
        <table class="table table-bordered table-hover">
            <thead>
                <tr>
                    <th class="text-center" rowspan="3"><?= Yii::t('app', 'No.') ?></th>
                    <th class="text-center" rowspan="3"><?= Yii::t('app', 'Province') ?></th>
                    <th class="text-center" colspan="7">ສາສະໜາພຸດ</th>
                    <th class="text-center" colspan="6">ສາສະໜາເຍຊູຄຣິດ</th>
                    <th class="text-center" colspan="2">ສາສະໜາບາຮາຍ</th>
                    <th class="text-center" colspan="2">ສາສະໜາອິດສະລາມ</th>
                    
                </tr>
                <tr>
                    <th class="text-center" colspan="7">ວັດ</th>
                    <th class="text-center" colspan="2">ຂ່າວປະເສີດ (ໂບດ)</th>
                    <th class="text-center" colspan="2">ຄະນະວັນເສົາ (ໂບດ)</th>
                    <th class="text-center" colspan="2">ກາໂຕລິກ (ໂບດ)</th>
                    <th class="text-center" colspan="2">ສາສະໜາບາຮາຍ (ທຳມະສະພາ)</th>
                    <th class="text-center" colspan="2">ສາສະໜາອິດສະລາມ (ສຸເຫຼົ່າຫຼື ມັດສະຍິດ)</th>
                </tr>
                <tr>
                    <th class="text-center">ລວມ</th>
                    <th class="text-center">ມີພະສົງ</th>
                    <th class="text-center">ບໍ່ມີພະສົງ</th>
					<th class="text-center">ມີສິມ</th>
					<th class="text-center">ບໍ່ມີສິມ</th>                                
					<th class="text-center">ມີຂໍ້ຕົກລົງສ້າງວັດ</th>
					<th class="text-center">ບໍ່ມີຂໍ້ຕົກລົງສ້າງວັດ</th>
                    <?php for ($i=0;$i<10;$i++): ?>
                        <th class="text-center"><?= Yii::t('app', $i%2==0?'ລວມ':'ບໍ່ຮັບຮູ້') ?></th>
                    <?php endfor; ?>
                </tr>
                <tr>
                    <th class="text-center" colspan="1"><?= Yii::t('app', 'Total') ?></th>
                        <?php foreach ($cols as $col): ?>
                            <th class="text-center"><?=number_format($sum[$col]) ?></th>
                        <?php endforeach; ?>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($models as $index => $model): ?>
                    <tr>
                        <td class="text-center"><?= $index + 1 ?></td>
                        <td class="text-center"><?= $model['province_name'] ?></td>
                        <?php foreach ($cols as $col): ?>
                            <td class="text-center"><?= number_format($model[$col]) ?></td>
                        <?php endforeach; ?>                        
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>
</div>
