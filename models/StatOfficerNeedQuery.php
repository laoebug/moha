<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatOfficerNeed]].
 *
 * @see StatOfficerNeed
 */
class StatOfficerNeedQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatOfficerNeed[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatOfficerNeed|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
