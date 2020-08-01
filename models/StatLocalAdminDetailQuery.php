<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatLocalAdminDetail]].
 *
 * @see StatLocalAdminDetail
 */
class StatLocalAdminDetailQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatLocalAdminDetail[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatLocalAdminDetail|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
