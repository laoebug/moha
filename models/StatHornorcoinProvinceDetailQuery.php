<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatHornorcoinProvinceDetail]].
 *
 * @see StatHornorcoinProvinceDetail
 */
class StatHornorcoinProvinceDetailQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatHornorcoinProvinceDetail[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatHornorcoinProvinceDetail|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
