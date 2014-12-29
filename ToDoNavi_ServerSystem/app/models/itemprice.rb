# coding: utf-8
class Itemprice < ActiveRecord::Base

  # 商品価格↔商品
  belongs_to :item

  # 商品価格↔店舗
  belongs_to :store

  # バリデーション
  validates :prices, presence: true, numericality: {only_integer: true}
  validates :store_number, :item_number, presence: true

  class << self
    def search(store, item)
      rel = order("id")
      if store.present? && item.present?
        rel = rel.where("store_number LIKE ? and item_number LIKE ?", "%#{store}%", "%#{item}%")
      end
      rel
    end

    def priceSearch(store, item)
      rel = order("id")
      if store.present? and item.present?
        rel = rel.where("store_number == ? and item_number == ?", "#{store}", "#{item}")
      elsif store.present?
        rel = rel.where("store_number == ?", "#{store}")
      elsif item.present?
        rel = rel.where("item_number == ?", "#{item}")
      end
      rel
    end
  end
  
end
