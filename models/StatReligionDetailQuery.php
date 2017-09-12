<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatReligionDetail]].
 *
 * @see StatReligionDetail
 */
class StatReligionDetailQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatReligionDetail[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatReligionDetail|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
