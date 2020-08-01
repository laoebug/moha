<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatOfficerTechnicalDetail]].
 *
 * @see StatOfficerTechnicalDetail
 */
class StatOfficerTechnicalDetailQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatOfficerTechnicalDetail[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatOfficerTechnicalDetail|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
