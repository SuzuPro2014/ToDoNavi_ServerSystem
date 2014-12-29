# coding: utf-8
class Store < ActiveRecord::Base

  # 店舗↔位置
  has_many :locationinfos, dependent: :destroy

  # 店舗↔Wi-Fi
  has_many :wifiinfos, dependent: :destroy

  # 店舗↔商品価格
  has_many :itemprices, dependent: :destroy
  has_many :itemprices_items, through: :itemprices, source: :item


  # バリデーション
  validates :store_number, presence: true,
            numericality: {only_integer: true}, uniqueness: true,
            length: {maximum: 7}
  validates :store_name, presence: true
  validates :open_time, :close_time, presence: true,
            numericality: {only_integer: true}

  # 検索フォーム
  class << self
    def search (query)
      rel = order("id")
      if query.present?
        rel = rel.where("store_name LIKE ?", "%#{query}%")
      end
      rel
    end
  end
  
end
