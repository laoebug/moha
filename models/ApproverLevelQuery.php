<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[ApproverLevel]].
 *
 * @see ApproverLevel
 */
class ApproverLevelQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return ApproverLevel[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return ApproverLevel|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
