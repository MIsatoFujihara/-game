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

def clearCheck(j,i)
  clear_naname=0
  clear_tate=0
  clear_yoko=0
  # 今の状態を保存
  old_i,old_j=i,j
  # 斜めを確認
  while($table[j][i]==maru_state()) do
    clear_naname+=1
    return 1 if(clear_naname>2)
    i+=1
    j+=1
  end
  i,j=old_i,old_j
  while($table[j][i]==maru_state()) do
    # 縦を確認
    clear_tate+=1
    return 1 if(clear_tate>2)
    j+=1
  end
  i,j=old_i,old_j
  while($table[j][i]==maru_state()) do
    clear_yoko+=1
    return 1 if(clear_yoko>2)
    i+=1
  end
  return 0
end
 
def callClear
  i=0
  while(i<3) do
    if($table[0][i]==maru_state())
      if(clearCheck(0,i)==1)
        return 1
      end
    elsif($table[i][0]==maru_state())
      if(clearCheck(i,0)==1)
        return 1
      end
    end
    i+=1
 
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

$table = Array.new(3).map{Array.new(3,0)}
$maru=true
x=0
call_output()
puts("○×ゲームを始めます")
game()
