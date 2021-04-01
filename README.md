# テーブル設計

## users テーブル

| nick_name          | string   | NOT NULL |
| email              | string   | NOT NULL |
| password           | string   | NOT NULL |
| first_name         | string   | NOT NULL |
| last_name          | string   | NOT NULL |
| first_name_kana    | string   | NOT NULL |
| last_name_kana     | string   | NOT NULL |
| date               | string   | NOT NULL |


## goods テーブル


| goods_name              | string     | NOT NULL |
| goods_explanation       | text       | NOT NULL |
| goods_details_category  | integer    | NOT NULL |
| goods_details_condition | integer    | NOT NULL |
| burden_id               | integer    | NOT NULL |
| area_id                 | integer    | NOT NULL |
| days_ship_id            | integer    | NOT NULL |
|price                    | integer    | NOT NULL |
| user                    | references | foreign_key:true |

## buy テーブル


| user_id  | integer | foreign_key: true |
| goods_id | integer | foreign_key: true |


## guest


| postal_code     | string    | NOY NULL |
| area_id         |integer    | NOT NULL |
| municipality    | string    | NOT NULL |
| adress          | string    | NOT NULL |
| building_name   | string    |------ |
| telephone       | string    | NOT NULL |
| buy             | reference | foreign_key:true |