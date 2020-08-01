<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "stat_course_detail".
 *
 * @property int $id
 * @property int $stat_course_id
 * @property string $name
 * @property int $deleted
 * @property int $parent_id
 * @property int $position
 *
 * @property StatCourse $statCourse
 */
class StatCourseDetail extends ActiveRecord
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
     * @return ActiveQuery
     */
    public function getStatCourse()
    {
        return $this->hasOne(StatCourse::className(), ['id' => 'stat_course_id']);
    }
}
