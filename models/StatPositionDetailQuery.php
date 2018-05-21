<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatPositionDetail]].
 *
 * @see StatPositionDetail
 */
class StatPositionDetailQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatPositionDetail[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatPositionDetail|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
