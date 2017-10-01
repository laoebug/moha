<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatOfficerProvinceAdd]].
 *
 * @see StatOfficerProvinceAdd
 */
class StatOfficerProvinceAddQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatOfficerProvinceAdd[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatOfficerProvinceAdd|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
