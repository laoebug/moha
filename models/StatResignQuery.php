<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatResign]].
 *
 * @see StatResign
 */
class StatResignQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatResign[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatResign|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
