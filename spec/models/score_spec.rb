require 'spec_helper'

describe Score do 
  
  before(:each) do
    @score = Score.new
  end 
  
  it "should have a calculate comand" do
    @score.should respond_to(:calculate)
  end
  
  it "should calulate 12 strikes" do
    strike = @score.calculate "XXXXXXXXXXXX"
    strike.should == 300
  end
  
  it "should calulate 10 pairs of 9 and miss" do
    strike = @score.calculate "9-9-9-9-9-9-9-9-9-9-"
    strike.should == 90
  end
  
  it "should calulate 10 pairs of 5 and spare" do
    strike = @score.calculate "5/5/5/5/5/5/5/5/5/5/5" 
    strike.should == 150
  end
  
end