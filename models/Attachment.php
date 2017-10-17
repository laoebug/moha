<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "attachment".
 *
 * @property integer $menu_id
 * @property string $name
 * @property integer $deleted
 * @property integer $user_id
 * @property integer $id
 * @property integer $phiscal_year_id
 * @property string $upload_date
 * @property string $issued_date
 * @property string $issued_no
 * @property string $issued_by
 * @property resource $data
 * @property string $dir
 * @property string $original_name
 *
 * @property Menu $menu
 * @property PhiscalYear $phiscalYear
 * @property User $user
 */
class Attachment extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'attachment';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['menu_id', 'name', 'deleted', 'user_id', 'phiscal_year_id'], 'required'],
            [['menu_id', 'deleted', 'user_id', 'phiscal_year_id'], 'integer'],
            [['upload_date', 'issued_date'], 'safe'],
            [['data'], 'string'],
            [['name', 'issued_no', 'issued_by', 'dir', 'original_name'], 'string', 'max' => 255],
            [['menu_id'], 'exist', 'skipOnError' => true, 'targetClass' => Menu::className(), 'targetAttribute' => ['menu_id' => 'id']],
            [['phiscal_year_id'], 'exist', 'skipOnError' => true, 'targetClass' => PhiscalYear::className(), 'targetAttribute' => ['phiscal_year_id' => 'id']],
            [['user_id'], 'exist', 'skipOnError' => true, 'targetClass' => User::className(), 'targetAttribute' => ['user_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'menu_id' => Yii::t('app', 'Menu ID'),
            'name' => Yii::t('app', 'Name'),
            'deleted' => Yii::t('app', 'Deleted'),
            'user_id' => Yii::t('app', 'User ID'),
            'id' => Yii::t('app', 'ID'),
            'phiscal_year_id' => Yii::t('app', 'Phiscal Year ID'),
            'upload_date' => Yii::t('app', 'Upload Date'),
            'issued_date' => Yii::t('app', 'Issued Date'),
            'issued_no' => Yii::t('app', 'Issued No'),
            'issued_by' => Yii::t('app', 'Issued By'),
            'data' => Yii::t('app', 'Data'),
            'dir' => Yii::t('app', 'Dir'),
            'original_name' => Yii::t('app', 'Original Name'),
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
    public function getPhiscalYear()
    {
        return $this->hasOne(PhiscalYear::className(), ['id' => 'phiscal_year_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUser()
    {
        return $this->hasOne(User::className(), ['id' => 'user_id']);
    }

    /**
     * @inheritdoc
     * @return AttachmentQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new AttachmentQuery(get_called_class());
    }
}
