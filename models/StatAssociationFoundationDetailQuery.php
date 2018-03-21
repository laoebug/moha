<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatAssociationFoundationDetail]].
 *
 * @see StatAssociationFoundationDetail
 */
class StatAssociationFoundationDetailQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatAssociationFoundationDetail[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatAssociationFoundationDetail|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
