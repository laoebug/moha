<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[UserHasBranch]].
 *
 * @see UserHasBranch
 */
class UserHasBranchQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return UserHasBranch[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return UserHasBranch|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
