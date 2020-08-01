<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatGovoverseaProvinceDetail]].
 *
 * @see StatGovoverseaProvinceDetail
 */
class StatGovoverseaProvinceDetailQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatGovoverseaProvinceDetail[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatGovoverseaProvinceDetail|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
