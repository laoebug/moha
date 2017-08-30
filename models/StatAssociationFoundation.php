<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "stat_association_foundation".
 *
 * @property integer $id
 * @property string $last_update
 * @property integer $user_id
 * @property integer $phiscal_year_id
 * @property integer $status
 *
 * @property PhiscalYear $phiscalYear
 * @property User $user
 * @property StatAssociationFoundationDetail[] $statAssociationFoundationDetails
 */
class StatAssociationFoundation extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'stat_association_foundation';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['last_update', 'phiscal_year_id'], 'required'],
            [['last_update'], 'safe'],
            [['user_id', 'phiscal_year_id', 'status'], 'integer'],
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
            'status' => Yii::t('app', 'Status'),
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
    public function getStatAssociationFoundationDetails()
    {
        return $this->hasMany(StatAssociationFoundationDetail::className(), ['stat_association_foundation_id' => 'id']);
    }

    /**
     * @inheritdoc
     * @return StatAssociationFoundationQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new StatAssociationFoundationQuery(get_called_class());
    }
}
