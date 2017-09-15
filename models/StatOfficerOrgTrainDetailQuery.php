<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatOfficerOrgTrainDetail]].
 *
 * @see StatOfficerOrgTrainDetail
 */
class StatOfficerOrgTrainDetailQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatOfficerOrgTrainDetail[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatOfficerOrgTrainDetail|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
