# coding: utf-8
class Locationinfo < ActiveRecord::Base

  # 位置情報↔店舗
  belongs_to :author, class_name: "Store", foreign_key: "store_id"

  # バリデーション
  validates :location_info_number, presence: true,
            numericality: {only_integer: true},
            uniqueness: true,
            length: {maximum: 7}
  validates :lat, :long, presence: true, numericality: true
  validates :store_number, presence: true

  class << self
    def search(lat_m, lat_p, long_m, long_p)
      rel = order("id")
      if lat_m.present? && lat_p.present? && long_m.present? && long_p.present?
        rel = rel.where("(lat >= ? and lat <= ?) and (long >= ? and long <= ?)",
                        "#{lat_m}", "#{lat_p}", "#{long_m}", "#{long_p}")
      end
      rel
    end

    def locationSearch (query)
      rel = order("id")
      if query.present?
        rel = rel.where("store_number == ?", "#{query}")
      end
      rel
    end
  end
  
end
