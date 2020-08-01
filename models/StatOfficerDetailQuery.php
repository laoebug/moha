<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatOfficerDetail]].
 *
 * @see StatOfficerDetail
 */
class StatOfficerDetailQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatOfficerDetail[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatOfficerDetail|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
