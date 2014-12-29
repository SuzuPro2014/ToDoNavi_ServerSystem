# coding: utf-8
class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.integer :store_number ,null: false  # 店舗番号
      t.string :store_name, null: false     # 店舗名称
      t.string :address                     # 住所
      t.string :phone_number                # 電話番号
      t.integer :open_time, null: false     # 開店時間
      t.integer :close_time, null: false    # 閉店時間
      t.timestamps
    end
  end
end
