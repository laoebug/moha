<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "role_has_menu".
 *
 * @property integer $role_id
 * @property integer $menu_id
 * @property string $accessible
 *
 * @property Menu $menu
 * @property Role $role
 */
class RoleHasMenu extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'role_has_menu';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['role_id', 'menu_id'], 'required','message'=>Yii::t('app','Please enter a value for') .Yii::t('app','{attribute}')],
            [['role_id', 'menu_id'], 'integer'],
            [['accessible'], 'string', 'max' => 1],
            [['menu_id'], 'exist', 'skipOnError' => true, 'targetClass' => Menu::className(), 'targetAttribute' => ['menu_id' => 'id']],
            [['role_id'], 'exist', 'skipOnError' => true, 'targetClass' => Role::className(), 'targetAttribute' => ['role_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'role_id' => Yii::t('app', 'Role ID'),
            'menu_id' => Yii::t('app', 'Menu ID'),
            'accessible' => Yii::t('app', 'Accessible'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getMenu()
    {
        return $this->hasOne(Menu::className(), ['id' => 'menu_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getRole()
    {
        return $this->hasOne(Role::className(), ['id' => 'role_id']);
    }

    /**
     * @inheritdoc
     * @return RoleHasMenuQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new RoleHasMenuQuery(get_called_class());
    }
}
