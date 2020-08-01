<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatMapServiceDetail]].
 *
 * @see StatMapServiceDetail
 */
class StatMapServiceDetailQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatMapServiceDetail[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatMapServiceDetail|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
