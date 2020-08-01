<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatOfficerAddDetail]].
 *
 * @see StatOfficerAddDetail
 */
class StatOfficerAddDetailQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatOfficerAddDetail[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatOfficerAddDetail|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
