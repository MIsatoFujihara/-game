# encoding: UTF-8
# 入出力関数の作成
class Input
  def initialize(x, y)
    @x=x
    @y=y
  end
  def check_position
    if (table[@y][@x])
        return true
    else
        return false
    end
  end
end
$table = Array.new(3).map{Array.new(3,0)}
puts("○×ゲームを始めます")
