<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[StatCourseDetail]].
 *
 * @see StatCourseDetail
 */
class StatCourseDetailQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return StatCourseDetail[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return StatCourseDetail|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
