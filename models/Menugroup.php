<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "menugroup".
 *
 * @property int $id
 * @property string $name
 * @property int $deleted
 * @property int $input_id
 * @property string $input_dt_stamp
 *
 * @property Menu[] $menus
 * @property User $input
 */
class Menugroup extends ActiveRecord
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
            [['deleted', 'input_id'], 'integer'],
            [['input_dt_stamp'], 'safe'],
            [['name'], 'string', 'max' => 255],
            [['name'], 'unique'],
            [['input_id'], 'exist', 'skipOnError' => true, 'targetClass' => User::className(), 'targetAttribute' => ['input_id' => 'id']],
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
            'input_id' => Yii::t('app', 'Input ID'),
            'input_dt_stamp' => Yii::t('app', 'Input Dt Stamp'),
        ];
    }

    /**
     * @return ActiveQuery
     */
    public function getMenus()
    {
        return $this->hasMany(Menu::className(), ['menugroup_id' => 'id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getInput()
    {
        return $this->hasOne(User::className(), ['id' => 'input_id']);
    }
}
