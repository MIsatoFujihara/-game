# カレントディレクトリにあるファイルをrequire
require "./clear_check.rb"
require "./set_pos.rb"


# maruの状態(trueかfalseか)をtableの状態(int型)にして返す
# ○がおかれていたら表の状態は1,×がおかれていたら表の状態は2
def maru_state(maru)
  if(maru)
    return 1
  else
    return 2
  end
end

 # 3つそろっていたら１,そうでなければ0を返す関数
 # ClearCheckクラスを扱う
def call_clear(table, maru)
  # table[0][0]は縦横斜め方向にそろっているかを調べる
  check = ClearCheck.new(0, 0, table, maru)
  if(check.naname() == 1||check.yoko() == 1||check.tate() == 1)
    return 1
  end
  check2 = ClearCheck.new(1, 0, table, maru)
  check3 = ClearCheck.new(2, 0, table, maru)
  check4 = ClearCheck.new(0, 1, table, maru)
  check5 = ClearCheck.new(0, 2 ,table ,maru)
  # table[1][0],table[2][0]は横方向にそろっているか調べる
  return 1  if(check2.yoko() == 1)
  return 1  if(check3.yoko() == 1||check3.naname2() == 1)
  # table[0][1],tanle[0][2]は縦方向にそろっているか調べる
  return 1  if(check4.tate() == 1)
  return 1  if(check5.tate() == 1)
  # どこもそろっていなかったら0を返す
  return 0
end
    
# 出力される表の位置番号をtableの添え字に変換
def number_index(num)
  x = (num - 1) % 3 
  y = (num - 1) / 3 
  return x, y
end

# tableの添え字を出力される表の位置番号に変換
def index_number(x, y)
  x + 1 + y * 3;
end

# 各要素の表示
def output(i, j, mark)
  if(mark == 1)
    print(" ○")
  elsif(mark == 2)
    print(" ×")
  else
    print(" #{index_number(j, i)} ")
 end
 print("｜")  if((j + 1) % 3 != 0)
end

# tableの行単位に制御
def output_rows(i, *pos)
  print(" ")
  j = 0
  pos.each do |mark|
    output(i, j, mark)
    j += 1
  end
  print("\n")

  if((i + 1) % 3 != 0)
    print(" ---＋---＋---\n")
  else
    print("\n")
  end
end

# tableの出力を列ごとに制御
def output_columns(table) 
  i = 0
  print("\n")
  table.each do |elm1, elm2, elm3|
    output_rows(i, elm1, elm2, elm3) 
    i += 1
  end
end

# Set_positioinクラスのインスタンスを扱う関数
# 入力に関する制御を行う
def call_set(num, table, maru)
  x, y = number_index(num)
  pos = SetPosition.new(x, y, table, maru)
  if (num > 9||num < 1||pos.check_position == false)
    puts("もう一度入力してください")
    input(maru, table)
  else
    # ○または×が置かれた新しいtableが帰ってくる
    pos.set_position
  end
end

# 入力を行う
def input(maru, table)
  print("今は")
  puts maru ? "○の番です\n":"×の番です\n"
  print("入力>")
  num = gets.to_i
  # ○または×が置かれた新しいtableが帰ってくる
  call_set(num, table, maru)
end

# gameクリア画面の表示
def clear(maru)
  print("winner>")
  puts maru ? "○\n":"×\n"
end

# gameoverの判定と表示
# 表が埋まっていたらgameover
def game_over(i)
  if(i >= 9)
    puts("gameover")
    return 1
  else
    return 0
  end
end

# gameを行う関数
def game(maru, table)
  i = 0
  loop do
    table=input(maru, table)
    output_columns(table)
    i += 1
    # gameclearの判定を行う
    if(call_clear(table, maru) == 1)
      clear(maru)
      break
    end
    # gameoverの判定を行う
    break if(game_over(i) == 1)
    maru = !maru # 今の手を反転的に変更
  end
end

# main
# tableは何も置いてない時：0　○が置いてあるとき：1　×が置いてあるとき：2　が格納される
table = Array.new(3).map{Array.new(3, 0)} 
maru = true # 今の手が○ならtrue，×ならfalseを示す
output_columns(table)
puts("○×ゲームを始めます")
game(maru, table)
