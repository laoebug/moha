<?php

namespace app\models;

use Yii;
class ProvinceAndYearService extends \yii\db\ActiveRecord {
    public   static function   getProvincesAndYears()
    {
        $user = Yii::$app->user->identity;
        
        $years = PhiscalYear::find()->orderBy('year')
        ->where('deleted=:deleted',[':deleted' => 0])->asArray()->all();

        $provinces = Province::find()
            ->where('deleted=:deleted',[':deleted' => 0]);
        
        if (isset($user->role->province_id)) {
            $provinces = $provinces->andWhere(['id' => $user->role->province_id]);
        }
        $provinces = $provinces->orderBy('province_code')
        ->asArray()->all();


        return json_encode([
            'years' => $years,
            'provinces' => $provinces
        ]);
    }
}
?>