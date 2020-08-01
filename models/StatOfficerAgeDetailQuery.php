<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatOfficerAgeDetail]].
 *
 * @see StatOfficerAgeDetail
 */
class StatOfficerAgeDetailQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatOfficerAgeDetail[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatOfficerAgeDetail|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
