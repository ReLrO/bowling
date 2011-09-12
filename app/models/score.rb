class Score 
  
  
  def calculate score_string
      
      score = 0
      
      score_array = score_string.split('')
      (0..score_array.length-1).each do |i|
        score += point(i, score_array)
      end 
      score 
  end
  
  private
  
  def point position, score_array
    if score_array[position] == "X"
      if (position + 2).nil? == false && (position + 2) <= score_array.length-1
        10 + translate(score_array[position + 1], score_array[position]) + translate(score_array[position + 2], score_array[position + 1])
      end
    elsif score_array[position] == "/"
      translate(score_array[position], score_array[position - 1]) + translate(score_array[position + 1], score_array[position])
    else
      translate(score_array[position],0)
    end
  
  end
  
  def translate point, previous_point
    if point == "X"
      10
    elsif point == "-"
      0
    elsif point == "/"
      10 - (previous_point == "-" ? 0 : previous_point.to_i)  
    else
      point.to_i
    end
  end
  
  
end