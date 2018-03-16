<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\StatReligionTeacherSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

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
            <h3>ການເກັບກຳສະຖິຕິເໜັງຕີງຂອງພົນລະເມືອງຂອງກະຊວງພາຍໃນ
                <?= ' ('. $year->year.')' ?></h3>
        </div>
        <table class="table table-bordered table-hover">
            <thead>
                <tr>
                    <th class="text-center" rowspan="2"><?= Yii::t('app', 'No.') ?></th>
                    <th class="text-center" rowspan="2"><?= Yii::t('app', 'Province') ?></th>
                    <th class="text-center" rowspan="2"><?= Yii::t('app', 'District') ?></th>
                    <th class="text-center" rowspan="2"><?= Yii::t('app', 'Village') ?></th>
                    <th class="text-center" colspan="2">ຈຳນວນພົນລະເມືອງ</th>
                    <th class="text-center" colspan="2"><?= Yii::t('app', 'Born') ?></th>
                    <th class="text-center" colspan="2">ເສຍຊີວິດ</th>
                    <th class="text-center" rowspan="2"><?= Yii::t('app', 'Married') ?></th>
                    <th class="text-center" rowspan="2"><?= Yii::t('app', 'Divorced') ?></th>
                    <th class="text-center" colspan="2"><?= Yii::t('app', 'Move-In') ?></th>
                    <th class="text-center" colspan="2">ຍ້າຍອອກໄປ</th>
                    <th class="text-center" colspan="2"><?= Yii::t('app', 'Real') ?></th>
                </tr>
                <tr>
                    <?php for ($i=0;$i<12;$i++): ?>
                    <th class="text-center"><?= Yii::t('app', $i%2==0?'T':'W') ?></th>
                    <?php endfor; ?>
                </tr>
                <tr>
                    <th class="text-center" colspan="2"><?= Yii::t('app', 'Total') ?></th>
                    <?php foreach ($cols as $col): ?>
                        <th class="text-center"><?=number_format($sum[$col]) ?></th>
                    <?php endforeach; ?>
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
