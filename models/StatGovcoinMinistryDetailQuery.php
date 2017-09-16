<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatGovcoinMinistryDetail]].
 *
 * @see StatGovcoinMinistryDetail
 */
class StatGovcoinMinistryDetailQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatGovcoinMinistryDetail[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatGovcoinMinistryDetail|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
