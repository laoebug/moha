<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "stat_ethnic_detail".
 *
 * @property integer $id
 * @property integer $total
 * @property integer $ethnic_id
 * @property integer $stat_ethnic_id
 * @property integer $women
 * @property integer $province_id
 *
 * @property Ethnic $ethnic
 * @property Province $province
 * @property StatEthnic $statEthnic
 */
class StatEthnicDetail extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'stat_ethnic_detail';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['total', 'ethnic_id', 'stat_ethnic_id', 'women', 'province_id'], 'integer'],
            [['ethnic_id', 'stat_ethnic_id', 'province_id'], 'required'],
            [['ethnic_id'], 'exist', 'skipOnError' => true, 'targetClass' => Ethnic::className(), 'targetAttribute' => ['ethnic_id' => 'id']],
            [['province_id'], 'exist', 'skipOnError' => true, 'targetClass' => Province::className(), 'targetAttribute' => ['province_id' => 'id']],
            [['stat_ethnic_id'], 'exist', 'skipOnError' => true, 'targetClass' => StatEthnic::className(), 'targetAttribute' => ['stat_ethnic_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'total' => Yii::t('app', 'Total'),
            'ethnic_id' => Yii::t('app', 'Ethnic ID'),
            'stat_ethnic_id' => Yii::t('app', 'Stat Ethnic ID'),
            'women' => Yii::t('app', 'Women'),
            'province_id' => Yii::t('app', 'Province ID'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getEthnic()
    {
        return $this->hasOne(Ethnic::className(), ['id' => 'ethnic_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProvince()
    {
        return $this->hasOne(Province::className(), ['id' => 'province_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatEthnic()
    {
        return $this->hasOne(StatEthnic::className(), ['id' => 'stat_ethnic_id']);
    }

    /**
     * @inheritdoc
     * @return StatEthnicDetailQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new StatEthnicDetailQuery(get_called_class());
    }
}
