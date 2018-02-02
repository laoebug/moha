<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\StatReligionTeacherSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$cols = [
    'buddhis_monk', 'buddhis_novice', 'buddhis_dad', 'buddhis_mom', 'buddhis_boy',
    'christ_news_total', 'christ_news_women', 'christ_sat_total', 'christ_sat_women', 'christ_cato_total', 'christ_cato_women',
    'bahai_total', 'bahai_women', 'idslam_total', 'idslam_women'
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
            <h3>ສະຖິຕິພະສົງ ແລະ ຄູສອນສາສະໜາ ໃນທົ່ວປະເທດ</h3>
        </div>
        <table class="table table-bordered table-hover">
            <thead>
            <tr>
                <th class="text-center" rowspan="3"><?= Yii::t('app', 'No.') ?></th>
                <th class="text-center" rowspan="3"><?= Yii::t('app', 'Province') ?></th>
                <th class="text-center" colspan="5">ສາສະໜາພຸດ</th>
                <th class="text-center" colspan="6">ສາສະໜາເຍຊູຄຣິດ</th>
                <th class="text-center" colspan="2" rowspan="2">ສາສະໜາບາຮາຍ</th>
                <th class="text-center" colspan="2" rowspan="2">ສາສະໜາອິດສະລາມ</th>
                <th class="text-center" rowspan="3"><?= Yii::t('app', 'Remark') ?></th>
            </tr>
            <tr>
                <th class="text-center" rowspan="2">ພະ</th>
                <th class="text-center" rowspan="2">ຈົວ</th>
                <th class="text-center" rowspan="2">ພໍ່ຂາວ</th>
                <th class="text-center" rowspan="2">ແມ່ຂາວ</th>
                <th class="text-center" rowspan="2">ສັງກະລີ</th>
                <th class="text-center" colspan="2">ຂ່າວປະເສີດ</th>
                <th class="text-center" colspan="2">ວັນເສົາ</th>
                <th class="text-center" colspan="2">ກາໂຕລິກ</th>
            </tr>
            <tr>
                <th class="text-center"><?= Yii::t('app', 'Total') ?></th>
                <th class="text-center"><?= Yii::t('app', 'Women') ?></th>
                <th class="text-center"><?= Yii::t('app', 'Total') ?></th>
                <th class="text-center"><?= Yii::t('app', 'Women') ?></th>
                <th class="text-center"><?= Yii::t('app', 'Total') ?></th>
                <th class="text-center"><?= Yii::t('app', 'Women') ?></th>
                <th class="text-center"><?= Yii::t('app', 'Total') ?></th>
                <th class="text-center"><?= Yii::t('app', 'Women') ?></th>
                <th class="text-center"><?= Yii::t('app', 'Total') ?></th>
                <th class="text-center"><?= Yii::t('app', 'Women') ?></th>
            </tr>
                <tr>
                    <th class="text-center" colspan="2"><?= Yii::t('app', 'Total') ?></th>
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
                        <td class="text-center"><?= $model['remark'] ?></td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>
</div>
