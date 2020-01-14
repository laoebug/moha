<?php
/**
 * Created by PhpStorm.
 * User: adsavin
 * Date: 09/04/2017
 * Time: 14:56
 */
/* @var $model app\models\StatOfficerAgeDetail */
$titles = [
    '_u25' => 'ອາຍຸຕໍ່າກວ່າ 25 ປີ',
    '_25_30' => 'ອາຍຸ 25 ຫາ 30 ປີ',
    '_31_35' => 'ອາຍຸ 31 ຫາ 35 ປີ',
    '_36_40' => 'ອາຍຸ 36 ຫາ 40 ປີ',
    '_41_45' => 'ອາຍຸ 41 ຫາ 45 ປີ',
    '_46_50' => 'ອາຍຸ 46 ຫາ 50 ປີ',
    '_51_55' => 'ອາຍຸ 51 ຫາ 55 ປີ',
    '_56_60' => 'ອາຍຸ 56 ຫາ 60 ປີ',
    '_61u' => 'ອາຍຸ 61 ປີ ຂຶ້ນໄປ',
];
?>
<style type="text/css" media="print">
    @page {
        size: landscape;
    }
</style>
<div class="row">
    <div class="col-sm-12" style="overflow-x: scroll">
        <div class="card">
            <div class="card-title-w-btn ">
                <h3 class="title">ຈຳນວນລັດຖະກອນ ແຍກຕາມເກນອາຍຸ ປີ (<?= $year->year ?>)</h3>
            </div>
            <div class="card-body">
                <table class="table table-bordered table-hover">
                    <thead>
                    <tr>
                        <th class="text-center" rowspan="3"><?= Yii::t('app', 'No.') ?></th>
                        <th class="text-center" rowspan="3">ຊື່ພາກສ່ວນຕ່າງໆ</th>
                        <th class="text-center" rowspan="2" colspan="2">ຈຳນວນລັດຖະກອນ ທັງໝົດ</th>
                        <th class="text-center" colspan="<?= count($titles) * 2 ?>">ເກນອາຍຸ</th>
                    </tr>
                    <tr>
                        <?php foreach ($titles as $title): ?>
                            <th class="text-center" colspan="2"><?= $title ?></th>
                        <?php endforeach; ?>
                    </tr>
                    <tr>
                        <th class="text-center">ລ</th>
                        <th class="text-center">ຍ</th>
                        <?php foreach ($titles as $title): ?>
                            <th class="text-center">ລ</th>
                            <th class="text-center">ຍ</th>
                        <?php endforeach; ?>
                    </tr>
                    </thead>
                    <tbody>
                    <?php
                    if (isset($models)) :
                        $sum = ['total' => 0, 'women' => 0];
                        foreach ($models as $i => $model):
                            foreach ($titles as $key => $title) {
                                $sum['total'] += $model['total' . $key];
                                $sum['women'] += $model['women' . $key];
                            }
                            ?>
                            <tr>
                                <td class="text-center"><?= $i + 1 ?></td>
                                <td><?= $model['name'] ?></td>
                                <td class="text-center"><?= number_format($sum['total']) ?></td>
                                <td class="text-center"><?= number_format($sum['women']) ?></td>
                                <?php foreach ($titles as $key => $title): ?>
                                    <td class="text-center"><?= number_format($model['total' . $key]) ?></td>
                                    <td class="text-center"><?= number_format($model['women' . $key]) ?></td>
                                <?php endforeach; ?>
                            </tr>
                        <?php endforeach; endif; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
