<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatOfficerAge]].
 *
 * @see StatOfficerAge
 */
class StatOfficerAgeQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatOfficerAge[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatOfficerAge|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
