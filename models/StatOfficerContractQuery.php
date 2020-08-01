<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatOfficerContract]].
 *
 * @see StatOfficerContract
 */
class StatOfficerContractQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatOfficerContract[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatOfficerContract|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
