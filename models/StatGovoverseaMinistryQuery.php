<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatGovoverseaMinistry]].
 *
 * @see StatGovoverseaMinistry
 */
class StatGovoverseaMinistryQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatGovoverseaMinistry[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatGovoverseaMinistry|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
