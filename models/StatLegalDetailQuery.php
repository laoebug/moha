<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatLegalDetail]].
 *
 * @see StatLegalDetail
 */
class StatLegalDetailQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatLegalDetail[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatLegalDetail|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
