<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatAssociationFoundation]].
 *
 * @see StatAssociationFoundation
 */
class StatAssociationFoundationQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatAssociationFoundation[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatAssociationFoundation|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
