<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatOfficerOrganisationAddDetail]].
 *
 * @see StatOfficerOrganisationAddDetail
 */
class StatOfficerOrganisationAddDetailQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatOfficerOrganisationAddDetail[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatOfficerOrganisationAddDetail|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
