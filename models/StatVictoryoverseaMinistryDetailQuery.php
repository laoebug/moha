<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatVictoryoverseaMinistryDetail]].
 *
 * @see StatVictoryoverseaMinistryDetail
 */
class StatVictoryoverseaMinistryDetailQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatVictoryoverseaMinistryDetail[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatVictoryoverseaMinistryDetail|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
