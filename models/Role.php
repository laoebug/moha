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
 * @property integer $is_province
 * @property integer $province_id
 * @property Province $province
 * @property User $user
 * @property RoleHasAction[] $roleHasActions
 * @property Action[] $actions
 * @property RoleHasMenu[] $roleHasMenus
 * @property Menu[] $menus
 * @property User[] $users
 * @property UserHasRole[] $userHasRoles
 */
class Role extends \yii\db\ActiveRecord
{
	public $theMenus=[];

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
            [['name'], 'required','message'=>Yii::t('app','Please enter a value for') .Yii::t('app','{attribute}')],
            [['deleted', 'user_id', 'is_province','province_id'], 'integer'],
            [['input_dt_stamp'], 'safe'],
            [['name'], 'string', 'max' => 45],
            [['name'], 'unique'],
        	[['name'], 'checkIfSelectedProvince','on'=>'is_province_check'],
            [['user_id'], 'exist', 'skipOnError' => true, 'targetClass' => User::className(), 'targetAttribute' => ['user_id' => 'id']],
        ];
    }

    public function checkIfSelectedProvince()
    {
    	if ($this->is_province==true && $this->province_id==null){    	
    		$this->addError('name', Yii::t('app','Please select the province if role is for province'));
    	}
    }
    
    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'name' => Yii::t('app', 'Role Name'),
            'deleted' => Yii::t('app', 'Deleted'),
            'user_id' => Yii::t('app', 'User ID'),
            'input_dt_stamp' => Yii::t('app', 'Input Date Time Stamp'),
            'is_province' => Yii::t('app', 'Is Province Role'),
        	'province_id' => Yii::t('app', 'Province')
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUser()
    {
        return $this->hasOne(User::className(), ['id' => 'user_id']);
    }
    public function getProvince()
    {
    	return $this->hasOne(Province::className(), ['id' => 'province_id']);
    	//return $this->beLongTo(Province::className(), ['id' => 'province_id']);
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
     * @return \yii\db\ActiveQuery
     */
    public function getUserHasRoles()
    {
        return $this->hasMany(UserHasRole::className(), ['role_id' => 'id']);
    }

    /**
     * @inheritdoc
     * @return RoleQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new RoleQuery(get_called_class());
    }
    
}
