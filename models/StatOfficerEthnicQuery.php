<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatOfficerEthnic]].
 *
 * @see StatOfficerEthnic
 */
class StatOfficerEthnicQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatOfficerEthnic[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatOfficerEthnic|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
