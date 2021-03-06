# coding: utf-8
class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :genre_id, null: false      # ジャンル側外部キー

      t.integer :item_number, null: false   # 商品番号
      t.string :item_name, null: false      # 商品名称
      t.integer :genre_number, null: false  # ジャンル番号
      t.timestamps
    end
    add_index :items, :genre_id
  end
end
