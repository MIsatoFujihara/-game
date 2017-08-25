# main
require "./game.rb"
require "./clear_check.rb"
require "./set_pos.rb"

# 定数の設定
Empty = 0
Maru = 1
Batsu = 2

# tableは何も置いてない時：Empty　○が置いてあるとき：Maru　×が置いてあるとき：Batsu　が格納される
table = Array.new(3).map{Array.new(3, 0)} 
player = true # 今の手が○ならtrue，×ならfalseを示す
output_columns(table)
puts("○×ゲームを始めます")
game(player, table)