<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatResearchDetail]].
 *
 * @see StatResearchDetail
 */
class StatResearchDetailQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatResearchDetail[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatResearchDetail|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
