<?php

/**
 * Created by PhpStorm.
 * User: adsavin
 * Date: 9/3/17
 * Time: 12:26 AM
 */
?>

<div class="row">
    <div class="col-sm-12">
        <div class="card">
            <div class="card-title-w-btn ">
                <h3 class="title">
                
                    ສະຖິຕິໜ່ວຍງານຈັດຕັ້ງປະຕິບັດກົນໄກການບໍລິການຜ່ານປະຕູດຽວ 
                    <?= isset($model->phiscalYear->year)?'('.$model->phiscalYear->year.')':'' ?>
                </h3>
                    
            </div>
            <div class="card-body">
                <table class="table table-responsive table-bordered table-hover">
                    <thead>
                    <tr>
                        <th class="text-center" style="width: 20px"><?= Yii::t('app', 'No.') ?></th>
                        <th class="text-center"><?= Yii::t('app', 'Ministry') ?></th>
                        <th class="text-center"><?= Yii::t('app', 'Start Date') ?></th>
                        <th class="text-center"><?= Yii::t('app', 'Service Unit Name') ?></th>
                        <th class="text-center"><?= Yii::t('app', 'Remark') ?></th>
                    </tr>
                    </thead>
                    
                    <tbody>
                        <?php if(count($models)>0): ?>
                        <?php foreach ($models as $i=>$b): ?>
                            
                            <tr>
                                <td><?= ++$i ?></td>
                                <td><?= $b->name ?></td>
                                <td><?= isset($b->start_date)? \app\components\MyHelper::convertdatefordisplay($b->start_date):'-' ?></td>
                                <td><?= isset($b->name)?$b->name:'-' ?></td>
                                <td><?= isset($b->remark)?$b->remark:'-' ?></td>
                            </tr>
                        <?php endforeach; ?>
                        <?php endif; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>