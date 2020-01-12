<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "stat_oda_detail".
 *
 * @property int $id
 * @property int $stat_oda_id
 * @property string $code
 * @property string $name
 * @property int $start_year
 * @property int $end_year
 * @property int $amount
 * @property int $free
 * @property int $loan
 * @property string $organisation
 * @property int $receive
 * @property int $deleted
 *
 * @property StatOda $statOda
 */
class StatOdaDetail extends ActiveRecord
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
            [['stat_oda_id'], 'required'],
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
     * @return ActiveQuery
     */
    public function getStatOda()
    {
        return $this->hasOne(StatOda::className(), ['id' => 'stat_oda_id']);
    }
}
