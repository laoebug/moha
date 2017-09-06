<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "user".
 *
 * @property integer $id
 * @property string $username
 * @property string $password
 * @property string $firstname
 * @property string $lastname
 * @property string $status
 * @property string $tel
 * @property string $email
 * @property integer $deleted
 * @property integer $role_id
 * @property integer $user_id
 * @property string $input_dt_stamp
 *
 * @property Branch[] $branches
 * @property District[] $districts
 * @property Menu[] $menus
 * @property Menugroup[] $menugroups
 * @property Ministry[] $ministries
 * @property Province[] $provinces
 * @property Role[] $roles
 * @property StatAssociationFoundation[] $statAssociationFoundations
 * @property StatGovermentUnit[] $statGovermentUnits
 * @property StatLegal[] $statLegals
 * @property StatSingleGatewayImplementation[] $statSingleGatewayImplementations
 * @property UseSubcordinate[] $useSubcordinates
 * @property UseSubcordinate[] $useSubcordinates0
 * @property User[] $subcordinateUsers
 * @property User[] $users
 * @property User $user
 * @property User[] $users0
 * @property Role $role
 * @property UserHasBranch[] $userHasBranches
 * @property Branch[] $branches0
 */
class User extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'user';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['username', 'password', 'firstname', 'lastname', 'tel'], 'required'],
            [['deleted', 'role_id', 'user_id'], 'integer'],
            [['input_dt_stamp'], 'safe'],
            [['username', 'tel'], 'string', 'max' => 50],
            [['password', 'email'], 'string', 'max' => 100],
            [['firstname', 'lastname'], 'string', 'max' => 255],
            [['status'], 'string', 'max' => 1],
            [['username'], 'unique'],
            [['user_id'], 'exist', 'skipOnError' => true, 'targetClass' => User::className(), 'targetAttribute' => ['user_id' => 'id']],
            [['role_id'], 'exist', 'skipOnError' => true, 'targetClass' => Role::className(), 'targetAttribute' => ['role_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'username' => Yii::t('app', 'Username'),
            'password' => Yii::t('app', 'Password'),
            'firstname' => Yii::t('app', 'Firstname'),
            'lastname' => Yii::t('app', 'Lastname'),
            'status' => Yii::t('app', 'Status'),
            'tel' => Yii::t('app', 'Tel'),
            'email' => Yii::t('app', 'Email'),
            'deleted' => Yii::t('app', 'Deleted'),
            'role_id' => Yii::t('app', 'Role ID'),
            'user_id' => Yii::t('app', 'User ID'),
            'input_dt_stamp' => Yii::t('app', 'Input Dt Stamp'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getBranches()
    {
        return $this->hasMany(Branch::className(), ['user_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDistricts()
    {
        return $this->hasMany(District::className(), ['input_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getMenus()
    {
        return $this->hasMany(Menu::className(), ['input_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getMenugroups()
    {
        return $this->hasMany(Menugroup::className(), ['input_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getMinistries()
    {
        return $this->hasMany(Ministry::className(), ['user_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProvinces()
    {
        return $this->hasMany(Province::className(), ['input_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getRoles()
    {
        return $this->hasMany(Role::className(), ['user_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatAssociationFoundations()
    {
        return $this->hasMany(StatAssociationFoundation::className(), ['user_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatGovermentUnits()
    {
        return $this->hasMany(StatGovermentUnit::className(), ['user_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatLegals()
    {
        return $this->hasMany(StatLegal::className(), ['user_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatSingleGatewayImplementations()
    {
        return $this->hasMany(StatSingleGatewayImplementation::className(), ['user_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUseSubcordinates()
    {
        return $this->hasMany(UseSubcordinate::className(), ['user_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUseSubcordinates0()
    {
        return $this->hasMany(UseSubcordinate::className(), ['subcordinate_user_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSubcordinateUsers()
    {
        return $this->hasMany(User::className(), ['id' => 'subcordinate_user_id'])->viaTable('use_subcordinate', ['user_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUsers()
    {
        return $this->hasMany(User::className(), ['id' => 'user_id'])->viaTable('use_subcordinate', ['subcordinate_user_id' => 'id']);
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
    public function getUsers0()
    {
        return $this->hasMany(User::className(), ['user_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getRole()
    {
        return $this->hasOne(Role::className(), ['id' => 'role_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUserHasBranches()
    {
        return $this->hasMany(UserHasBranch::className(), ['user_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getBranches0()
    {
        return $this->hasMany(Branch::className(), ['id' => 'branch_id'])->viaTable('user_has_branch', ['user_id' => 'id']);
    }

    /**
     * @inheritdoc
     * @return UserQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new UserQuery(get_called_class());
    }
}
