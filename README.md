# README

#　テーブル設計

## users テーブル(ユーザー情報)

|Colum|                   |Type  | Options                  |
|-------------------------|------|--------------------------|
|nickname                 |string| null: false              |
|email                    |string| null: false, unique: true|
|encrypted_password       |string| null: false              |
|last_name                |string| null: false              |
|first_name               |string| null: false              |
|last_name_kana           |string| null: false              |
|first_name_kana          |string| null: false              |
|birthday                 |date  | null: false              |

### Association
-has_many : orders
-has_many : items

## addresses テーブル(受け取り先情報)

|Colum|                   |Type      | Options                        |
|-------------------------|----------|--------------------------------|
|postal_code              |string    | null: false                    |
|prefecture_id            |integer   | null: false                    |
|city_name                |string    | null: false                    |
|block_name               |string    | null: false                    |
|building_name            |string    |                                |
|phone_number             |string    | null: false                    |
|order                    |references| null: false,　foreign_key: true|

### Association
-belong_to : order

## orders テーブル(注文情報)

|Colum|                   |Type      | Options                        |
|-------------------------|----------|--------------------------------|
|user                     |references| null: false,　foreign_key: true| 
|item                     |references| null: false,　foreign_key: true|

### Association
belongs_to :user
belongs_to :item
has_one :address

## items テーブル(出品情報)

|Colum|                   |Type      | Options                        |
|-------------------------|----------|--------------------------------|
|user                     |references| null: false,　foreign_key: true|
|name                     |string    | null: false                    |
|description              |text      | null: false                    |
|category_id              |integer   | null: false                    |
|condition_id             |integer   | null: false                    |
|shipping_fee_id          |integer   | null: false                    |
|prefecture_id            |integer   | null: false                    |
|shipping_day_id         |integer   | null: false                    |
|price                    |string    | null: false                    |

### Association
belongs_to :user
has_one :order

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
