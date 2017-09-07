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
            <h3><?= Yii::t('app', 'Statistics of Religion Teacher') ?></h3>
        </div>
        <table class="table table-bordered table-hover">
            <thead>
                <tr>
                    <th class="text-center" rowspan="3"><?= Yii::t('app', 'No.') ?></th>
                    <th class="text-center" rowspan="3"><?= Yii::t('app', 'Province') ?></th>
                    <th class="text-center" colspan="5"><?= Yii::t('app', 'Buddhism') ?></th>
                    <th class="text-center" colspan="6"><?= Yii::t('app', 'Christian') ?></th>
                    <th class="text-center" colspan="2" rowspan="2"><?= Yii::t('app', 'Bahaiy') ?></th>
                    <th class="text-center" colspan="2" rowspan="2"><?= Yii::t('app', 'Idslam') ?></th>
                    <th class="text-center" rowspan="3"><?= Yii::t('app', 'Remark') ?></th>
                </tr>
                <tr>
                    <th class="text-center" rowspan="2"><?= Yii::t('app', 'Monk') ?></th>
                    <th class="text-center" rowspan="2"><?= Yii::t('app', 'Novice') ?></th>
                    <th class="text-center" rowspan="2"><?= Yii::t('app', 'Buddhis Dad') ?></th>
                    <th class="text-center" rowspan="2"><?= Yii::t('app', 'Buddhis Mom') ?></th>
                    <th class="text-center" rowspan="2"><?= Yii::t('app', 'Buddhis Boy') ?></th>
                    <th class="text-center" colspan="2"><?= Yii::t('app', 'News') ?></th>
                    <th class="text-center" colspan="2"><?= Yii::t('app', 'Saturday') ?></th>
                    <th class="text-center" colspan="2"><?= Yii::t('app', 'Catolic') ?></th>
                </tr>
                <tr>
                    <th class="text-center"><?= Yii::t('app', 'T') ?></th>
                    <th class="text-center"><?= Yii::t('app', 'W') ?></th>
                    <th class="text-center"><?= Yii::t('app', 'T') ?></th>
                    <th class="text-center"><?= Yii::t('app', 'W') ?></th>
                    <th class="text-center"><?= Yii::t('app', 'T') ?></th>
                    <th class="text-center"><?= Yii::t('app', 'W') ?></th>
                    <th class="text-center"><?= Yii::t('app', 'T') ?></th>
                    <th class="text-center"><?= Yii::t('app', 'W') ?></th>
                    <th class="text-center"><?= Yii::t('app', 'T') ?></th>
                    <th class="text-center"><?= Yii::t('app', 'W') ?></th>
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
