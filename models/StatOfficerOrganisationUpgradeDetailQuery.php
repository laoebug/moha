<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatOfficerOrganisationUpgradeDetail]].
 *
 * @see StatOfficerOrganisationUpgradeDetail
 */
class StatOfficerOrganisationUpgradeDetailQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatOfficerOrganisationUpgradeDetail[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatOfficerOrganisationUpgradeDetail|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
