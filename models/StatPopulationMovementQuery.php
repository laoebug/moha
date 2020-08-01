<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatPopulationMovement]].
 *
 * @see StatPopulationMovement
 */
class StatPopulationMovementQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatPopulationMovement[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatPopulationMovement|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
