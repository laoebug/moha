<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatCopy]].
 *
 * @see StatCopy
 */
class StatCopyQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatCopy[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatCopy|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
