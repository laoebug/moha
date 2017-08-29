<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[GovermentUnit]].
 *
 * @see GovermentUnit
 */
class GovermentUnitQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return GovermentUnit[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return GovermentUnit|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
