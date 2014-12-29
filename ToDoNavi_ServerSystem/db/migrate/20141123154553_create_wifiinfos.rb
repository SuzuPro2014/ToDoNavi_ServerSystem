class CreateWifiinfos < ActiveRecord::Migration
  def change
    create_table :wifiinfos do |t|
      t.integer :store_id, null: false

      t.integer :wifi_info_number, null: false
      t.string :ssid, null: false
      t.string :bssid, null: false
      t.integer :store_number, null: false
      t.timestamps
    end
    add_index :wifiinfos, :store_id
  end
end
