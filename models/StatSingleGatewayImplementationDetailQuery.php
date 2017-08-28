<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatSingleGatewayImplementationDetail]].
 *
 * @see StatSingleGatewayImplementationDetail
 */
class StatSingleGatewayImplementationDetailQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatSingleGatewayImplementationDetail[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatSingleGatewayImplementationDetail|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
