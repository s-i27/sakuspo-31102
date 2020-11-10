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
		## usersテーブル
		| Column          | Type       | Options                        |
		| ----------------| ---------- | ------------------------------ |
		| email           | string     | null: false,unique: true       |
		| password        | string     | null: false                    |
		| nickname        | string     | null: false,unique: true       |
		| full_name       | string     | null: false                    |
		| full_name_kana  | string     | null: false                    |
		| gender_id       | integer    | null: false                    |
		| phone_number    | string     | null: false                    |
		
		### Association
		- has_many :rooms
		- has_many :historys

    ## roomsテーブル
		| Column             | Type       | Options                        |
		| -------------------| ---------- | ------------------------------ |
		| title              | string     | null: false,unique: true       |
		| text               | text       | null: false                    |
		| category_id        | integer    | null: false,unique: true       |
		| price              | integer    | null: false                    |
		| date_time          | date       | null: false                    |
		| deadline_date_time | date       | null: false                    |
		| place              | string     | null: false                    |
    | image              |            | active storage(GEM)            |
    | video              | string     |                                |
    | user               | references | null: false,foreign_key: true  |

		### Association
			- belongs_to :user
			- has_one :history

		## historysテーブル
		| Column            | Type       | Options                        |
		| ------------------| ---------- | ------------------------------ |
		| user              | references | null: false,foreign_key: true  |
		| room              | references | null: false,foreign_key: true  |

    ### Association
			- belongs_to :user
			- belongs_to :room