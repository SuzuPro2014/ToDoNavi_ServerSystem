infos = [["FON_FREE_EAP", "00:18:84:0e:40:7a", 4], ["apple Network 5d2dbf", "00:11:24:5d:2d:bf", 4], ["Wi2premium", "c0:8a:de:49:6e:88", 4],
         ["au_Wi-Fi", "c0:8a:de:09:6e:88", 4], ["Wi2premium_club", "c0:8a:de:89:6e:88", 4], ["au_Wi-Fi2", "c0:8a:de:c9:6e:88", 4],
         ["FON_FREE_INTERNET", "00:18:84:cc:de:e9", 4], ["FON_FREE_EAP", "00:18:84:98:2c:aa", 4], ["FON_FREE_INTERNET", "00:18:84:0e:40:79", 4],

         ["000docomo", "b4:c7:99:81:17:b2", 3], ["Famima_Wi-Fi", "b4:c7:99:81;17;b1", 3], ["au_Wi-Fi2", "c0:8a:de:09:6e:88", 3], ["Wi2premium", "c0:8a:de:5b:c1:a8", 3], ["au_Wi-Fi", "c0:8a:de:da:98:d8", 3],
         ["Wi2_club", "58:93:96:a4:76:68", 3], ["au_Wi-Fi", "58:93:96:24:76:68", 3], ["Wi2", "58:93:96:64:76:68", 3], ["0001softbank", "c2:f8:da:dc:0a:c5", 3],

         ["0001docomo", "ac:f1:df:d5:36:79", 2], ["Wi2", "c0:8a:de:51:8a:38", 2], ["0001softbank", "60:f4:94:e2:4d:c9", 2], ["Wi2premium_club", "c0:8a:de:11:8a:39", 2], ["au_Wi-Fi", "c0:8a:de:11:8a:38", 2],
         ["Wi2_club", "50:a7:33:82:ce:88", 2],
         ["FON_FREE_EAP", "00:18:84:ab:e6:62", 2], ["0000docomo", "ac:f1:df:d5:35:32", 2],

         ["Wi2premium", "c0:8a:de:5b:c1:a8", 1], ["au_Wi-Fi2", "c0:8a:de:db:c1:a8", 1], ["0001softbank", "9c:2a:70:b0:88:e1", 1], ["0000docomo", "c0:8a:de:fb:87:18", 1],
         ["Wi2premium_club", "c4:10:8a:ac:8c:88", 1], ["au_Wi-Fi", "c4:10:8a:2c:8c:88", 1], ["Wi2premium", "c4:10:8a:6c:8c:88", 1],
         ["au_Wi-Fi", "2c:e6:cc:35:3c:d8", 1], ["Wi2premium_club", "2c:e6:cc:b5:3c:d8", 1], ["au_Wi-Fi2", "2c:e6:cc:f5:3c:d8", 1], ["Wi2premium", "2c:e6:cc:75:3c:d8", 1]
        ]

0.upto(36) do |index|
  info = infos[index]
  Wifiinfo.create(
    wifi_info_number: index + 301,
    ssid: info[0],
    bssid: info[1],
    store_number: info[2],
    store_id: info[2]
  )
end
