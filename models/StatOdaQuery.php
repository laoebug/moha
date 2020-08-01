<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatOda]].
 *
 * @see StatOda
 */
class StatOdaQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatOda[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatOda|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
