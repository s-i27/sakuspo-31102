## アプリ名
　　　sakuspo
<br>
## 概要
　　一人で気軽に参加できる多種スポーツ参加サイト
<br>   
## 本番環境
　　デプロイ先：https://sakuspo-31102.herokuapp.com/　<br>
  　（一分機能修正中）
<br> 
## 制作背景(意図)
　　自分自身趣味でフットサルをやっており、フットサル個人参加サイトを利用して週５でフットサルをしていました。<br>
　　週５で同じスポーツをやっていたため、フットサル以外のスポーツも体験してみたくなり募集サイトでスポーツを探しました。<br>
　　探してみるが、初心者や未経験スポーツなため、体験したいスポーツのハードルが高く毎回フットサルをやることになっていました。<br>
　　そこで気軽に参加できる多種スポーツ参加サイトがあれば良いなと考えました。
<br>
## DEMO
　　募集情報作成<br>
　　　　![demo](https://gyazo.com/ced411e55596018b2d19883afdaa00ec/raw)<br>  
　　募集情報検索<br>
 ![demo](https://gyazo.com/40878c5d2b9868920826bde2147791d2/raw)<br>  
    <br>
## 実装予定の内容
　　非同期通信でのメッセージ機能追加<br>
　　募集内容の詳細画面でスポーツ動画再生機能追加<br>
　　アンケート機能追加<br>
  
## 工夫したポイント
　　動画や写真でスポーツのプレイ映像を見れるように作成

## 使用技術(開発環境)
　　Ruby、Ruby on Rails、CSS、HTML

## テーブル設計
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
		Column            | Type       | Options                        |
		| ------------------| ---------- | ------------------------------ |
		| user              | references | null: false,foreign_key: true  |
		| room              | references | null: false,foreign_key: true  |
                ### Association
			- belongs_to :user
			- belongs_to :room
