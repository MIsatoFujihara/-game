class SetPosition
  def initialize(x, y, table, maru)
    @x = x
    @y = y
    @table = table
    @maru = maru
  end
  # その場所におけるか確認
  # 置けたらtrue，置けなかったらfalseを返す
  def check_position
    if (@table[@y][@x] == 0)
      return true
    else
      return false
    end
  end
  # tableに○か×を置く
  def set_position
    @table[@y][@x] = maru_state(@maru)
    @table
  end
end