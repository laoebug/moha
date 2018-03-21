<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatOfficerProvince]].
 *
 * @see StatOfficerProvince
 */
class StatOfficerProvinceQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatOfficerProvince[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatOfficerProvince|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
