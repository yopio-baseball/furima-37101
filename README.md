# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false, unique:true|
| encrypted_password | string | null: false |
| last_name   | string | null: false |
| first_name | string | null: false |
| last_name_kana |string | null:  false|
| first_name_kana| string| null: false |
| day_of_birth | date    | null:false  |


has_many :items
has_many :orders

## items テーブル

| Column  | Type   | Options      |
| ------- | -------| -------------|
|  name   |  string | null: false |
| product_description  |  text   |  null: false  |
| category_id |  references  |  null: false  |
| state_id  | integer  |  null: false |
| pay_for_shipping_id | integer | null: false |
| region_id | integer     | null: false      |
| shipping_date_id  |  integer  | null: false  |
| price    |  integer |  null: false |
| user_id  | references   |null false, foreign: key |
has_one :order
belongs_to :user


## orders テーブル
| Column | Type   | Options     |
| ------ | ------ | ----------- | 
| user_id |references  |  null: false, foreign_key  |
| item_id |references  |  null: false, foreign_key  |

belongs_to :user
belongs_to :item
has_one :address


## addresses テーブル

| Column | Type   | Options      |
| ------ | -------| -------------|
| post_code   | integer  |  string  | null:false   |
| region_id | integer     | null: false      |
| address_city    | string   | null:  false |
| address_street  | string   | null: false  |
| address_building |  string |              |
| phone_number    | string   | null: false  |
| order_id  | references  | null: false  foreign: key |

- belongs_to :order

