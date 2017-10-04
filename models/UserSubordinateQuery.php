<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[UserSubordinate]].
 *
 * @see UserSubordinate
 */
class UserSubordinateQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return UserSubordinate[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return UserSubordinate|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
