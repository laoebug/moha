<?php

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
    @page {
        size: landscape;
    }
</style>
<div class="row">
    <div ng-show="models" class="col-sm-12 card" style="margin-top: 2em;overflow-x: scroll">
        <div class="card-title-w-btn ">
            <h3>ການສົມທຽບສະຖິຕິເໜັງຕີງຂອງພົນລະເມືອງ</h3>
        </div>
        <table class="table table-bordered table-hover">
            <thead>
            <tr>
                <th class="text-center" rowspan="2">ປີ</th>
                <th class="text-center" colspan="2">ຈຳນວນພົນລວມທົ່ວປະເທດ</th>
                <th class="text-center" rowspan="2">ຈຳນວນແຂວງ</th>
                <th class="text-center" rowspan="2">ຈຳນວນເມືອງ</th>
                <th class="text-center" rowspan="2">ຈຳນວນບ້ານ</th>
                <th class="text-center" rowspan="2"><?= Yii::t('app', 'Married') ?></th>
                <th class="text-center" rowspan="2"><?= Yii::t('app', 'Divorced') ?></th>
                <th class="text-center" colspan="2"><?= Yii::t('app', 'Born') ?></th>
                <th class="text-center" colspan="2">ເສຍຊີວິດ</th>
                <th class="text-center" colspan="2"><?= Yii::t('app', 'Move-In') ?></th>
                <th class="text-center" colspan="2">ຍ້າຍອອກໄປ</th>
                <th class="text-center" colspan="2"><?= Yii::t('app', 'Real') ?></th>
            </tr>
            <tr>
                <?php for ($i = 0; $i < 12; $i++): ?>
                    <th class="text-center"><?= Yii::t('app', $i % 2 == 0 ? 'T' : 'W') ?></th>
                <?php endfor; ?>
            </tr>
            </thead>
            <tbody>
            <?php foreach ($models as $model): ?>
                <tr>
                    <td><?= $model['year'] ?></td>
                    <?php foreach ($cols as $c): ?>
                        <td class="text-center"><?= $model[$c] ?></td>
                    <?php endforeach; ?>
                </tr>
            <?php endforeach; ?>
            </tbody>
        </table>
    </div>
</div>
