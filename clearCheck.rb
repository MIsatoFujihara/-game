# gameのクリア判定を行う
class ClearCheck
  def initialize(j,i,table,maru)
    @j=j
    @i=i
    @table=table
    @maru=maru
  end
  # 斜め方向にそろっているか確認
  def naname
    i,j=@i,@j
    clear=0
    while(@table[j][i] == maru_state(@maru)) do
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
    while(@table[j][i] == maru_state(@maru)) do
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
    @table=@table.transpose
    # 表中の確認したい列のみを1行の配列としてcheck_tableに格納
    check_table=@table[i]
    check_table.each do |point|
      break if(point != maru_state(@maru))
      clear+=1
      return 1 if(clear > 2)
    end
    return 0
  end
  # 横方向にそろっているか確認
  def yoko
    i,j=@i,@j
    clear=0
    check_table=@table[j]
    check_table.each do |point|
        break if(point != maru_state(@maru))
        clear+=1
        return 1 if(clear > 2)
      end
    return 0
  end
end