<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "stat_institute_train_detail".
 *
 * @property int $id
 * @property int $stat_institute_train_id
 * @property string $title
 * @property int $total
 * @property int $women
 * @property string $start_date
 * @property string $end_date
 * @property string $cooperator
 * @property int $times
 * @property string $place
 *
 * @property StatInstituteTrain $statInstituteTrain
 */
class StatInstituteTrainDetail extends ActiveRecord
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
            [['stat_institute_train_id'], 'required'],
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
     * @return ActiveQuery
     */
    public function getStatInstituteTrain()
    {
        return $this->hasOne(StatInstituteTrain::className(), ['id' => 'stat_institute_train_id']);
    }
}
