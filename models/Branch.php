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
 * @property integer $position
 * @property string $remark
 * @property integer $user_id
 * @property string $last_update
 * @property integer $ministry_id
 *
 * @property Ministry $ministry
 * @property User $user
 * @property GovermentUnit[] $govermentUnits
 * @property UserHasBranch[] $userHasBranches
 * @property User[] $users
 */
class Branch extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
	public $branch_id;
	public $branch_user_id;
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
            [['name', 'user_id', 'ministry_id'], 'required'],
            [['address', 'remark'], 'string'],
            [['deleted', 'position', 'user_id', 'ministry_id'], 'integer'],
            [['last_update'], 'safe'],
            [['code'], 'string', 'max' => 10],
            [['name', 'tel'], 'string', 'max' => 255],
            [['ministry_id'], 'exist', 'skipOnError' => true, 'targetClass' => Ministry::className(), 'targetAttribute' => ['ministry_id' => 'id']],
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
            'position' => Yii::t('app', 'Position'),
            'remark' => Yii::t('app', 'Remark'),
            'user_id' => Yii::t('app', 'User ID'),
            'last_update' => Yii::t('app', 'Last Update'),
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
     * @return RoleHasActionQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new RoleHasActionQuery(get_called_class());
    }
}
