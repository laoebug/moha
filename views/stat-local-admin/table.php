<?php
/**
 * Created by PhpStorm.
 * User: adsavin
 * Date: 09/04/2017
 * Time: 14:56
 */
$cols = [
        'province_head_total', 'province_head_women', 'province_vice_total', 'province_vice_women',
        'district_head_total', 'district_head_women', 'district_vice_total', 'district_vice_women',
        'village_head_total', 'village_head_women', 'village_vice_total', 'village_vice_women',
        'population_total', 'population_women', 'village', 'family_total', 'family_poor'
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
    <div class="col-sm-12">
        <div class="card">
            <div class="card-title-w-btn ">
                <h3 class="title">
                    ສະຖິຕິການປົກຄອງທ້ອງຖິ່ນ
                    (<?= $year->year ?>)</h3>
            </div>
            <div class="card-body">
                <table class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <th class="text-center" rowspan="2"><?= Yii::t('app', 'No.') ?></th>
                            <th class="text-center" rowspan="2"><?= Yii::t('app', 'Province') ?></th>
                            <th class="text-center" colspan="2">ເຈົ້າແຂວງ</th>
                            <th class="text-center" colspan="2">ຮອງເຈົ້າແຂວງ</th>
                            <th class="text-center" colspan="2">ເຈົ້າເມືອງ</th>
                            <th class="text-center" colspan="2">ຮອງເຈົ້າເມືອງ</th>
                            <th class="text-center" colspan="2">ນາຍບ້ານ</th>
                            <th class="text-center" colspan="2">ຮອງນາຍບ້ານ</th>
                            <th class="text-center" colspan="2">ພົນລະເມືອງ</th>
                            <th class="text-center">ບ້ານ</th>
                            <th class="text-center" colspan="2">ຄອບຄົວ</th>
                        </tr>
                        <tr>
                            <?php for ($i = 0; $i < 7; $i++): ?>
                                <th class="text-center"><?= Yii::t('app', 'Total') ?></th>
                                <th class="text-center"><?= Yii::t('app', 'Women') ?></th>
                            <?php endfor; ?>
                            <th class="text-center"><?= Yii::t('app', 'Total') ?></th>
                            <th class="text-center"><?= Yii::t('app', 'Total') ?></th>
                            <th class="text-center">ທຸກຍາກ</th>
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