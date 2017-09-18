<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatGovcoinProvince]].
 *
 * @see StatGovcoinProvince
 */
class StatGovcoinProvinceQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatGovcoinProvince[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatGovcoinProvince|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
