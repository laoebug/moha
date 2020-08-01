<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatReligionPlaceDetail]].
 *
 * @see StatReligionPlaceDetail
 */
class StatReligionPlaceDetailQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatReligionPlaceDetail[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatReligionPlaceDetail|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
