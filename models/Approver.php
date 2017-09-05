<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "approver".
 *
 * @property integer $id
 * @property integer $deleted
 * @property integer $ministry_id
 * @property integer $province_id
 * @property integer $approver_level_id
 *
 * @property ApproverLevel $approverLevel
 * @property Ministry $ministry
 * @property Province $province
 * @property StatAssociationFoundationDetail[] $statAssociationFoundationDetails
 */
class Approver extends \yii\db\ActiveRecord
{
    public $approver_level;

    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'approver';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['deleted', 'ministry_id', 'province_id', 'approver_level_id'], 'integer'],
            [['approver_level_id'], 'required'],
            [['approver_level_id'], 'exist', 'skipOnError' => true, 'targetClass' => ApproverLevel::className(), 'targetAttribute' => ['approver_level_id' => 'id']],
            [['ministry_id'], 'exist', 'skipOnError' => true, 'targetClass' => Ministry::className(), 'targetAttribute' => ['ministry_id' => 'id']],
            [['province_id'], 'exist', 'skipOnError' => true, 'targetClass' => Province::className(), 'targetAttribute' => ['province_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'deleted' => Yii::t('app', 'Deleted'),
            'ministry_id' => Yii::t('app', 'Ministry'),
            'province_id' => Yii::t('app', 'Province'),
            'approver_level_id' => Yii::t('app', 'Approver Level'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getApproverLevel()
    {
        return $this->hasOne(ApproverLevel::className(), ['id' => 'approver_level_id']);
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
    public function getProvince()
    {
        return $this->hasOne(Province::className(), ['id' => 'province_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatAssociationFoundationDetails()
    {
        return $this->hasMany(StatAssociationFoundationDetail::className(), ['approver_id' => 'id']);
    }

    /**
     * @inheritdoc
     * @return ApproverQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new ApproverQuery(get_called_class());
    }
}
