<?php
/**
 * Created by PhpStorm.
 * User: adsavin
 * Date: 09/04/2017
 * Time: 14:56
 */
/* @var $model app\models\StatOfficerAgeDetail */
$titles = [
    'doctor' => 'ປະລິນຍາເອກ',
    'post_master' => 'ເໜືອປະລິນຍາໂທ',
    'master' => 'ປະລິນຍາໂທ',
    'post_bachelor' => 'ເໜືອປະລິນຍາຕີ',
    'bachelor' => 'ປະລິນຍາຕີ',
    'high' => 'ຊັ້ນສູງ',
    'middle' => 'ຊັ້ນກາງ',
    'begin' => 'ຊັ້ນຕົ້ນ',
    'highschool' => 'ມ/ຍ ປາຍ',
    'second' => 'ມ/ຍ ຕົ້ນ',
    'primary' => 'ປະຖົມ',
];

?>
<style type="text/css" media="print">
    @page {
        size: landscape;
    }
</style>
<div class="row">
    <div class="col-sm-12">
        <div class="card">
            <div class="card-title-w-btn ">
                <h3 class="title">ຈຳນວນລັດຖະກອນແຍກຕາມຊັ້ນວິຊາສະເພາະ (<?= $year->year ?>)</h3>
            </div>
            <div class="card-body">
                <table class="table table-bordered table-hover">
                    <thead>
                    <tr>
                        <th class="text-center" rowspan="3">ລ/ດ</th>
                        <th class="text-center" rowspan="3">ຊື່ພາກສ່ວນຕ່າງໆ</th>
                        <th class="text-center" rowspan="2" colspan="2">ຈຳນວນລັດຖະກອນ ທັງໝົດ</th>
                        <th class="text-center" colspan="16">ຊັ້ນວິຊາສະເພາະ</th>
                        <th class="text-center" colspan="6">ລັດຖະກອນທີ່ບໍ່ມີຊັ້ນວິຊາສະເພາະ</th>
                    </tr>
                    <tr>
                        <?php foreach ($titles as $title): ?>
                            <td class="text-center" colspan="2"><?= $title ?></td>
                        <?php endforeach; ?>
                    </tr>
                    <tr>
                        <th class="text-center"><?= Yii::t('app', 'T') ?></th>
                        <th class="text-center"><?= Yii::t('app', 'W') ?></th>
                        <?php foreach ($titles as $title): ?>
                            <th class="text-center"><?= Yii::t('app', 'T') ?></th>
                            <th class="text-center"><?= Yii::t('app', 'W') ?></th>
                        <?php endforeach; ?>
                    </tr>
                    </thead>
                    <tbody>
                    <?php
                    $sum = ['total' => 0, 'women' => 0];
                    if (isset($models)):
                        foreach ($models as $i => $model):
                            foreach ($titles as $key => $title) {
                                $sum['total'] += $model[$key . '_total'];
                                $sum['women'] += $model[$key . '_women'];
                            }
                            ?>
                            <tr>
                                <td class="text-center"><?= $i + 1 ?></td>
                                <td class="text-center"><?= $model['name'] ?></td>
                                <td class="text-center"><?= number_format($sum['total']) ?></td>
                                <td class="text-center"><?= number_format($sum['women']) ?></td>
                                <?php foreach ($titles as $key => $title): ?>
                                    <td class="text-center"><?= $model[$key . '_total'] ?></td>
                                    <td class="text-center"><?= $model[$key . '_women'] ?></td>
                                <?php endforeach; ?>
                            </tr>
                        <?php endforeach; endif; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
