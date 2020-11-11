class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string     :title       ,null: false
      t.text       :text        ,null: false
      t.integer    :category_id ,null: false
      t.integer    :price       ,null: false
      t.date       :date_time   ,null: false
      t.date       :deadline_date_time ,null: false
      t.string     :place      ,null: false
      t.string     :video       
      t.references :user        ,foreign_key: true

      t.timestamps
    end
  end
end
