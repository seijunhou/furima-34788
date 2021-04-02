# テーブル設計

## users テーブル

| nick_name          | string              | null:false |
| email              | string              | null: false  unique:true |
| encrypted_password | string              | null:false |
| first_name         | string              | null:false |
| last_name          | string              | null:false |
| first_name_kana    | string              | null:false |
| last_name_kana     | string              | null:false |
| birth_day          | date                | null:false |


has_many :items
has_many :buys


## items テーブル



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
has_one:buys

## buys テーブル


| user  | references | foreign_key: true |
| item | references | foreign_key: true |

belongs_to :item
belongs_to :user
has_one :guest

## guests テーブル


| postal_code     | string    | null:false |
| area_id         |integer    | null:false |
| municipality    | string    | null:false |
| adress          | string    | null:false |
| building_name   | string    |------ |
| telephone       | string    | null:false |
| buy             | references | foreign_key:true |


belongs_to :buy