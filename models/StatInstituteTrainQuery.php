<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatInstituteTrain]].
 *
 * @see StatInstituteTrain
 */
class StatInstituteTrainQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatInstituteTrain[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatInstituteTrain|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
