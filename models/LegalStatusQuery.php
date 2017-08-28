<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[LegalStatus]].
 *
 * @see LegalStatus
 */
class LegalStatusQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return LegalStatus[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return LegalStatus|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
