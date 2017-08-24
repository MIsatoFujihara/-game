# encoding: UTF-8
# 入出力関数の作成

# tableの添え字を場所に振られた数字に変える
def index_number(x,y)
  return y+1+(x+1)*3;
end

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

def output(i,*pos)
  print i
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

def call_output
  i=1
  print("  1 2 3\n")
  $table.each do |elm1, elm2, elm3|
    output(i,elm1, elm2, elm3) 
    i+=1
  end
end


def game
  i=0
  while(i<10)
    print("入力>")
    x=gets.to_i
    p $maru
    call_output()
    $maru=!$maru
    i+=1
  end
end

$table = Array.new(3).map{Array.new(3,0)}
$maru=true
x=0
puts("○×ゲームを始めます")

game()
