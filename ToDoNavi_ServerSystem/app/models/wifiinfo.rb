# coding: utf-8
class Wifiinfo < ActiveRecord::Base

  # Wi-Fi情報↔店舗
  belongs_to :author, class_name: "Store", foreign_key: "store_id"

  validates :wifi_info_number, presence: true,
            numericality: {only_integer: true},
            uniqueness: true,
            length: {maximum: 7}
  validates :store_number, :ssid, :bssid, presence: true

  class << self
    def search(ssid, bssid)
      rel = order("id")
      if ssid.present? && bssid.present?
        rel = rel.where("ssid LIKE ? and bssid LIKE ?", "%#{ssid}%", "%#{bssid}%")
      end
      rel
    end

    def wifiSearch (query)
      rel = order("id")
      if query.present?
        rel = rel.where("store_number == ?", "#{query}")
      end
      rel
    end
  end
  
end
