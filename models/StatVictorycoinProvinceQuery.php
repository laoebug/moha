<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatVictorycoinProvince]].
 *
 * @see StatVictorycoinProvince
 */
class StatVictorycoinProvinceQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatVictorycoinProvince[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatVictorycoinProvince|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
