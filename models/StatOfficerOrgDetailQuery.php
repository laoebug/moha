<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatOfficerOrgDetail]].
 *
 * @see StatOfficerOrgDetail
 */
class StatOfficerOrgDetailQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatOfficerOrgDetail[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatOfficerOrgDetail|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
