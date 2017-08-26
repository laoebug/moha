<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[UseSubcordinate]].
 *
 * @see UseSubcordinate
 */
class UseSubcordinateQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return UseSubcordinate[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return UseSubcordinate|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
