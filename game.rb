# encoding: UTF-8
# 入出力関数の作成

# maruの状態(trueかfalseか)をtableの状態にして返す
# ○がおかれていたら表の状態は1,×がおかれていたら表の状態は2
def maru_state
  if($maru==true)
    return 1
  else
    return 2
  end
end

# gameのクリア判定を行う
class ClearCheck
  def initialize(j,i)
    @j=j
    @i=i
  end
  # 斜め方向にそろっているか確認
  def naname
    i,j=@i,@j
    clear=0
    while($table[j][i]==maru_state()) do
      clear+=1
      return 1 if(clear>2)
      i+=1
      j+=1
    end
    return 0
  end
  # 縦方向にそろっているか確認
  def tate
    i,j=@i,@j
    clear=0
    while($table[j][i]==maru_state()) do
      clear+=1
      return 1 if(clear>2)
      j+=1
    end
    return 0
  end
  # 横方向にそろっているか確認
  def yoko
    i,j=@i,@j
    clear=0
    while($table[j][i]-maru_state()==0) do
      clear+=1
      return 1 if(clear>2)
      i+=1
    end
    return 0
  end
end

 # 3つそろっていたら１,そうでなければ0を返す関数
def callClear
  # table[0][0]は縦横斜め方向にそろっているかを調べる
  check=ClearCheck.new(0,0)
  if(check.naname()==1||check.yoko()==1||check.tate()==1)
    return 1
  end
  
  check2=ClearCheck.new(1,0)
  check3=ClearCheck.new(2,0)
  check4=ClearCheck.new(0,1)
  check5=ClearCheck.new(0,2)
  # table[1][0],table[2][0]は横方向にそろっているか調べる
  if(check2.yoko()==1)
    return 1
  end
  if(check3.yoko()==1)
    return 1
  end
  # table[0][1],tanle[0][2]は縦方向にそろっているか調べる
  if(check4.tate()==1)
    return 1
  end
  if(check5.tate()==1)
    return 1
  end
  # どこもそろっていなかったら0を返す
  return 0
end
    
# 出力される表の位置番号をtableの添え字に変換
def number_index(num)
  x=(num)%3-1
  y=(num-(x+1))/3
  if(num%3==0)
    y-=1
  end
  return x,y
end

# tableの添え字を出力される表の位置番号に変換
def index_number(x,y)
  return x+1+y*3;
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
    
    output(i,elm1, elm2, elm3) 
    i+=1
  end
end

def call_Set(num)
  x,y=number_index(num)
  pos=Set_position.new(x,y)
  if (num>9||num<1||pos.check_position==false)
    puts("もう一度入力してください")
    input()
  else
    p x,y
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

def clear
  print("winner>")
  puts $maru==true ? "○\n":"×\n"
end

def gameOver
  puts("gameover")
end


def game
  i=0
  while(1) do
    input()
    call_output()
    i+=1
    if(callClear==1)
      clear()
      break
    end
    if(i>=9)
      gameOver()
      break
    end
    $maru=!$maru
  end
end



$table = Array.new(3).map{Array.new(3,0)}
$maru=true
x=0
call_output()
puts("○×ゲームを始めます")
game()
