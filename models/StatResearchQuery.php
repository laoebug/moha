<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatResearch]].
 *
 * @see StatResearch
 */
class StatResearchQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatResearch[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatResearch|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
