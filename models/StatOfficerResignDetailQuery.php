<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatOfficerResignDetail]].
 *
 * @see StatOfficerResignDetail
 */
class StatOfficerResignDetailQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatOfficerResignDetail[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatOfficerResignDetail|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
