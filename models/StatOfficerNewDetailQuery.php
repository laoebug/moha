<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatOfficerNewDetail]].
 *
 * @see StatOfficerNewDetail
 */
class StatOfficerNewDetailQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatOfficerNewDetail[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatOfficerNewDetail|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
