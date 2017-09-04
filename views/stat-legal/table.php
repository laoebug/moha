<?php
/**
 * Created by PhpStorm.
 * User: adsavin
 * Date: 09/04/2017
 * Time: 14:56
 */
?>

<table class="table table-bordered table-hover">
    <thead>
        <tr>
            <th><?= Yii::t('app', 'No.')?></th>
            <th><?= Yii::t('app', 'Name')?></th>
            <th><?= Yii::t('app', 'New')?></th>
            <th><?= Yii::t('app', 'Improve')?></th>
            <th><?= Yii::t('app', 'Publish')?></th>
            <th><?= Yii::t('app', 'Remark')?></th>
        </tr>
    </thead>
    <tbody>
    <?php foreach ($legalTypes as $type): ?>
        <tr>
            <th colspan="6"><?= $type->name ?></th>
        </tr>
        <?php foreach ($type->legals as $index => $legal): ?>
            <tr>
                <td><?=$index ?></td>
                <td><?=$legal->name?></td>
                <td><?=$legal->new?></td>
                <td><?=$legal->improve?></td>
                <td><?=$legal->publish?></td>
                <td><?=$legal->remark?></td>
            </tr>
        <?php endforeach; ?>
    <?php endforeach; ?>
    </tbody>
</table>
