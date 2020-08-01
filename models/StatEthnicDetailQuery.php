<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatEthnicDetail]].
 *
 * @see StatEthnicDetail
 */
class StatEthnicDetailQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatEthnicDetail[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatEthnicDetail|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
