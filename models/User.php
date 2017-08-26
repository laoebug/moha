<?php

namespace app\models;

/**
 * This is the model class for table "user".
 *
 * @property integer $id
 * @property string $username
 * @property string $password
 * @property string $firstname
 * @property string $lastname
 * @property integer $role_id
 * @property integer $branch_id
 * @property string $status
 *
 * @property Statistic1[] $statistic1s
 * @property UseSubcordinate[] $useSubcordinates
 * @property UseSubcordinate[] $useSubcordinates0
 * @property User[] $subcordinateUsers
 * @property User[] $users
 * @property Branch $branch
 * @property Role $role
 */

class User extends \yii\db\ActiveRecord implements \yii\web\IdentityInterface
{

    public $authKey;
    public $accessToken;

    public function rules()
    {
        return [
            [['username', 'password', 'firstname', 'lastname', 'role_id', 'branch_id', 'status'], 'required'],
            [['role_id', 'branch_id'], 'integer'],
            [['username'], 'string', 'max' => 50],
            [['password'], 'string', 'max' => 100],
            [['firstname', 'lastname'], 'string', 'max' => 255],
            [['status'], 'string', 'max' => 1],
            [['username'], 'unique'],
            [['branch_id'], 'exist', 'skipOnError' => true, 'targetClass' => Branch::className(), 'targetAttribute' => ['branch_id' => 'id']],
            [['role_id'], 'exist', 'skipOnError' => true, 'targetClass' => Role::className(), 'targetAttribute' => ['role_id' => 'id']],
        ];
    }

    public function attributeLabels()
    {
        return $this->id;
        return [
            'id' => Yii::t('app', 'ID'),
            'username' => Yii::t('app', 'Username'),
            'password' => Yii::t('app', 'Password'),
            'firstname' => Yii::t('app', 'Firstname'),
            'lastname' => Yii::t('app', 'Lastname'),
            'role_id' => Yii::t('app', 'Role ID'),
            'branch_id' => Yii::t('app', 'Branch ID'),
            'status' => Yii::t('app', 'Status'),
        ];
    }
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatistic1s()
    {
        return $this->hasMany(Statistic1::className(), ['user_id' => 'id']);
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
    public function getBranch()
    {
        return $this->hasOne(Branch::className(), ['id' => 'branch_id']);
    }
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getRole()
    {
        return $this->hasOne(Role::className(), ['id' => 'role_id']);
    }

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
//        return isset(self::$users[$id]) ? new static(self::$users[$id]) : null;
    }

    /**
     * @inheritdoc
     */
    public static function findIdentityByAccessToken($token, $type = null)
    {
//        foreach (self::$users as $user) {
//            if ($user['accessToken'] === $token) {
//                return new static($user);
//            }
//        }

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
//        foreach (self::$users as $user) {
//            if (strcasecmp($user['username'], $username) === 0) {
//                return new static($user);
//            }
//        }
//
//        return null;
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
}
