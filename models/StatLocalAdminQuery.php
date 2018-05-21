<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatLocalAdmin]].
 *
 * @see StatLocalAdmin
 */
class StatLocalAdminQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatLocalAdmin[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatLocalAdmin|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
