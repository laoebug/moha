<?php
/**
 * Created by PhpStorm.
 * User: adsavin
 * Date: 09/04/2017
 * Time: 14:56
 */
?>
<style type="text/css" media="print">
    @page { size: landscape; }
</style>
<div class="row">
    <div class="col-sm-12">
        <div class="card">
            <div class="card-title-w-btn ">
                <h3 class="title">ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນ ແຍກຕາມຊັ້ນ-ຂັ້ນເງິນເດືອນ (ແຕ່ຊັ້ນ I ເຖິງຊັ້ນ V) ປະຈໍາປີ <?= $year->year ?></h3>
            </div>
            <div class="card-body">
                <?php foreach ($models as $model) : ?>
                    <table class="table table-bordered table-hover">
                        <thead>
                        <tr>
                            <th class="text-center" rowspan="4">ລ/ດ</th>
                            <th class="text-center" rowspan="4">ພາກສ່ວນຕ່າງໆ</th>
                            <th class="text-center" rowspan="4" colspan="2">ຈ/ນ ລັດຖະກອນ ທັງໝົດ</th>
                            <th class="text-center" colspan="30">ຈຳນວນລັດຖະກອນທີ່ບັນຈຸຕາມຊັ້ນເງິນເດືອນ</th>
                        </tr>
                        <tr>
                            <th class="text-center" colspan="30">ຊັ້ນ <?= $model[0]['step'] ?></th>
                        </tr>
                        <tr>
                            <?php for ($i = 1; $i < 16; $i++): ?>
                                <th class="text-center" colspan="2">ຂັ້ນ <?= $i ?></th>
                            <?php endfor; ?>
                        </tr>
                        <tr>
                            <?php for ($i = 1; $i < 31; $i++): ?>
                                <th class="text-center"><?= $i % 2 == 0 ? 'ລ' : 'ຍ' ?></th>
                            <?php endfor; ?>
                        </tr>
                        
                        </thead>
                        <tbody>
                        <?php foreach ($model as $mo): ?>
                            <tr>
                                <td colspan="2"><?= $mo['name'] ?></td>
                                <?php
                                $row = ['total' => 0, 'women' => 0];
                                foreach ($mo as $k => $m) {
                                    if (strpos($k, 'total')) $row['total'] += $m;
                                    else if (strpos($k, 'women')) $row['women'] += $m;
                                }
                                ?>
                                <td class="text-center"><?= number_format($row['total']) ?></td>
                                <td class="text-center"><?= number_format($row['women']) ?></td>
                                <?php for ($i = 1; $i < 16; $i++): ?>
                                    <td class="text-center"><?= ($mo['level' . $i . '_total']) ?></td>
                                    <td class="text-center"><?= ($mo['level' . $i . '_women']) ?></td>
                                <?php endfor; ?>
                            </tr>

                            <tr>
                            <th class="text-center" colspan="2">1. ກະຊວງພາຍໃນ ລວມທັງໝົດ</th>
                            <?php
                            $sum = [];
                            foreach ($model as $index => $m) {
                                for ($i = 1; $i < 16; $i++) {
                                    if (!isset($sum['level' . $i . '_total'])) $sum['level' . $i . '_total'] = 0;
                                    $sum['level' . $i . '_total'] += $m['level' . $i . '_total'];

                                    if (!isset($sum['level' . $i . '_women'])) $sum['level' . $i . '_women'] = 0;
                                    $sum['level' . $i . '_women'] += $m['level' . $i . '_women'];
                                }
                            }

                            $total = ['total' => 0, 'women' => 0];
                            foreach ($sum as $k => $s) {
                                if (strpos($k, 'total')) $total['total'] += $sum[$k];
                                else if (strpos($k, 'women')) $total['women'] += $sum[$k];
                            }

                            ?>
                            <th class="text-center"><?= number_format($total['total']) ?></th>
                            <th class="text-center"><?= number_format($total['women']) ?></th>

                            <?php foreach ($sum as $s): ?>
                                <th class="text-center"><?= number_format($s) ?></th>
                            <?php endforeach; ?>
                        </tr>
                        
                        <?php endforeach; ?>
                        </tbody>
                    </table>
                <?php endforeach; ?>
            </div>
        </div>
    </div>
</div>
