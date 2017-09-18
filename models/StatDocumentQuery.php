<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatDocument]].
 *
 * @see StatDocument
 */
class StatDocumentQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatDocument[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatDocument|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
