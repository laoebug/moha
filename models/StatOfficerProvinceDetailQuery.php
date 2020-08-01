<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatOfficerProvinceDetail]].
 *
 * @see StatOfficerProvinceDetail
 */
class StatOfficerProvinceDetailQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatOfficerProvinceDetail[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatOfficerProvinceDetail|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
