<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "stat_institute_train_detail".
 *
 * @property integer $id
 * @property integer $stat_institute_train_id
 * @property string $title
 * @property integer $total
 * @property integer $women
 * @property string $start_date
 * @property string $end_date
 * @property string $cooperator
 * @property integer $times
 * @property string $place
 *
 * @property StatInstituteTrain $statInstituteTrain
 */
class StatInstituteTrainDetail extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'stat_institute_train_detail';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['stat_institute_train_id'], 'required', 'required','message'=>Yii::t('app','Please enter a value for') .Yii::t('app','{attribute}')],
            [['stat_institute_train_id', 'total', 'women', 'times'], 'integer'],
            [['start_date', 'end_date'], 'safe'],
            [['title', 'cooperator', 'place'], 'string', 'max' => 255],
            [['stat_institute_train_id'], 'exist', 'skipOnError' => true, 'targetClass' => StatInstituteTrain::className(), 'targetAttribute' => ['stat_institute_train_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'stat_institute_train_id' => Yii::t('app', 'Stat Institute Train ID'),
            'title' => Yii::t('app', 'Title'),
            'total' => Yii::t('app', 'Total'),
            'women' => Yii::t('app', 'Women'),
            'start_date' => Yii::t('app', 'Start Date'),
            'end_date' => Yii::t('app', 'End Date'),
            'cooperator' => Yii::t('app', 'Cooperator'),
            'times' => Yii::t('app', 'Times'),
            'place' => Yii::t('app', 'Place'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatInstituteTrain()
    {
        return $this->hasOne(StatInstituteTrain::className(), ['id' => 'stat_institute_train_id']);
    }

    /**
     * @inheritdoc
     * @return StatInstituteTrainDetailQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new StatInstituteTrainDetailQuery(get_called_class());
    }
}
