<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatGovermentUnit]].
 *
 * @see StatGovermentUnit
 */
class StatGovermentUnitQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatGovermentUnit[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatGovermentUnit|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
