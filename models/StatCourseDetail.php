<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "stat_course_detail".
 *
 * @property integer $id
 * @property integer $stat_course_id
 * @property string $name
 * @property integer $deleted
 * @property integer $parent_id
 * @property integer $position
 *
 * @property StatCourse $statCourse
 */
class StatCourseDetail extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'stat_course_detail';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['stat_course_id', 'deleted'], 'required'],
            [['stat_course_id', 'deleted', 'parent_id', 'position'], 'integer'],
            [['name'], 'string', 'max' => 255],
            [['stat_course_id'], 'exist', 'skipOnError' => true, 'targetClass' => StatCourse::className(), 'targetAttribute' => ['stat_course_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'stat_course_id' => Yii::t('app', 'Stat Course ID'),
            'name' => Yii::t('app', 'Name'),
            'deleted' => Yii::t('app', 'Deleted'),
            'parent_id' => Yii::t('app', 'Parent ID'),
            'position' => Yii::t('app', 'Position'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatCourse()
    {
        return $this->hasOne(StatCourse::className(), ['id' => 'stat_course_id']);
    }

    /**
     * @inheritdoc
     * @return StatCourseDetailQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new StatCourseDetailQuery(get_called_class());
    }
}
