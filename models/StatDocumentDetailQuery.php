<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatDocumentDetail]].
 *
 * @see StatDocumentDetail
 */
class StatDocumentDetailQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatDocumentDetail[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatDocumentDetail|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
