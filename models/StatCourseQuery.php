<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatCourse]].
 *
 * @see StatCourse
 */
class StatCourseQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatCourse[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatCourse|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
