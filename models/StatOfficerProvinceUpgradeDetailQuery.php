<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatOfficerProvinceUpgradeDetail]].
 *
 * @see StatOfficerProvinceUpgradeDetail
 */
class StatOfficerProvinceUpgradeDetailQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatOfficerProvinceUpgradeDetail[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatOfficerProvinceUpgradeDetail|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
