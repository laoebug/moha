<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatVictorycoinMinistryDetail]].
 *
 * @see StatVictorycoinMinistryDetail
 */
class StatVictorycoinMinistryDetailQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatVictorycoinMinistryDetail[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatVictorycoinMinistryDetail|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
