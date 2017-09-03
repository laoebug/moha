<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "branch".
 *
 * @property integer $id
 * @property string $code
 * @property string $name
 * @property string $address
 * @property string $tel
 * @property integer $deleted
 * @property integer $branch_group_id
 * @property integer $position
 * @property string $remark
 * @property integer $phiscal_year_id
 * @property integer $user_id
 * @property string $last_update
 *
 * @property BranchGroup $branchGroup
 * @property PhiscalYear $phiscalYear
 * @property User $user
 * @property GovermentUnit[] $govermentUnits
 * @property StatGovermentUnitDetail[] $statGovermentUnitDetails
 * @property StatSingleGatewayImplementationDetail[] $statSingleGatewayImplementationDetails
 * @property UserHasBranch[] $userHasBranches
 * @property User[] $users
 */
class Branch extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'branch';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name', 'deleted', 'phiscal_year_id', 'user_id'], 'required'],
            [['address', 'remark'], 'string'],
            [['deleted', 'branch_group_id', 'position', 'phiscal_year_id', 'user_id'], 'integer'],
            [['last_update'], 'safe'],
            [['code'], 'string', 'max' => 10],
            [['name', 'tel'], 'string', 'max' => 255],
            [['branch_group_id'], 'exist', 'skipOnError' => true, 'targetClass' => BranchGroup::className(), 'targetAttribute' => ['branch_group_id' => 'id']],
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
            'code' => Yii::t('app', 'Code'),
            'name' => Yii::t('app', 'Name'),
            'address' => Yii::t('app', 'Address'),
            'tel' => Yii::t('app', 'Tel'),
            'deleted' => Yii::t('app', 'Deleted'),
            'branch_group_id' => Yii::t('app', 'Branch Group ID'),
            'position' => Yii::t('app', 'Position'),
            'remark' => Yii::t('app', 'Remark'),
            'phiscal_year_id' => Yii::t('app', 'Phiscal Year ID'),
            'user_id' => Yii::t('app', 'User ID'),
            'last_update' => Yii::t('app', 'Last Update'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getBranchGroup()
    {
        return $this->hasOne(BranchGroup::className(), ['id' => 'branch_group_id']);
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
    public function getGovermentUnits()
    {
        return $this->hasMany(GovermentUnit::className(), ['branch_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatGovermentUnitDetails()
    {
        return $this->hasMany(StatGovermentUnitDetail::className(), ['branch_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatSingleGatewayImplementationDetails()
    {
        return $this->hasMany(StatSingleGatewayImplementationDetail::className(), ['branch_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUserHasBranches()
    {
        return $this->hasMany(UserHasBranch::className(), ['branch_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUsers()
    {
        return $this->hasMany(User::className(), ['id' => 'user_id'])->viaTable('user_has_branch', ['branch_id' => 'id']);
    }

    /**
     * @inheritdoc
     * @return BranchQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new BranchQuery(get_called_class());
    }
}
