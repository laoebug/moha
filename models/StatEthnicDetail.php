<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "stat_ethnic_detail".
 *
 * @property int $id
 * @property int $total
 * @property int $ethnic_id
 * @property int $stat_ethnic_id
 * @property int $women
 * @property int $province_id
 *
 * @property Ethnic $ethnic
 * @property Province $province
 * @property StatEthnic $statEthnic
 */
class StatEthnicDetail extends ActiveRecord
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
     * @return ActiveQuery
     */
    public function getEthnic()
    {
        return $this->hasOne(Ethnic::className(), ['id' => 'ethnic_id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getProvince()
    {
        return $this->hasOne(Province::className(), ['id' => 'province_id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getStatEthnic()
    {
        return $this->hasOne(StatEthnic::className(), ['id' => 'stat_ethnic_id']);
    }
}
