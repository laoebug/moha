<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatGovoverseaProvince]].
 *
 * @see StatGovoverseaProvince
 */
class StatGovoverseaProvinceQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatGovoverseaProvince[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatGovoverseaProvince|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
