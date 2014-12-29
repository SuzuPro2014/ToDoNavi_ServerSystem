# coding: utf-8
name = ["トイレットペーパー", "ティッシュ", "シャンプー＆リンス", "ボディーソープ"]

0.upto (3) do |index|
  Genre.create(
    genre_number: index + 101,
    genre_name: name[index]
  )
end
