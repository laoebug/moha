<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatPosition]].
 *
 * @see StatPosition
 */
class StatPositionQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatPosition[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatPosition|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
