<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatOfficerOrgTrain]].
 *
 * @see StatOfficerOrgTrain
 */
class StatOfficerOrgTrainQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatOfficerOrgTrain[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatOfficerOrgTrain|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
