<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "stat_course".
 *
 * @property integer $id
 * @property integer $saved
 * @property string $last_update
 * @property integer $user_id
 * @property integer $phiscal_year_id
 *
 * @property PhiscalYear $phiscalYear
 * @property User $user
 * @property StatCourseDetail[] $statCourseDetails
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
            [['saved', 'user_id', 'phiscal_year_id'], 'integer'],
            [['last_update', 'user_id', 'phiscal_year_id'], 'required','message'=>Yii::t('app','Please enter a value for') .Yii::t('app','{attribute}')],
            [['last_update'], 'safe'],
            [['phiscal_year_id'], 'exist', 'skipOnError' => true, 'targetClass' => PhiscalYear::className(), 'targetAttribute' => ['phiscal_year_id' => 'id']],
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
            'saved' => Yii::t('app', 'Saved'),
            'last_update' => Yii::t('app', 'Last Update'),
            'user_id' => Yii::t('app', 'User ID'),
            'phiscal_year_id' => Yii::t('app', 'Phiscal Year ID'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPhiscalYear()
    {
        return $this->hasOne(PhiscalYear::className(), ['id' => 'phiscal_year_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUser()
    {
        return $this->hasOne(User::className(), ['id' => 'user_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatCourseDetails()
    {
        return $this->hasMany(StatCourseDetail::className(), ['stat_course_id' => 'id']);
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
