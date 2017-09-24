<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "role".
 *
 * @property integer $id
 * @property string $name
 * @property integer $deleted
 * @property integer $user_id
 * @property string $input_dt_stamp
 *
 * @property User $user
 * @property RoleHasAction[] $roleHasActions
 * @property Action[] $actions
 * @property RoleHasMenu[] $roleHasMenus
 * @property Menu[] $menus
 * @property User[] $users
 */
class Role extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
	public $theMenus=[];
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
            [['deleted', 'user_id'], 'integer'],
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
        ];
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
    public function getRoleHasActions()
    {
        return $this->hasMany(RoleHasAction::className(), ['role_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getActions()
    {
        return $this->hasMany(Action::className(), ['id' => 'action_id'])->viaTable('role_has_action', ['role_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getRoleHasMenus()
    {
        return $this->hasMany(RoleHasMenu::className(), ['role_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getMenus()
    {
        return $this->hasMany(Menu::className(), ['id' => 'menu_id'])->viaTable('role_has_menu', ['role_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUsers()
    {
        return $this->hasMany(User::className(), ['role_id' => 'id']);
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
