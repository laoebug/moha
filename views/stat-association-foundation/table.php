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
                <h3 class="title"><?= Yii::t('app','Statistics of Associations/Foundations') ?> (<?= $year->year ?>)</h3>
            </div>
            <div class="card-body">
                <table class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <th class="text-center"><?= Yii::t('app', 'No.')?></th>
                            <th class="text-center"><?= Yii::t('app', 'Ministry'). '/'.Yii::t('app', 'Province')?></th>
                            <th class="text-center"><?= Yii::t('app', 'Accociations')?></th>
                            <th class="text-center"><?= Yii::t('app', 'Foundations')?></th>
                            <th class="text-center"><?= Yii::t('app', 'Remark')?></th>
                        </tr>
                    </thead>
                    <tbody>
                    <?php
                    $sum = ['association' => 0, 'foundation' => 0];
                    foreach ($models as $t): ?>
                        <tr>
                            <th class="text-center" colspan="6"><?= $t['name'] ?></th>
                        </tr>
                        <?php
                        foreach ($t['approvers'] as $index => $a):
                            $sum['association'] += $a['association'];
                            $sum['foundation'] += $a['foundation'];
                            ?>
                            <tr>
                                <td class="text-center"><?=$index+1 ?></td>
                                <td><?=$t['code']=='M'?$a['ministry']['name']:$a['province']['province_name']?></td>
                                <td class="text-center" style="width: 15%"><?=$a['association']?></td>
                                <td class="text-center" style="width: 15%"><?=$a['foundation']?></td>
                                <td class="text-center"><?=$a['remark']?></td>
                            </tr>
                        <?php endforeach; ?>
                    <?php endforeach; ?>
                    </tbody>
                    <tfoot>
                        <tr>
                            <th class="text-center" colspan="2"><?= Yii::t('app', 'Total') ?></th>
                            <th class="text-center"><?=$sum['association']?></th>
                            <th class="text-center"><?=$sum['foundation']?></th>
                            <th></th>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>
    </div>
</div>
