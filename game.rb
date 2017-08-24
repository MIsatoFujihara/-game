# encoding: UTF-8
# 入出力関数の作成
class Input
  def initialize(x, y)
    @x=x
    @y=y
  end

  # その場所におけるか確認
  def check_position
    if (table[@y][@x]==0)
        return true
    else
        return false
    end
  end
end

def output
  
end

$table = Array.new(3).map{Array.new(3,0)}
puts("○×ゲームを始めます")

