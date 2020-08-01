<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatOfficerOrganisationTrain]].
 *
 * @see StatOfficerOrganisationTrain
 */
class StatOfficerOrganisationTrainQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatOfficerOrganisationTrain[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatOfficerOrganisationTrain|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
