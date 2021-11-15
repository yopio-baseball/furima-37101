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
| email              | string | null: false |
| encrypted_password | string | null: false |

- has_many :goods
- has_many :orders
- has_one  :profile
- has_one  :user_address
- has_one  :Payment_card

## profile テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| last_name   | string | null: false |
|  first_name | string | null: false |
|last_name_kana |string | null:  false|
|first_name_kana| string| null: false |
|day_of_birth | date    | null:false  |
user_id  | references   |null false, foreign: key |

- belongs_to :user
## user_address テーブル

| Column | Type   | Options      |
| ------ | -------| -------------|
| last_name  |  string  |  null: false  |
|first_name  |  string  |  null: false  |
|last_name_kana  |  string  | null:  false |
|first_name_kana |  string  | null: false  |
|post_code   |   |  string  | null:false   |
|prefecture_code | integer  | null: false  |
|address_city    | string   | null:  false |
|address_street  | string   | null: false  |
|address_building |  string | null: false  |
|phone_number    | string   | null: false  |
|user_id  | references  | null false  foreign: key |

- belongs_to :user

## goods テーブル

| Column  | Type   | Options      |
| ------- | -------| -------------|
|  name   |  string | null: false |
|product_description  |  text   |  null: false  |
|category_id |  references  |  null: false  |
|state    |  integer |  null: false |
|region   |  integer |  null: false |
|shipping_date  |  integer  | null: false  |
|price    |  integer |  null: false |
|seller_id | integer  |  null: false |
|buyer_id | integer  |  null: false |

- has_many :orders
- has_many :Categories
- belongs_to :user


## categories テーブル
| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | integer| null: false, foreign: key |

- belongs_to :good

## payment_cards テーブル
| Column | Type   | Options     |
| ------ | ------ | ----------- | 
|user_id |references  |  null: false, foreign_key  |
|payjp_customer_id |  | string  |  null: false     |

has_many :payjpes
belongs_to :user

##  payjp
| Column | Type   | Options     |
| ------ | ------ | ----------- | 
| API    | references       |             |

belongs_to :payment_card

