<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatOfficerResign]].
 *
 * @see StatOfficerResign
 */
class StatOfficerResignQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatOfficerResign[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatOfficerResign|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
