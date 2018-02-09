<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "stat_copy".
 *
 * @property integer $id
 * @property string $last_update
 * @property integer $saved
 * @property integer $phiscal_year_id
 * @property integer $user_id
 *
 * @property PhiscalYear $phiscalYear
 * @property User $user
 * @property StatCopyDetail[] $statCopyDetails
 */
class StatCopy extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'stat_copy';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['last_update', 'phiscal_year_id', 'user_id'], 'required','message'=>Yii::t('app','Please enter a value for') .Yii::t('app','{attribute}')],
            [['last_update'], 'safe'],
            [['saved', 'phiscal_year_id', 'user_id'], 'integer'],
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
            'saved' => Yii::t('app', 'Saved'),
            'phiscal_year_id' => Yii::t('app', 'Phiscal Year ID'),
            'user_id' => Yii::t('app', 'User ID'),
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
    public function getStatCopyDetails()
    {
        return $this->hasMany(StatCopyDetail::className(), ['stat_copy_id' => 'id']);
    }

    /**
     * @inheritdoc
     * @return StatCopyQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new StatCopyQuery(get_called_class());
    }
}
