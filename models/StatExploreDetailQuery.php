<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatExploreDetail]].
 *
 * @see StatExploreDetail
 */
class StatExploreDetailQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatExploreDetail[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatExploreDetail|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
