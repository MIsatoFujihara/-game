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
    while($table[j][i] == maru_state()) do
      clear+=1
      return 1 if(clear > 2)
      i+=1
      j+=1
    end
    return 0
  end
  def naname2
    i,j=@i,@j
    clear=0
    while($table[j][i] == maru_state()) do
      clear+=1
      return 1 if(clear > 2)
      i+=1
      j-=1
    end
    return 0
  end
  # 縦方向にそろっているか確認
  def tate
    i,j=@i,@j
    clear=0
    while($table[j][i] == maru_state()) do
      clear+=1
      return 1 if(clear > 2)
      j+=1
    end
    return 0
  end
  # 横方向にそろっているか確認
  def yoko
    i,j=@i,@j
    clear=0
    while($table[j][i] == maru_state()) do
      clear+=1
      return 1 if(clear > 2)
      i+=1
    end
    return 0
  end
end