<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatSingleGatewayImplementation]].
 *
 * @see StatSingleGatewayImplementation
 */
class StatSingleGatewayImplementationQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatSingleGatewayImplementation[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatSingleGatewayImplementation|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
