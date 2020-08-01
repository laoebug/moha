<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatReligionPlace]].
 *
 * @see StatReligionPlace
 */
class StatReligionPlaceQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatReligionPlace[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatReligionPlace|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
