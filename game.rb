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

def output(*pos)
  pos.each do |mark|
    print("|")
    if(mark==1)
      print("○")
    elsif(mark==2)
      print("×")
    else
      print(" ")
   end
  end
  print("|\n")
end

def game
  i=0
  while(i<10)
    p $maru
    $table.each do |elm1, elm2, elm3|
        output(elm1, elm2, elm3) 
    end
    $maru=!$maru
    i+=1
  end
end
$table = Array.new(3).map{Array.new(3,0)}
$maru=true
puts("○×ゲームを始めます")

game()
