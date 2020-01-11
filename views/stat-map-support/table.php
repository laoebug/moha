<?php
/**
 * Created by PhpStorm.
 * User: adsavin
 * Date: 09/04/2017
 * Time: 14:56
 */
$cols = [
    'dev_total', 'dev_continue', 'dev_new',
    'strong_total', 'strong_continue', 'strong_new',
    'big'
];
$titles = [
    'ບ້ານເປົ້າໝາຍ 3 ສ້າງໃນການສ້າງເປັນເບ້ານພັດທະນາ' => ['ຈ/ນ ບ້ານ', 'ບ້ານສືບຕໍ່', 'ບ້ານກໍານົດ ໃໝ່',],
    'ເປົ້າໝາຍເມືອງເຂັ້ມແຂງຮອບດ້ານ' => ['ຈ/ນ ເມືອງ', 'ເມືອງສືບຕໍ່', 'ເມືອງກໍານົດໃໝ່',],
    'ເປົ້າໝາຍສ້າງບ້ານໃຫຍ່ເປັນຕົວເມືອງໃນຊົນນະບົດ' => ['ຈ/ນ ບ້ານ/ກຸ່ມບ້ານ'],
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
        <div class="card">
            <h3 class="text-center">ສັງລວມຈໍານວນບ້ານເປົ້າໝາຍ 3 ສ້າງໃນການສ້າງເປັນບ້ານພັດທະນາ</h3>
            <p class="text-center">
                ເປົ້າໝາຍເມືອງເຂັ້ມແຂງຮອບດ້ານ ແລະ ເປົ້າໝາຍສ້າງບ້ານໃຫຍ່ເປັນຕົວເມືອງໃນຊົນນະບົດ ທົ່ວປະເທດ
                (<?= @$year->year ?>)
            </p>
            <div class="card-body">
                <table class="table table-bordered table-hover">
                    <thead>
                    <tr>
                        <th class="text-center" rowspan="2"><?= Yii::t('app', 'No.') ?></th>
                        <th class="text-center" rowspan="2"><?= Yii::t('app', 'Province') ?></th>
                        <?php foreach ($titles as $n => $title): ?>
                            <th class="text-center" colspan="<?= count($title) ?>"><?= $n ?></th>
                        <?php endforeach; ?>
                    </tr>
                    <tr>
                        <?php foreach ($titles as $n => $title): ?>
                            <?php foreach ($title as $m => $t): ?>
                                <th class="text-center">
                                    <?= $t ?>
                                </th>
                            <?php endforeach; ?>
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
                    <tr>
                        <th class="text-center" colspan="2"><?= Yii::t('app', 'Total') ?></th>
                        <?php foreach ($cols as $col): ?>
                            <th class="text-center"><?= number_format($sum[$col]) ?></th>
                        <?php endforeach; ?>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
