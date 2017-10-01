<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatOfficerNeedDetail]].
 *
 * @see StatOfficerNeedDetail
 */
class StatOfficerNeedDetailQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatOfficerNeedDetail[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatOfficerNeedDetail|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
