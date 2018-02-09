<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "stat_officer_ministry_add_detail".
 *
 * @property integer $id
 * @property integer $stat_officer_ministry_add_id
 * @property integer $add
 * @property integer $resign
 * @property integer $ministry_id
 *
 * @property Ministry $ministry
 * @property StatOfficerMinistryAdd $statOfficerMinistryAdd
 */
class StatOfficerMinistryAddDetail extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'stat_officer_ministry_add_detail';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['stat_officer_ministry_add_id', 'ministry_id'], 'required', 'required','message'=>Yii::t('app','Please enter a value for') .Yii::t('app','{attribute}')],
            [['stat_officer_ministry_add_id', 'add', 'resign', 'ministry_id'], 'integer'],
            [['ministry_id'], 'exist', 'skipOnError' => true, 'targetClass' => Ministry::className(), 'targetAttribute' => ['ministry_id' => 'id']],
            [['stat_officer_ministry_add_id'], 'exist', 'skipOnError' => true, 'targetClass' => StatOfficerMinistryAdd::className(), 'targetAttribute' => ['stat_officer_ministry_add_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'stat_officer_ministry_add_id' => Yii::t('app', 'Stat Officer Ministry Add ID'),
            'add' => Yii::t('app', 'Add'),
            'resign' => Yii::t('app', 'Resign'),
            'ministry_id' => Yii::t('app', 'Ministry ID'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getMinistry()
    {
        return $this->hasOne(Ministry::className(), ['id' => 'ministry_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatOfficerMinistryAdd()
    {
        return $this->hasOne(StatOfficerMinistryAdd::className(), ['id' => 'stat_officer_ministry_add_id']);
    }

    /**
     * @inheritdoc
     * @return StatOfficerMinistryAddDetailQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new StatOfficerMinistryAddDetailQuery(get_called_class());
    }
}
