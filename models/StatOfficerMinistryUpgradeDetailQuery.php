<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatOfficerMinistryUpgradeDetail]].
 *
 * @see StatOfficerMinistryUpgradeDetail
 */
class StatOfficerMinistryUpgradeDetailQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatOfficerMinistryUpgradeDetail[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatOfficerMinistryUpgradeDetail|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
