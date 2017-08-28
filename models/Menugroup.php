<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "menugroup".
 *
 * @property integer $id
 * @property string $name
 * @property integer $deleted
 *
 * @property Menu[] $menus
 */
class Menugroup extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'menugroup';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name'], 'required'],
            [['deleted'], 'integer'],
            [['name'], 'string', 'max' => 255],
            [['name'], 'unique'],
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
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getMenus()
    {
        return $this->hasMany(Menu::className(), ['menugroup_id' => 'id']);
    }

    /**
     * @inheritdoc
     * @return MenugroupQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new MenugroupQuery(get_called_class());
    }
}
