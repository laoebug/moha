<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "stat_legal".
 *
 * @property integer $id
 * @property string $last_update
 * @property integer $user_id
 * @property integer $phiscal_year_id
 *
 * @property PhiscalYear $phiscalYear
 * @property User $user
 * @property StatLegalDetail[] $statLegalDetails
 */
class StatLegal extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'stat_legal';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['last_update', 'user_id', 'phiscal_year_id'], 'required'],
            [['last_update'], 'safe'],
            [['user_id', 'phiscal_year_id'], 'integer'],
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
            'id' => Yii::t('app', 'ID'),
            'last_update' => Yii::t('app', 'Last Update'),
            'user_id' => Yii::t('app', 'User ID'),
            'phiscal_year_id' => Yii::t('app', 'Phiscal Year ID'),
        ];
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
     * @return \yii\db\ActiveQuery
     */
    public function getStatLegalDetails()
    {
        return $this->hasMany(StatLegalDetail::className(), ['stat_legal_id' => 'id']);
    }

    /**
     * @inheritdoc
     * @return StatLegalQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new StatLegalQuery(get_called_class());
    }
}
