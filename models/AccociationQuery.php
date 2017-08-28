<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[Accociation]].
 *
 * @see Accociation
 */
class AccociationQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return Accociation[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return Accociation|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
