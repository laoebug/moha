<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "role".
 *
 * @property int $id
 * @property string $name
 * @property int $deleted
 * @property int $user_id
 * @property string $input_dt_stamp
 * @property int $is_province
 * @property int $province_id
 *
 * @property User $user
 * @property Province $province
 * @property RoleHasAction[] $roleHasActions
 * @property Action[] $actions
 * @property RoleHasMenu[] $roleHasMenus
 * @property Menu[] $menus
 * @property User[] $users
 * @property UserHasRole[] $userHasRoles
 */
class Role extends ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'role';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name'], 'required'],
            [['deleted', 'user_id', 'is_province', 'province_id'], 'integer'],
            [['input_dt_stamp'], 'safe'],
            [['name'], 'string', 'max' => 45],
            [['name'], 'unique'],
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
            'user_id' => Yii::t('app', 'User ID'),
            'input_dt_stamp' => Yii::t('app', 'Input Dt Stamp'),
            'is_province' => Yii::t('app', 'Is Province'),
            'province_id' => Yii::t('app', 'Province ID'),
        ];
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
    public function getProvince()
    {
        return $this->hasOne(Province::className(), ['id' => 'province_id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getRoleHasActions()
    {
        return $this->hasMany(RoleHasAction::className(), ['role_id' => 'id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getActions()
    {
        return $this->hasMany(Action::className(), ['id' => 'action_id'])->viaTable('role_has_action', ['role_id' => 'id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getRoleHasMenus()
    {
        return $this->hasMany(RoleHasMenu::className(), ['role_id' => 'id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getMenus()
    {
        return $this->hasMany(Menu::className(), ['id' => 'menu_id'])->viaTable('role_has_menu', ['role_id' => 'id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getUsers()
    {
        return $this->hasMany(User::className(), ['role_id' => 'id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getUserHasRoles()
    {
        return $this->hasMany(UserHasRole::className(), ['role_id' => 'id']);
    }
}
