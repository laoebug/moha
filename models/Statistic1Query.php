<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[Statistic1]].
 *
 * @see Statistic1
 */
class Statistic1Query extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return Statistic1[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return Statistic1|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
