<?php
/**
 * Created by PhpStorm.
 * User: adsavin
 * Date: 09/04/2017
 * Time: 14:56
 */

$sum = ['department' => 0, 'province' => 0, 'district' => 0];
if (isset($ministries))
    foreach ($ministries as $m) $sum['department'] += $m['department'];

if (isset($provinces))
    foreach ($provinces as $m) {
        $sum['province'] += $m['province'];
        $sum['district'] += $m['district'];
    }
?>
<div class="row">
    <div class="col-sm-12">
        <div class="card">
            <div class="card-title-w-btn ">
                <h3 class="title">ສະຖິຕິອົງການບໍຫານລັດທີ່ໄດ້ຈັດຕັ້ງປະຕິບັດກົນໄກການບໍລິການຜ່ານປະຕູດຽວ
                    (<?= isset($year) ? $year->year : '' ?>
                    )</h3>
            </div>
            <div class="card-body">
                <table class="table table-responsive table-bordered">
                    <?php if (isset($ministries)) : ?>
                        <tbody>
                        <tr>
                            <th colspan="6">ຂັ້ນສູນກາງ ແລະ ຂັ້ນທ້ອງຖິ່ນ</th>
                        </tr>
                        <tr>
                            <th colspan="6">I. ຂັ້ນສູນກາງ</th>
                        </tr>
                        <tr>
                            <th style="width: 10px">ລ/ດ</th>
                            <th class="text-center">ຊື່ກະຊວງ</th>
                            <th class="text-center" colspan="2">ຂັ້ນກົມ</th>
                            <th class="text-center">ຊື່ຈຸດບໍລິການຜ່ານປະຕູດຽວ</th>
                            <th class="text-center">ປີຈັດຕັ້ງປະຕິບັດ</th>
                        </tr>
                        <?php
                        foreach ($ministries as $i => $m): ?>
                            <tr style="cursor:pointer;">
                                <td><?= $i + 1 ?></td>
                                <td><?= $m['name'] ?></td>
                                <td class="text-center" colspan="2"><?= number_format($m['department']) ?></td>
                                <td class="text-center"><?= $m['servicename'] ?></td>
                                <td class="text-center"><?= $m['year'] ?></td>
                            </tr>
                        <?php endforeach; ?>
                        <tr>
                            <th class="text-center" colspan="2">ລວມ</th>
                            <th colspan="2" class="text-center">
                                <?= number_format($sum['department']) ?>
                            </th>
                        </tr>
                        </tbody>
                    <?php
                    endif; ?>
                    <?php if (isset($provinces)) : ?>
                        <tbody>
                        <tr>
                            <th colspan="6">II. ຂັ້ນທ້ອງຖິ່ນ</th>
                        </tr>
                        <tr>
                            <th style="width: 10px">ລ/ດ</th>
                            <th class="text-center">ຊື່ແຂວງ</th>
                            <th class="text-center">ຂັ້ນແຂວງ (ພະແນກ)</th>
                            <th class="text-center">ຂັ້ນເມືອງ</th>
                            <th class="text-center">ຊື່ຈຸດບໍລິການຜ່ານປະຕູດຽວ</th>
                            <th class="text-center">ປີຈັດຕັ້ງປະຕິບັດ</th>
                        </tr>
                        <?php
                        foreach ($provinces as $i => $m): ?>
                            <tr style="cursor:pointer;">
                                <td><?= $i + 1 ?></td>
                                <td><?= $m['province_name'] ?></td>
                                <td class="text-center"><?= number_format($m['province']) ?></td>
                                <td class="text-center"><?= number_format($m['district']) ?></td>
                                <td class="text-center"><?= $m['servicename'] ?></td>
                                <td class="text-center"><?= $m['year'] ?></td>
                            </tr>
                        <?php endforeach; ?>
                        <tr>
                            <th class="text-center" colspan="2">ລວມ</th>
                            <th class="text-center">
                                <?= number_format($sum['province']) ?>
                            </th>
                            <th class="text-center">
                                <?= number_format($sum['district']) ?>
                            </th>
                        </tr>
                        </tbody>
                    <?php endif; ?>
                </table>
            </div>
        </div>
    </div>
</div>
