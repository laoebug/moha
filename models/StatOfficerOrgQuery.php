<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatOfficerOrg]].
 *
 * @see StatOfficerOrg
 */
class StatOfficerOrgQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatOfficerOrg[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatOfficerOrg|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
