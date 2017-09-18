<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatMapProduceDetail]].
 *
 * @see StatMapProduceDetail
 */
class StatMapProduceDetailQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatMapProduceDetail[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatMapProduceDetail|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
