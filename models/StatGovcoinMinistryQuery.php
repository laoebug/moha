<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatGovcoinMinistry]].
 *
 * @see StatGovcoinMinistry
 */
class StatGovcoinMinistryQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatGovcoinMinistry[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatGovcoinMinistry|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
