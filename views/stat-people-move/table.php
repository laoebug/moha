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
            <h3>ການເກັບກຳສະຖິຕິເໜັງຕີງຂອງພົນລະເມືອງຂອງກະຊວງພາຍໃນ
                <?= ' (' . $year->year . ')' ?></h3>
        </div>
        <table class="table table-bordered table-hover">
            <thead>
                <tr>
                    <th class="text-center" rowspan="3">ລຳດັບ</th>
                    <th class="text-center" rowspan="3">ແຂວງ</th>
                    <th class="text-center" colspan="3" rowspan="2">ຈຳນວນ</th>
                    <th class="text-center" colspan="2" rowspan="2">ຈຳນວນ ພົນລະເມືອງ ຍົກມາ</th>
                    <th class="text-center" colspan="2" rowspan="2">ຈຳນວນເກີດ</th>
                    <th class="text-center" rowspan="3">ແຕ່ງດອງ ລາວ-ລາວ</th>
                    <th class="text-center" rowspan="3">ແຕ່ງດອງ ລາວ-ຕ່າງປະເທດ</th>
                    <th class="text-center" rowspan="3">ຢ່າຮ້າງ ລາວ-ລາວ</th>
                    <th class="text-center" rowspan="3">ຢ່າຮ້າງ ລາວ-ຕ່າງປະເທດ</th>
                    <th class="text-center" colspan="4">ການຈົດທະບຽນ ສັນຊາດລາວ</th>
                    <th class="text-center" colspan="4">ການປ່ຽນຊື່ ຫຼື ນາມສະກຸນ</th>
                    <th class="text-center" colspan="6">ການຍົກຍ້າຍມາ</th>
                    <th class="text-center" colspan="6">ການຍົກຍ້າຍໄປ</th>
                    <th class="text-center" colspan="2" rowspan="2">ຈຳນວນ ເສຍຊີວິດ</th>
                    <th class="text-center" colspan="2" rowspan="2">ຈຳນວນ ພົນລະເມືອງ ຕົວຈິງ</th>
                </tr>
                <tr>
                    <th class="text-center" colspan="2">ການໄດ້ສັນຊາດລາວ</th>
                    <th class="text-center" colspan="2">ການປະສັນຊາດລາວ</th>
                    <th class="text-center" colspan="2">ຊື່</th>
                    <th class="text-center" colspan="2">ນາມສະກຸນ</th>
                    <th class="text-center" colspan="2">ບ້ານ-ບ້ານ</th>
                    <th class="text-center" colspan="2">ເມືອງ-ເມືອງ</th>
                    <th class="text-center" colspan="2">ແຂວງ-ແຂວງ</th>
                    <th class="text-center" colspan="2">ບ້ານ-ບ້ານ</th>
                    <th class="text-center" colspan="2">ເມືອງ-ເມືອງ</th>
                    <th class="text-center" colspan="2">ແຂວງ-ແຂວງ</th>
                </tr>
                <tr>
                    <th class="text-center">ເມືອງ</th>
                    <th class="text-center">ບ້ານ</th>
                    <th class="text-center">ຄອບຄົວ</th>
                    <?php for ($i = 0; $i < 14; $i++) : ?>
                        <th class="text-center">ລ</th>
                        <th class="text-center">ຍ</th>
                    <?php endfor; ?>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($models as $n => $model) : ?>
                    <tr>
                        <td><?= $n + 1 ?></td>
                        <td><?= $model['province_name'] ?></td>
                        <?php foreach ($cols as $col) : ?>
                            <td class="text-center"><?= number_format($model[$col]) ?></td>
                        <?php endforeach; ?>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>
</div>