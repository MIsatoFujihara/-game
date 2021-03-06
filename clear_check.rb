# gameのクリア判定を行う
class ClearCheck
  def initialize(j, i, table, player)
    @j = j
    @i = i
    @table = table
    @player = player
  end
  # 斜め方向にそろっているか確認
  def naname
    i, j = @i, @j
    clear = 0
    # 表中の確認したい右上斜め方向に並んだ要素を1行の配列として格納
    check_table = [@table[j][i], @table[j + 1][i + 1], @table[j + 2][i + 2]]
    check_table.each do |point|
    break unless point == player_state(@player)
      clear += 1
      #3つ以上連続してそろっていたらbreak
      return true if clear >= 3
    end
    return false
  end
  def naname2
    i, j = @i, @j
    clear = 0
    # 表中の確認したい左下斜め方向に並んだ要素を1行の配列として格納
    check_table = [@table[j][i], @table[j - 1][i + 1], @table[j - 2][i + 2]]
    check_table.each do |point|
      break unless point == player_state(@player)
      clear += 1
      #3つ以上連続してそろっていたらbreak
      return true if clear >= 3
    end
    return false
  end
  # 縦方向にそろっているか確認
  def tate
    i, j = @i, @j
    clear = 0
    @table = @table.transpose
    # 表中の確認したい列のみを1行の配列としてcheck_tableに格納
    check_table = @table[i]
    check_table.each do |point|
      break unless point == player_state(@player) 
      clear += 1
      #3つ以上連続してそろっていたらbreak
      return true if clear >= 3
    end
    return false
  end
  # 横方向にそろっているか確認
  def yoko
    i,j = @i,@j
    clear = 0
    # 表中の確認したい行のみを1行の配列としてcheck_tableに格納
    check_table = @table[j]
    check_table.each do |point|
        break unless point == player_state(@player)
        clear += 1
        #3つ以上連続してそろっていたらbreak
        return true if clear >= 3
      end
    return false
  end
end