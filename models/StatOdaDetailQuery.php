<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatOdaDetail]].
 *
 * @see StatOdaDetail
 */
class StatOdaDetailQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatOdaDetail[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatOdaDetail|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
