# coding: utf-8
class CreateGenres < ActiveRecord::Migration
  def change
    create_table :genres do |t|
      t.integer :genre_number, null: false  # ジャンル番号
      t.string :genre_name, null: false     # ジャンル名称
      t.timestamps
    end
  end
end
