# coding: utf-8
class Item < ActiveRecord::Base

  # 商品↔ジャンル
  belongs_to :author, class_name: "Genre", foreign_key: "genre_id"

  # 商品↔商品価格
  has_many :itemprices, dependent: :destroy
  has_many :itemprices_stores, through: :itemprices, source: :store

  #バリデーション
  validates :item_number, presence: true,
            numericality: {only_integer: true},
            uniqueness: true,
            length: {maximum: 7}
  validates :item_name, :genre_number, presence: true

  class << self
    def search(genre, item)
      rel = order("id")
      if genre.present? and item.present?
        rel = rel.where("genre_number == ? and item_number == ?", "#{genre}", "#{item}")
      elsif genre.present?
        rel = rel.where("genre_number == ?", "#{genre}")
      elsif item.present?
        rel = rel.where("item_number == ?", "#{item}")
      end
      rel
    end
  end
  
end
