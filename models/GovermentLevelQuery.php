<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[GovermentLevel]].
 *
 * @see GovermentLevel
 */
class GovermentLevelQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return GovermentLevel[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return GovermentLevel|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
