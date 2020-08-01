<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatOfficerProvinceTrain]].
 *
 * @see StatOfficerProvinceTrain
 */
class StatOfficerProvinceTrainQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatOfficerProvinceTrain[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatOfficerProvinceTrain|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
