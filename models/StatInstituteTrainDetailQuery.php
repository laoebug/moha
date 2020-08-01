<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatInstituteTrainDetail]].
 *
 * @see StatInstituteTrainDetail
 */
class StatInstituteTrainDetailQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatInstituteTrainDetail[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatInstituteTrainDetail|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
