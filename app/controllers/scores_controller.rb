class ScoresController < ApplicationController
  
  def new
    @title = "Enter your score"
    @score = Score.new
  end
  
  def create
    @score = Score.new
    result = @score.calculate(params[:score][:score_string])
    unless params[:score][:score_string] == ''
      flash[:success] = "Your score is #{result}" 
      render 'new'
    else
      @title = "Enter your score"
      flash[:error] = "invalid score"
      render 'new'
      
    end
  end
  
end
