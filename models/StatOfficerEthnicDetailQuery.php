<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatOfficerEthnicDetail]].
 *
 * @see StatOfficerEthnicDetail
 */
class StatOfficerEthnicDetailQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatOfficerEthnicDetail[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatOfficerEthnicDetail|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
