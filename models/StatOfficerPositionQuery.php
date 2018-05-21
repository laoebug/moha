<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatOfficerPosition]].
 *
 * @see StatOfficerPosition
 */
class StatOfficerPositionQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatOfficerPosition[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatOfficerPosition|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
