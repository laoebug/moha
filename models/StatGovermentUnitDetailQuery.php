<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatGovermentUnitDetail]].
 *
 * @see StatGovermentUnitDetail
 */
class StatGovermentUnitDetailQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatGovermentUnitDetail[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatGovermentUnitDetail|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
