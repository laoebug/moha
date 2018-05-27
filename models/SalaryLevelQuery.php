<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[SalaryLevel]].
 *
 * @see SalaryLevel
 */
class SalaryLevelQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return SalaryLevel[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return SalaryLevel|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
