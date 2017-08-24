# encoding: UTF-8
# 入出力関数の作成

# tableの添え字を場所に振られた数字に変える
def index_number(x,y)
  return x+1+(y)*3;
end

def maru_state
  if($maru==true)
    return 1
  else
    return 2
  end
end
class ClearCheck
  def initialize(j,i)
    @j=j
    @i=i
  end
  def naname
    clear=0
    while($table[@j][@i]==maru_state()) do
      clear+=1
      return 1 if(clear>2)
      @i+=1
      @j+=1
    end
    return 0
  end
  def tate
    clear=0
    while($table[@j][@i]==maru_state()) do
      clear+=1
      return 1 if(clear>2)
      @j+=1
    end
    return 0
  end
  def yoko
    clear=0
    while($table[@j][@i]==maru_state()) do
      clear+=1
      return 1 if(clear>2)
      @i+=1
    end
    return 0
  end
end

 
def callClear
  i=1
 
  check=ClearCheck.new(0,0)
  if(check.naname()==1||check.yoko()==1||check.tate()==1)
    return 1
  end
  check2=ClearCheck.new(1,0)
  check3=ClearCheck.new(2,0)
  check4=ClearCheck.new(0,1)
  check5=ClearCheck.new(0,2)
  if(check2.yoko()==1)
    return 1
  end
  if(check3.yoko()==1)
    return 1
  end
  if(check4.tate()==1)
    return 1
  end
  if(check5.tate()==1)
    return 1
  end

  return 0
end
    

def number_index(num)
  x=(num-1)%3
  y=(num-1)/3
  return x,y
end

class Set_position
  def initialize(x, y)
    @x=x
    @y=y
  end
  # その場所におけるか確認
  def check_position
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
      print(" ○")
    elsif(mark==2)
      print(" ×")
    else
      print(" #{index_number(j,i)} ")
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
  if (pos.check_position==false||num>9||num<1)
    puts("もう一度入力してください")
    input()
  else
    $table[y][x]=maru_state()
  end
end

def input
  print("今は")
  puts $maru==true ? "○の番です\n":"×の番です\n"
  print("入力>")
  num=gets.to_i
  call_Set(num)
end

def game
  i=0
  while(i<10)
    input()
    call_output()
    i+=1
    break if(callClear==1)
    $maru=!$maru
  end
end

def clear
  puts("winner>#{maru_state()}")
end
$table = Array.new(3).map{Array.new(3,0)}
$maru=true
x=0
call_output()
puts("○×ゲームを始めます")
game()
clear()
