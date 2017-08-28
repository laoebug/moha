<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "foundation".
 *
 * @property integer $id
 * @property string $name
 * @property string $approved_date
 * @property integer $province_id
 * @property integer $approved_by_moha
 * @property string $remark
 *
 * @property Province $province
 */
class Foundation extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'foundation';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'name', 'approved_date'], 'required'],
            [['id', 'province_id', 'approved_by_moha'], 'integer'],
            [['approved_date'], 'safe'],
            [['remark'], 'string'],
            [['name'], 'string', 'max' => 255],
            [['name'], 'unique'],
            [['province_id'], 'exist', 'skipOnError' => true, 'targetClass' => Province::className(), 'targetAttribute' => ['province_id' => 'id']],
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
            'approved_date' => Yii::t('app', 'Approved Date'),
            'province_id' => Yii::t('app', 'Province ID'),
            'approved_by_moha' => Yii::t('app', 'Approved By Moha'),
            'remark' => Yii::t('app', 'Remark'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProvince()
    {
        return $this->hasOne(Province::className(), ['id' => 'province_id']);
    }

    /**
     * @inheritdoc
     * @return FoundationQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new FoundationQuery(get_called_class());
    }
}
