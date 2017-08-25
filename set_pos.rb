class SetPosition
  def initialize(x, y, table, player)
    @x = x
    @y = y
    @table = table
    @player = player
    @table[@y][@x] == Empty ? @is_blank = true : @is_blank = false
  end
  # その場所におけるか確認
  # 置けたらtrue，置けなかったらfalseを返す
  def check_position
    @is_blank
  end
  # tableに○か×を置く
  def set_position
    @table[@y][@x] = player_state(@player)
    @table
  end
end