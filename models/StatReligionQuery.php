<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatReligion]].
 *
 * @see StatReligion
 */
class StatReligionQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatReligion[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatReligion|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
