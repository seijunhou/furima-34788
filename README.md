# テーブル設計

## users テーブル

| nick_name          | string              | null:false |
| email              | string              | unique:true|
| encrypted_password | string              | null:false |
| first_name         | string              | null:false |
| last_name          | string              | null:false |
| first_name_kana    | string              | null:false |
| last_name_kana     | string              | null:false |
| date               | date                | null:false |


has_many :items
has_many :buy


## item テーブル


| name                    | string     | null:false |
| explanation             | text       | null:false |
| details_category_id     | integer    | null:false |
| details_condition_id    | integer    | null:false |
| burden_id               | integer    | null:false |
| area_id                 | integer    | null:false |
| days_ship_id            | integer    | null:false |
|price                    | integer    | null:false |
| user                    | references | foreign_key:true |


belongs_to:user
has_one:purchaser

## buy テーブル


| user_id  | references | foreign_key: true |
| item_id  | references | foreign_key: true |

belongs_to :item
belongs_to :user
has_one :gest

## guest


| postal_code     | string    | null:false |
| area_id         |integer    | null:false |
| municipality    | string    | null:false |
| adress          | string    | null:false |
| building_name   | string    |------ |
| telephone       | string    | null:false |
| buy             | reference | foreign_key:true |


belongs_to :buy