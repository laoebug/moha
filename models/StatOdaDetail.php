<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "stat_oda_detail".
 *
 * @property integer $id
 * @property integer $stat_oda_id
 * @property string $code
 * @property string $name
 * @property integer $start_year
 * @property integer $end_year
 * @property integer $amount
 * @property integer $free
 * @property integer $loan
 * @property string $organisation
 * @property integer $receive
 * @property integer $deleted
 *
 * @property StatOda $statOda
 */
class StatOdaDetail extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'stat_oda_detail';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['stat_oda_id'], 'required', 'required','message'=>Yii::t('app','Please enter a value for') .Yii::t('app','{attribute}')],
            [['stat_oda_id', 'start_year', 'end_year', 'amount', 'free', 'loan', 'receive', 'deleted'], 'integer'],
            [['code', 'name', 'organisation'], 'string', 'max' => 255],
            [['stat_oda_id'], 'exist', 'skipOnError' => true, 'targetClass' => StatOda::className(), 'targetAttribute' => ['stat_oda_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'stat_oda_id' => Yii::t('app', 'Stat Oda ID'),
            'code' => Yii::t('app', 'Code'),
            'name' => Yii::t('app', 'Name'),
            'start_year' => Yii::t('app', 'Start Year'),
            'end_year' => Yii::t('app', 'End Year'),
            'amount' => Yii::t('app', 'Amount'),
            'free' => Yii::t('app', 'Free'),
            'loan' => Yii::t('app', 'Loan'),
            'organisation' => Yii::t('app', 'Organisation'),
            'receive' => Yii::t('app', 'Receive'),
            'deleted' => Yii::t('app', 'Deleted'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatOda()
    {
        return $this->hasOne(StatOda::className(), ['id' => 'stat_oda_id']);
    }

    /**
     * @inheritdoc
     * @return StatOdaDetailQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new StatOdaDetailQuery(get_called_class());
    }
}
