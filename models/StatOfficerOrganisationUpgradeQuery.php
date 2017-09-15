<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatOfficerOrganisationUpgrade]].
 *
 * @see StatOfficerOrganisationUpgrade
 */
class StatOfficerOrganisationUpgradeQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatOfficerOrganisationUpgrade[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatOfficerOrganisationUpgrade|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
