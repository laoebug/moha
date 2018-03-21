<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatInstituteMeetingDetail]].
 *
 * @see StatInstituteMeetingDetail
 */
class StatInstituteMeetingDetailQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatInstituteMeetingDetail[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatInstituteMeetingDetail|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
