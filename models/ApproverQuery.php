<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[Approver]].
 *
 * @see Approver
 */
class ApproverQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return Approver[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return Approver|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
