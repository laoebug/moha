<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatOfficerContractDetail]].
 *
 * @see StatOfficerContractDetail
 */
class StatOfficerContractDetailQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatOfficerContractDetail[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatOfficerContractDetail|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
