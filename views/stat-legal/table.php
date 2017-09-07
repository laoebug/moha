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
                <h3 class="title"><?= Yii::t('app','Statistics of Internal Legal') ?> (<?= $year->year ?>)</h3>
            </div>
            <div class="card-body">
                <table class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <th class="text-center"><?= Yii::t('app', 'No.')?></th>
                            <th class="text-center"><?= Yii::t('app', 'Name')?></th>
                            <th class="text-center"><?= Yii::t('app', 'New')?></th>
                            <th class="text-center"><?= Yii::t('app', 'Improve')?></th>
                            <th class="text-center"><?= Yii::t('app', 'Publish')?></th>
                            <th class="text-center"><?= Yii::t('app', 'Remark')?></th>
                        </tr>
                    </thead>
                    <tbody>
                    <?php foreach ($models as $t): ?>
                        <tr>
                            <th class="text-center" colspan="6"><?= $t['name'] ?></th>
                        </tr>
                        <?php
                        $sum = ['new' => 0, 'improve' => 0];
                        foreach ($t['legals'] as $index => $legal):
                            $sum['new'] = $legal['new'];
                            $sum['improve'] = $legal['improve'];
                            ?>
                            <tr>
                                <td><?=$index+1 ?></td>
                                <td><?=$legal['name']?></td>
                                <td class="text-center" style="width: 15%"><?=$legal['new'] == 1?1:''?></td>
                                <td class="text-center" style="width: 15%"><?=$legal['improve'] == 1?1:''?></td>
                                <td class="text-center"><?=$legal['publish']?></td>
                                <td class="text-center"><?=$legal['remark']?></td>
                            </tr>
                        <?php endforeach; ?>
                        <tr>
                            <th class="text-center" colspan="2"><?= Yii::t('app', 'Total') ?></th>
                            <th class="text-center"><?=$sum['new']?></th>
                            <th class="text-center"><?=$sum['improve']?></th>
                            <th></th>
                            <th></th>
                        </tr>
                    <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
