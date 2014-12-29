# coding: utf-8
class Genre < ActiveRecord::Base

  # ジャンル↔商品
  has_many :items, dependent: :destroy

  # バリデーション
  validates :genre_number, presence: true,
            numericality: {only_integer: true}, uniqueness: true,
            length: {maximum: 7}
  validates :genre_name, presence: true

end
