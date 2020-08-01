<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatVictorycoinMinistry]].
 *
 * @see StatVictorycoinMinistry
 */
class StatVictorycoinMinistryQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatVictorycoinMinistry[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatVictorycoinMinistry|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
