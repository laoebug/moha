<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatOfficerMinistryTrain]].
 *
 * @see StatOfficerMinistryTrain
 */
class StatOfficerMinistryTrainQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatOfficerMinistryTrain[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatOfficerMinistryTrain|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
