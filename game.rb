# encoding: UTF-8
# 入出力関数の作成

# tableの添え字を場所に振られた数字に変える
def index_number(x,y)
  return y+1+(x)*3;
end

def number_index(num)
  x=(num-1)/3
  y=(num-1)%3
  return x,y
end

class Set_position
  def initialize(x, y)
    @x=x
    @y=y
  end
  # その場所におけるか確認
  def check_position
    if(@y>2||@x>2)
      return false
    end
    if ($table[@y][@x]==0)
        return true
    else
        return false
    end
  end
end

def output(i,*pos)
  print(" ")
  j=0
  pos.each do |mark|
    if(mark==1)
      print(" ○ ")
    elsif(mark==2)
      print(" × ")
    else
      print(" #{index_number(i,j)} ")
   end
   if((j+1)%3!=0)
    print("｜")
   end
   j+=1
  end
  print("\n")
  if((i+1)%3!=0)
    print(" ---＋---＋---\n")
  else
    print("\n")
  end
end

def call_output
  i=0
  print("\n")
  $table.each do |elm1, elm2, elm3|
    #print("   |   |   |\n")
    output(i,elm1, elm2, elm3) 
    i+=1
  end
end

def call_Set(num)
  x,y=number_index(num)
  pos=Set_position.new(x,y)
  if (pos.check_position==false)
    puts("もう一度入力してください")
    input()
  end
end

def input
  print("入力>")
  num=gets.to_i
  call_Set(num)
end

def game
  i=0
  while(i<10)
    input()
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
