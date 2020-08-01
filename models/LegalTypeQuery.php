<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[LegalType]].
 *
 * @see LegalType
 */
class LegalTypeQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return LegalType[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return LegalType|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
