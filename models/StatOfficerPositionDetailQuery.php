<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatOfficerPositionDetail]].
 *
 * @see StatOfficerPositionDetail
 */
class StatOfficerPositionDetailQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatOfficerPositionDetail[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatOfficerPositionDetail|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
