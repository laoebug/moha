<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "stat_course".
 *
 * @property integer $id
 * @property string $name
 * @property integer $deleted
 * @property integer $position
 * @property string $last_update
 * @property integer $user_id
 * @property integer $stat_course_id
 *
 * @property StatCourse $statCourse
 * @property StatCourse[] $statCourses
 * @property User $user
 */
class StatCourse extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'stat_course';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name', 'last_update', 'user_id'], 'required'],
            [['deleted', 'position', 'user_id', 'stat_course_id'], 'integer'],
            [['last_update'], 'safe'],
            [['name'], 'string', 'max' => 255],
            [['stat_course_id'], 'exist', 'skipOnError' => true, 'targetClass' => StatCourse::className(), 'targetAttribute' => ['stat_course_id' => 'id']],
            [['user_id'], 'exist', 'skipOnError' => true, 'targetClass' => User::className(), 'targetAttribute' => ['user_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'name' => Yii::t('app', 'Name'),
            'deleted' => Yii::t('app', 'Deleted'),
            'position' => Yii::t('app', 'Position'),
            'last_update' => Yii::t('app', 'Last Update'),
            'user_id' => Yii::t('app', 'User ID'),
            'stat_course_id' => Yii::t('app', 'Stat Course ID'),
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
     * @return \yii\db\ActiveQuery
     */
    public function getStatCourses()
    {
        return $this->hasMany(StatCourse::className(), ['stat_course_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUser()
    {
        return $this->hasOne(User::className(), ['id' => 'user_id']);
    }

    /**
     * @inheritdoc
     * @return StatCourseQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new StatCourseQuery(get_called_class());
    }
}
