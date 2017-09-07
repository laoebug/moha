<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatReligionTeacher]].
 *
 * @see StatReligionTeacher
 */
class StatReligionTeacherQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatReligionTeacher[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatReligionTeacher|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
