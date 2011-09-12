class Score 
  include ActiveModel::Validations 
  
  validates_presence_of :score_string
  
  attr_accessor :score_string
  
  def to_key
  end
  
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
    result = 0
    if score_array[position] == "X"
      unless position + 2  > score_array.length-1
        result = 10 + translate(score_array[position + 1], score_array[position]) + translate(score_array[position + 2], score_array[position + 1])
      end
    elsif score_array[position] == "/"
        result = translate(score_array[position], score_array[position - 1]) + translate(score_array[position + 1], score_array[position])
    else
      unless (score_array[position-1] == "/") && (position == score_array.length-1)
        result = translate(score_array[position],0)
      end
    end
    result
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