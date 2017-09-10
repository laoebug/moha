<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatOfficerDegreeDetail]].
 *
 * @see StatOfficerDegreeDetail
 */
class StatOfficerDegreeDetailQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatOfficerDegreeDetail[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatOfficerDegreeDetail|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
