<?php
/**
 * Created by PhpStorm.
 * User: adsavin
 * Date: 09/04/2017
 * Time: 14:56
 */
$cols = [
    'capital_head_total', 'capital_head_women', 'capital_vice_total', 'capital_vice_women',
    'province_head_total', 'province_head_women', 'province_vice_total', 'province_vice_women',
    'city_head_total', 'city_head_women', 'city_vice_total', 'city_vice_women',
    'district_head_total', 'district_head_women', 'district_vice_total', 'district_vice_women',
    'village_head_total', 'village_head_women', 'village_vice_total', 'village_vice_women',
    'village_approved', 'village_pending'
];
$titles = [
    'ເຈົ້າຄອງ ນະຄອນຫຼວງ',
    'ຮອງເຈົ້າຄອງ ນະຄອນຫຼວງ',
    'ເຈົ້າແຂວງ',
    'ຮອງເຈົ້າແຂວງ',
    'ເຈົ້ານະຄອນ',
    'ຮອງເຈົ້ານະຄອນ',
    'ເຈົ້າເມືອງ',
    'ຮອງເຈົ້າເມືອງ',
    'ນາຍບ້ານ',
    'ຮອງນາຍບ້ານ',
    'ບ້ານທີ່ໄດ້ປັບປຸງ ເປັນ 5 ໜ່ວຍງານ',
];
$sum = [];
foreach ($cols as $col) $sum[$col] = 0;

if (isset($models))
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
    <div class="col-sm-12">
        <div class="card" style="width:120vw;">
            <div class="card-title-w-btn ">
                <h3 class="title">
                    ສະຖິຕິການປົກຄອງທ້ອງຖິ່ນ
                    (<?= @$year->year ?>)</h3>
            </div>
            <div class="card-body">
                <table class="table table-bordered table-hover">
                    <thead>
                    <tr>
                        <th class="text-center" rowspan="2"><?= Yii::t('app', 'No.') ?></th>
                        <th class="text-center" rowspan="2"><?= Yii::t('app', 'Province') ?></th>
                        <?php foreach ($titles as $title): ?>
                            <th class="text-center" colspan="2"><?= $title ?></th>
                        <?php endforeach; ?>
                    </tr>
                    <tr>
                        <?php for ($i = 0; $i < count($titles) - 1; $i++): ?>
                            <th class="text-center"><?= Yii::t('app', 'Total') ?></th>
                            <th class="text-center"><?= Yii::t('app', 'Women') ?></th>
                        <?php endfor; ?>
                        <td class="text-center" style="width: 8%">ປັບປຸງແລ້ວ</td>
                        <td class="text-center" style="width: 8%">ຍັງບໍ່ປັບປຸງ</td>
                    </tr>
                    <tr>
                        <th class="text-center" colspan="2"><?= Yii::t('app', 'Total') ?></th>
                        <?php foreach ($cols as $col): ?>
                            <th class="text-center"><?= number_format($sum[$col]) ?></th>
                        <?php endforeach; ?>
                    </tr>
                    </thead>
                    <tbody>
                    <?php foreach ($models as $index => $model): ?>
                        <tr>
                            <td class="text-center"><?= $index + 1 ?></td>
                            <td><?= $model['province_name'] ?></td>
                            <?php foreach ($cols as $col): ?>
                                <td class="text-center"><?= number_format($model[$col]) ?></td>
                            <?php endforeach; ?>
                        </tr>
                    <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
