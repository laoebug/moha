<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[BranchGroup]].
 *
 * @see BranchGroup
 */
class BranchGroupQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return BranchGroup[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return BranchGroup|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
