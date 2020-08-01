<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\StatPeopleProvince;

/**
 * StatPeopleProvinceSearch represents the model behind the search form of `app\models\StatPeopleProvince`.
 */
class StatPeopleProvinceSearch extends StatPeopleProvince
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'deleted', 'user_id', 'phiscal_year_id'], 'integer'],
            [['last_update'], 'safe'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = StatPeopleProvince::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'id' => $this->id,
            'last_update' => $this->last_update,
            'deleted' => $this->deleted,
            'user_id' => $this->user_id,
            'phiscal_year_id' => $this->phiscal_year_id,
        ]);

        return $dataProvider;
    }
}
