# coding: utf-8
class CreateItemprices < ActiveRecord::Migration
  def change
    create_table :itemprices do |t|
      t.integer :store_id, null: false      # 店舗側外部キー
      t.integer :item_id, null: false       # 商品側外部キー

      t.integer :store_number, null: false  # 店舗番号
      t.integer :item_number, null: false   # 商品番号
      t.integer :prices, null: false        # 商品価格
      t.timestamps
    end
    add_index :itemprices, :store_id
    add_index :itemprices, :item_id
  end
end
