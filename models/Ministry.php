<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "ministry".
 *
 * @property integer $id
 * @property string $name
 * @property integer $deleted
 * @property string $code
 * @property string $last_update
 * @property integer $ministry_group_id
 * @property integer $position
 * @property integer $user_id
 * @property string $remark
 * @property string $input_dt_stamp
 *
 * @property Approver[] $approvers
 * @property Branch[] $branches
 * @property MinistryGroup $ministryGroup
 * @property User $user
 * @property StatGovermentUnitDetail[] $statGovermentUnitDetails
 * @property StatOfficerMinistryAddDetail[] $statOfficerMinistryAddDetails
 * @property StatOfficerMinistryDetail[] $statOfficerMinistryDetails
 * @property StatOfficerMinistryTrainDetail[] $statOfficerMinistryTrainDetails
 * @property StatOfficerMinistryUpgradeDetail[] $statOfficerMinistryUpgradeDetails
 * @property StatSingleGatewayImplementationDetail[] $statSingleGatewayImplementationDetails
 */
class Ministry extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'ministry';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name', 'last_update'], 'required'],
            [['deleted', 'ministry_group_id', 'position', 'user_id'], 'integer'],
            [['last_update', 'input_dt_stamp'], 'safe'],
            [['remark'], 'string'],
            [['name'], 'string', 'max' => 255],
            [['code'], 'string', 'max' => 5],
            [['ministry_group_id'], 'exist', 'skipOnError' => true, 'targetClass' => MinistryGroup::className(), 'targetAttribute' => ['ministry_group_id' => 'id']],
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
            'code' => Yii::t('app', 'Code'),
            'last_update' => Yii::t('app', 'Last Update'),
            'ministry_group_id' => Yii::t('app', 'Ministry Group ID'),
            'position' => Yii::t('app', 'Position'),
            'user_id' => Yii::t('app', 'User ID'),
            'remark' => Yii::t('app', 'Remark'),
            'input_dt_stamp' => Yii::t('app', 'Input Dt Stamp'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getApprovers()
    {
        return $this->hasMany(Approver::className(), ['ministry_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getBranches()
    {
        return $this->hasMany(Branch::className(), ['ministry_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getMinistryGroup()
    {
        return $this->hasOne(MinistryGroup::className(), ['id' => 'ministry_group_id']);
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
    public function getStatGovermentUnitDetails()
    {
        return $this->hasMany(StatGovermentUnitDetail::className(), ['ministry_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatOfficerMinistryAddDetails()
    {
        return $this->hasMany(StatOfficerMinistryAddDetail::className(), ['ministry_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatOfficerMinistryDetails()
    {
        return $this->hasMany(StatOfficerMinistryDetail::className(), ['ministry_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatOfficerMinistryTrainDetails()
    {
        return $this->hasMany(StatOfficerMinistryTrainDetail::className(), ['ministry_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatOfficerMinistryUpgradeDetails()
    {
        return $this->hasMany(StatOfficerMinistryUpgradeDetail::className(), ['ministry_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatSingleGatewayImplementationDetails()
    {
        return $this->hasMany(StatSingleGatewayImplementationDetail::className(), ['ministry_id' => 'id']);
    }

    /**
     * @inheritdoc
     * @return MinistryQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new MinistryQuery(get_called_class());
    }
}
