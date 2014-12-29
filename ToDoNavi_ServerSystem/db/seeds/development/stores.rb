# coding: utf-8
name = ["ウェルパーク","ダイエー", "LIFE", "OKストア"]
address = [
  "〒214-0014 神奈川県川崎市多摩区登戸2754",
  "〒214-0014 神奈川県川崎市多摩区登戸2789",
  "〒214-0014 神奈川県川崎市多摩区登戸2735",
  "〒214-0034 神奈川県川崎市多摩区三田4-1-1"]
tel = ["044-932-8320",
       "044-922-5391",
       "044-933-9361",
       "044-922-2961"]
open_t = %w(34200 25200 34200 30600)
close_t = %w(84600 82800 90000 77400)

0.upto(3) do |index|
  Store.create(
    store_number: index + 1,
    store_name: name[index],
    address: address[index],
    phone_number: tel[index],
    open_time: open_t[index],
    close_time: close_t[index]
  )
end
