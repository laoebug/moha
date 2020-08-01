<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatCopyDetail]].
 *
 * @see StatCopyDetail
 */
class StatCopyDetailQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatCopyDetail[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatCopyDetail|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
