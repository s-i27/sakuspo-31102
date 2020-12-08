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

#　・アプリ名
   sakuspo
   
・概要
   一人で気軽に参加できる多種スポーツ参加サイト
   
・本番環境
　　デプロイ先：https://sakuspo-31102.herokuapp.com/
  
・制作背景(意図)
　　自分自身趣味でフットサルをやっており、フットサル個人参加サイトを利用して週５でフットサルをしていました。
　　週５で同じスポーツをやっていたため、フットサル以外のスポーツも体験してみたくなり募集サイトでスポーツを探しました。
　　探してみるが、初心者や未経験スポーツなため、体験したいスポーツのハードルが高く毎回フットサルをやることになっていました。
　　そこで気軽に参加できる多種スポーツ参加サイトがあれば良いなと考えました。
  
・DEMO(gifで動画や写真を貼って、ビューのイメージを掴んでもらいます)
　　募集情報作成
　　　https://gyazo.com/ced411e55596018b2d19883afdaa00ec
   募集情報検索
   　https://gyazo.com/3cd73bc59bc85880afd58a83e0146138

・実装予定の内容

・工夫したポイント

・使用技術(開発環境)
　　Ruby、Ruby on Rails、　

・課題や今後実装したい機能
　　非同期通信でのメッセージ機能追加
　　募集内容内でのスポーツ動画再生機能追加
　　アンケート機能追加

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
		| title              | string     | null: false			   |
		| text               | text       | null: false                    |
		| category_id        | integer    | null: false 		   |
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
