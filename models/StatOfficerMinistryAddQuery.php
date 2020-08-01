<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatOfficerMinistryAdd]].
 *
 * @see StatOfficerMinistryAdd
 */
class StatOfficerMinistryAddQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatOfficerMinistryAdd[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatOfficerMinistryAdd|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
