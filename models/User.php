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
 * @property StatAssociationFoundation[] $statAssociationFoundations
 * @property StatGovermentUnit[] $statGovermentUnits
 * @property StatLegal[] $statLegals
 * @property StatSingleGatewayImplementation[] $statSingleGatewayImplementations
 * @property UseSubcordinate[] $useSubcordinates
 * @property UseSubcordinate[] $useSubcordinates0
 * @property User[] $subcordinateUsers
 * @property User[] $users
 * @property UserHasBranch[] $userHasBranches
 * @property Branch[] $branches
 * @property Ministry[] $ministries
 * @property UserHasRole[] $userHasRoles
 * @property Role[] $roles
 * @property Role $role
 */
class User extends \yii\db\ActiveRecord implements \yii\web\IdentityInterface
{

    public $authKey;
    public $accessToken;
    public $subordinate_usr_id; // subordinate_usr_id  is user_id in user_subordinate table
    public $subordinate_user_id; // subordinate_user_id is subordinate_user_id in user_subordinate table
    public $theBraches = [];
    public $theSubcordinateUsers = [];
    public $theProvinces = [];
    public $province_id;
    public $newpassword;
    public $confirmpassword;

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
            [['username', 'password', 'firstname', 'lastname', 'tel', 'role_id', 'status'], 'required', 'message' => Yii::t('app', 'Please enter a value for') . Yii::t('app', '{attribute}')],
            [['deleted', 'role_id', 'user_id'], 'integer'],
            [['input_dt_stamp'], 'safe'],
            [['username', 'tel'], 'string', 'max' => 50],
            [['password', 'email'], 'string', 'max' => 100],
            [['firstname', 'lastname'], 'string', 'max' => 255],
            [['status'], 'string', 'max' => 1],            //	
            [['username'], 'unique', 'targetAttribute' => ['username'], 'message' => Yii::t('app', '{attribute}') . '  "{value}" ' . Yii::t('app', 'has already been taken.')],
            //[['username'], 'unique'],        	//
            [['user_id'], 'exist', 'skipOnError' => true, 'targetClass' => User::className(), 'targetAttribute' => ['user_id' => 'id']],
            //[['role_id'], 'exist', 'skipOnError' => true, 'targetClass' => Role::className(), 'targetAttribute' => ['role_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ລະຫັດ'),
            'username' => Yii::t('app', 'ຊື່ຜູ້ໃຊ້'),
            'password' => Yii::t('app', 'ລະຫດັຜ່ານ'),
            'firstname' => Yii::t('app', 'ຊື່ແທ້'),
            'lastname' => Yii::t('app', 'ນາມສະກຸນ'),
            'status' => Yii::t('app', 'ສະຖານະ'),
            'tel' => Yii::t('app', 'ເບີໂທ'),
            'email' => Yii::t('app', 'ອີເມວ'),
            'deleted' => Yii::t('app', 'ລຶບ'),
            'role_id' => Yii::t('app', 'ສິດ ແລະ ໜ້າທີ່'),
            'province_id' => Yii::t('app', 'ແຂວງ'),
            'user_id' => Yii::t('app', 'User ID'),
            'input_dt_stamp' => Yii::t('app', 'Input Date Time Stamp'),
        ];
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
    public function getUserHasBranches()
    {
        return $this->hasMany(UserHasBranch::className(), ['user_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getBranches()
    {
        return $this->hasMany(Branch::className(), ['id' => 'branch_id'])->viaTable('user_has_branch', ['user_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUserHasRoles()
    {
        return $this->hasMany(UserHasRole::className(), ['user_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getRoles()
    {
        return $this->hasMany(Role::className(), ['id' => 'role_id'])->viaTable('user_has_role', ['user_id' => 'id']);
    }

    /**
     * @inheritdoc
     * @return UserQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new UserQuery(get_called_class());
    }

    /**
     * @inheritdoc
     */
    public static function findIdentity($id)
    {
        return User::find()->where(["id" => $id])->one();
    }

    /**
     * @inheritdoc
     */
    public static function findIdentityByAccessToken($token, $type = null)
    {
        return null;
    }

    /**
     * Finds user by username
     *
     * @param string $username
     * @return static|null
     */
    public static function findByUsername($username)
    {
        return User::find()->where(["username" => $username])->one();
    }

    /**
     * @inheritdoc
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * @inheritdoc
     */
    public function getAuthKey()
    {
        return $this->authKey;
    }

    /**
     * @inheritdoc
     */
    public function validateAuthKey($authKey)
    {
        return $this->authKey === $authKey;
    }

    /**
     * Validates password
     *
     * @param string $password password to validate
     * @return bool if password provided is valid for current user
     */
    public function validatePassword($password)
    {
        return $this->password === $password;
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getRole()
    {
        return $this->hasOne(Role::className(), ['id' => 'role_id']);
    }

    public function getProvince()
    {
        return $this->hasOne(Province::className(), ['id' => 'province_id']);
    }


    public static function isAllowedRole()
    {
        $allowedRole = false;

        $sql = "select * from role_has_action rha , action ac, user usr
        where rha.action_id=ac.id 
        and usr.role_id= rha.role_id
        and rha.role_id=:role_id and ac.class_name=:controller_id
        and ac.method=:action_id and usr.id=:user_id";
        $params = [":role_id" => Yii::$app->user->identity->role_id, ":controller_id" => Yii::$app->controller->id, ":action_id" => Yii::$app->controller->action->id, ":user_id" => Yii::$app->user->identity->id];

        $roleHasAction = RoleHasAction::findBySql($sql, $params)->one();
        if (isset($roleHasAction->action_id)) {
            $allowedRole = true;
        }
        return $allowedRole;
    }
}
