<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatOfficerOrganisationTrainDetail]].
 *
 * @see StatOfficerOrganisationTrainDetail
 */
class StatOfficerOrganisationTrainDetailQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatOfficerOrganisationTrainDetail[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatOfficerOrganisationTrainDetail|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
