<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatOfficerAgelevelDetail]].
 *
 * @see StatOfficerAgelevelDetail
 */
class StatOfficerAgelevelDetailQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatOfficerAgelevelDetail[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatOfficerAgelevelDetail|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
