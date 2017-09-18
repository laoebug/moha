<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatMapService]].
 *
 * @see StatMapService
 */
class StatMapServiceQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatMapService[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatMapService|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
