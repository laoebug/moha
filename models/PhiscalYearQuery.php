<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[PhiscalYear]].
 *
 * @see PhiscalYear
 */
class PhiscalYearQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return PhiscalYear[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return PhiscalYear|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
