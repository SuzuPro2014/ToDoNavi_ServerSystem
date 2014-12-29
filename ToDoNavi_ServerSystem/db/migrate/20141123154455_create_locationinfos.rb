# coding: utf-8
class CreateLocationinfos < ActiveRecord::Migration
  def change
    create_table :locationinfos do |t|
      t.integer :store_id, null: false              # 店舗側外部キー

      t.integer :location_info_number, null: false  # 位置情報番号
      t.decimal :long, null: false                  # 経度
      t.decimal :lat, null: false                   # 緯度
      t.integer :store_number, null: false          # 店舗番号
      t.timestamps
    end
    add_index :locationinfos, :store_id
  end
end
