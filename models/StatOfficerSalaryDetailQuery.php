<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatOfficerSalaryDetail]].
 *
 * @see StatOfficerSalaryDetail
 */
class StatOfficerSalaryDetailQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatOfficerSalaryDetail[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatOfficerSalaryDetail|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
