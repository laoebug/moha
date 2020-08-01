<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatVictorycoinProvinceDetail]].
 *
 * @see StatVictorycoinProvinceDetail
 */
class StatVictorycoinProvinceDetailQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatVictorycoinProvinceDetail[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatVictorycoinProvinceDetail|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
