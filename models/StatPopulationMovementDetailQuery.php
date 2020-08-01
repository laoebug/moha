<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatPopulationMovementDetail]].
 *
 * @see StatPopulationMovementDetail
 */
class StatPopulationMovementDetailQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatPopulationMovementDetail[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatPopulationMovementDetail|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
