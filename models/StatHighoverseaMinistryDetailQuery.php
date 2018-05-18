<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatHighoverseaMinistryDetail]].
 *
 * @see StatHighoverseaMinistryDetail
 */
class StatHighoverseaMinistryDetailQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatHighoverseaMinistryDetail[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatHighoverseaMinistryDetail|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
