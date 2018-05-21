<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatOfficerDegree]].
 *
 * @see StatOfficerDegree
 */
class StatOfficerDegreeQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatOfficerDegree[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatOfficerDegree|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
