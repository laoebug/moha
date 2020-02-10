<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "ministry".
 *
 * @property int $id
 * @property string $name
 * @property int $deleted
 * @property string $code
 * @property string $last_update
 * @property int $ministry_group_id
 * @property int $position
 * @property int $user_id
 * @property string $remark
 * @property string $input_dt_stamp
 * @property int $equal equal ministry
 * @property int $phiscal_year_id
 *
 * @property Approver[] $approvers
 * @property Branch[] $branches
 * @property MinistryGroup $ministryGroup
 * @property User $user
 * @property StatDocumentDetail[] $statDocumentDetails
 * @property StatGovcoinMinistryDetail[] $statGovcoinMinistryDetails
 * @property StatGovermentUnitDetail[] $statGovermentUnitDetails
 * @property StatGovoverseaMinistryDetail[] $statGovoverseaMinistryDetails
 * @property StatHighcoinMinistryDetail[] $statHighcoinMinistryDetails
 * @property StatHighoverseaMinistryDetail[] $statHighoverseaMinistryDetails
 * @property StatOfficerMinistryAddDetail[] $statOfficerMinistryAddDetails
 * @property StatOfficerMinistryDetail[] $statOfficerMinistryDetails
 * @property StatOfficerMinistryTrainDetail[] $statOfficerMinistryTrainDetails
 * @property StatOfficerMinistryUpgradeDetail[] $statOfficerMinistryUpgradeDetails
 * @property StatSingleGatewayImplementationDetail[] $statSingleGatewayImplementationDetails
 * @property StatVictorycoinMinistryDetail[] $statVictorycoinMinistryDetails
 * @property StatVictoryoverseaMinistryDetail[] $statVictoryoverseaMinistryDetails
 */
class Ministry extends ActiveRecord
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
            [['deleted', 'ministry_group_id', 'position', 'user_id', 'equal', 'phiscal_year_id'], 'integer'],
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
            'equal' => Yii::t('app', 'equal ministry'),
            'phiscal_year_id' => Yii::t('app', 'Phiscal Year ID'),
            'phiscal_year_id' => Yii::t('app', 'Phiscal Year ID'),
        ];
    }

    /**
     * @return ActiveQuery
     */
    public function getApprovers()
    {
        return $this->hasMany(Approver::className(), ['ministry_id' => 'id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getBranches()
    {
        return $this->hasMany(Branch::className(), ['ministry_id' => 'id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getMinistryGroup()
    {
        return $this->hasOne(MinistryGroup::className(), ['id' => 'ministry_group_id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getUser()
    {
        return $this->hasOne(User::className(), ['id' => 'user_id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getStatDocumentDetails()
    {
        return $this->hasMany(StatDocumentDetail::className(), ['ministry_id' => 'id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getStatGovcoinMinistryDetails()
    {
        return $this->hasMany(StatGovcoinMinistryDetail::className(), ['ministry_id' => 'id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getStatGovermentUnitDetails()
    {
        return $this->hasMany(StatGovermentUnitDetail::className(), ['ministry_id' => 'id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getStatGovoverseaMinistryDetails()
    {
        return $this->hasMany(StatGovoverseaMinistryDetail::className(), ['ministry_id' => 'id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getStatHighcoinMinistryDetails()
    {
        return $this->hasMany(StatHighcoinMinistryDetail::className(), ['ministry_id' => 'id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getStatHighoverseaMinistryDetails()
    {
        return $this->hasMany(StatHighoverseaMinistryDetail::className(), ['ministry_id' => 'id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getStatOfficerMinistryAddDetails()
    {
        return $this->hasMany(StatOfficerMinistryAddDetail::className(), ['ministry_id' => 'id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getStatOfficerMinistryDetails()
    {
        return $this->hasMany(StatOfficerMinistryDetail::className(), ['ministry_id' => 'id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getStatOfficerMinistryTrainDetails()
    {
        return $this->hasMany(StatOfficerMinistryTrainDetail::className(), ['ministry_id' => 'id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getStatOfficerMinistryUpgradeDetails()
    {
        return $this->hasMany(StatOfficerMinistryUpgradeDetail::className(), ['ministry_id' => 'id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getStatSingleGatewayImplementationDetails()
    {
        return $this->hasMany(StatSingleGatewayImplementationDetail::className(), ['ministry_id' => 'id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getStatVictorycoinMinistryDetails()
    {
        return $this->hasMany(StatVictorycoinMinistryDetail::className(), ['ministry_id' => 'id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getStatVictoryoverseaMinistryDetails()
    {
        return $this->hasMany(StatVictoryoverseaMinistryDetail::className(), ['ministry_id' => 'id']);
    }
}
