<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatOfficer]].
 *
 * @see StatOfficer
 */
class StatOfficerQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatOfficer[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatOfficer|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
