<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "stat_officer_need_detail".
 *
 * @property integer $id
 * @property integer $center
 * @property integer $province
 * @property integer $district
 * @property integer $stat_officer_need_id
 *
 * @property StatOfficerNeed $statOfficerNeed
 */
class StatOfficerNeedDetail extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'stat_officer_need_detail';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['center', 'province', 'district', 'stat_officer_need_id'], 'integer'],
            [['stat_officer_need_id'], 'required','message'=>Yii::t('app','Please enter a value for') .Yii::t('app','{attribute}')],
            [['stat_officer_need_id'], 'exist', 'skipOnError' => true, 'targetClass' => StatOfficerNeed::className(), 'targetAttribute' => ['stat_officer_need_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'center' => Yii::t('app', 'Center'),
            'province' => Yii::t('app', 'Province'),
            'district' => Yii::t('app', 'District'),
            'stat_officer_need_id' => Yii::t('app', 'Stat Officer Need ID'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatOfficerNeed()
    {
        return $this->hasOne(StatOfficerNeed::className(), ['id' => 'stat_officer_need_id']);
    }

    /**
     * @inheritdoc
     * @return StatOfficerNeedDetailQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new StatOfficerNeedDetailQuery(get_called_class());
    }
}
