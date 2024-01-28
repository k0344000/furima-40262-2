# README

#　テーブル設計

## users テーブル(ユーザー情報)

|Colum|                   |Type  | Options    |
|-------------------------|------|------------|
|nickname                 |string| null: false|
|email                    |string| null: false|
|password                 |string| null: false|
|password_confirmation    |string| null: false|
|full_name                |string| null: false|
|kana_name                |string| null: false|
|birthday                 |date  | null: false|

### Association
-has_many : orders

## addresses テーブル(受け取り先情報)

|Colum|                   |Type      | Options                        |
|-------------------------|----------|--------------------------------|
|postal_code              |string    | null: false                    |
|prefecture               |string    | null: false                    |
|city_name                |string    | null: false                    |
|block_name               |string    | null: false                    |
|building_name            |string    | null: false                    |
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

## items テーブル(出品情報)

|Colum|                   |Type      | Options                        |
|-------------------------|----------|--------------------------------|
|user                     |references| null: false,　foreign_key: true|
|name                     |string    | null: false                    |
|description              |string    | null: false                    |
|category                 |string    | null: false                    |
|condition                |string    | null: false                    |
|shipping_fee             |string    | null: false                    |
|prefecture               |string    | null: false                    |
|shipping_days             |string   | null: false                    |
|price                    |string    | null: false                    |

### Association
belongs_to :user

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
