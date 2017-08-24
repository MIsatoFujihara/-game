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

def game
  i=0
  while(i<10)
    p $maru
    $maru=!$maru
    i+=1
  end
end
$table = Array.new(3).map{Array.new(3,0)}
$maru=true
puts("○×ゲームを始めます")
game()
