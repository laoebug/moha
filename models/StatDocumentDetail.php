<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "stat_document_detail".
 *
 * @property int $id
 * @property int $stat_document_id
 * @property int $province_id
 * @property int $ministry_id
 * @property int $organisation_id
 * @property int $book_id
 * @property int $before
 * @property int $after
 * @property int $after_new
 * @property string $remark
 *
 * @property Book $book
 * @property Ministry $ministry
 * @property Organisation $organisation
 * @property Province $province
 * @property StatDocument $statDocument
 */
class StatDocumentDetail extends ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'stat_document_detail';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['stat_document_id', 'province_id', 'ministry_id', 'organisation_id', 'book_id', 'before', 'after', 'after_new'], 'integer'],
            [['remark'], 'string', 'max' => 255],
            [['book_id'], 'exist', 'skipOnError' => true, 'targetClass' => Book::className(), 'targetAttribute' => ['book_id' => 'id']],
            [['ministry_id'], 'exist', 'skipOnError' => true, 'targetClass' => Ministry::className(), 'targetAttribute' => ['ministry_id' => 'id']],
            [['organisation_id'], 'exist', 'skipOnError' => true, 'targetClass' => Organisation::className(), 'targetAttribute' => ['organisation_id' => 'id']],
            [['province_id'], 'exist', 'skipOnError' => true, 'targetClass' => Province::className(), 'targetAttribute' => ['province_id' => 'id']],
            [['stat_document_id'], 'exist', 'skipOnError' => true, 'targetClass' => StatDocument::className(), 'targetAttribute' => ['stat_document_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'stat_document_id' => Yii::t('app', 'Stat Document ID'),
            'province_id' => Yii::t('app', 'Province ID'),
            'ministry_id' => Yii::t('app', 'Ministry ID'),
            'organisation_id' => Yii::t('app', 'Organisation ID'),
            'book_id' => Yii::t('app', 'Book ID'),
            'before' => Yii::t('app', 'Before'),
            'after' => Yii::t('app', 'After'),
            'after_new' => Yii::t('app', 'After New'),
            'remark' => Yii::t('app', 'Remark'),
        ];
    }

    /**
     * @return ActiveQuery
     */
    public function getBook()
    {
        return $this->hasOne(Book::className(), ['id' => 'book_id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getMinistry()
    {
        return $this->hasOne(Ministry::className(), ['id' => 'ministry_id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getOrganisation()
    {
        return $this->hasOne(Organisation::className(), ['id' => 'organisation_id']);
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
    public function getStatDocument()
    {
        return $this->hasOne(StatDocument::className(), ['id' => 'stat_document_id']);
    }
}
