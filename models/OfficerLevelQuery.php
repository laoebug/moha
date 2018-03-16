<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[OfficerLevel]].
 *
 * @see OfficerLevel
 */
class OfficerLevelQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return OfficerLevel[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return OfficerLevel|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
