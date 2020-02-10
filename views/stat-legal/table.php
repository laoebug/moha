<?php
/**
 * Created by PhpStorm.
 * User: adsavin
 * Date: 09/04/2017
 * Time: 14:56
 */
?>

<div class="row">
    <div class="col-sm-12">
        <div class="card">
            <div class="card-title-w-btn ">
                <h3 class="title">
                    ສະຖິຕິບັນດານິຕິກຳ ຂະແໜງພາຍໃນທີ່ກຳລັງປັບປຸງ ແລະ ຮ່າງຂຶ້ນໃໝ່
                    (<?= $year->year ?>)</h3>
            </div>
            <div class="card-body">
                <table class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <th class="text-center"><?= Yii::t('app', 'No.')?></th>
                            <th class="text-center">ຊື່ນິຕິກຳ</th>
                            <th class="text-center">ຮ່າງຂຶ້ນໃໝ່</th>
                            <th class="text-center">ປັງປຸງ</th>
                            <th class="text-center">ປະກາດໃຊ້</th>
                            <th class="text-center"><?= Yii::t('app', 'Remark')?></th>
                        </tr>
                    </thead>
                    
                    <tbody>
                    <?php foreach ($models as $t): ?>
                    <?php if(count($t['statLegalDetails'])>0): ?>
                        <tr>
                            <th class="text-center" colspan="6"><?= $t['name'] ?></th>
                        </tr>
                        
                        <?php
                        $sum = ['new' => 0, 'improve' => 0];
                        foreach ($t['statLegalDetails'] as $index => $legalDetail):
                            $sum['new'] += $legalDetail['new'];
                            $sum['improve'] += $legalDetail['improve'];
                            ?>
                            <tr>
                                <td><?=$index+1 ?></td>
                                <td><?=$legalDetail['legal_name']?></td>
                                <td class="text-center" style="width: 15%"><?=$legalDetail['new'] == 1?1:''?></td>
                                <td class="text-center" style="width: 15%"><?=$legalDetail['improve'] == 1?1:''?></td>
                                <td class="text-center"><?=isset($legalDetail['publish'])?$legalDetail['publish']:'-'?></td>
                                <td class="text-center"><?=$legalDetail['remark']?></td>
                            </tr>
                        <?php endforeach; ?>
                        
                        <tr>
                            <th class="text-center" colspan="2"><?= Yii::t('app', 'Total') ?></th>
                            <th class="text-center"><?=$sum['new']?></th>
                            <th class="text-center"><?=$sum['improve']?></th>
                            <th></th>
                            <th></th>
                        </tr>

                        <?php endif; ?>    
                    <?php endforeach; ?>

                    

                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
