<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatMapProduce]].
 *
 * @see StatMapProduce
 */
class StatMapProduceQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatMapProduce[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatMapProduce|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
