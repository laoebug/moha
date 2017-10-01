<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatOfficerMinistry]].
 *
 * @see StatOfficerMinistry
 */
class StatOfficerMinistryQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatOfficerMinistry[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatOfficerMinistry|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
