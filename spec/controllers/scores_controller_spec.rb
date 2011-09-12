require 'spec_helper'

describe ScoresController do
  render_views
  
  describe "Get 'new'" do
    it "should be successful" do
      get :new
      response.should be_success
    end
    
    it "should have the right title" do
      get :new
      response.should have_selector("title", :content => "Enter your score" )
    end
    
    it "should have a score input field" do
      get :new
      response.should have_selector("input[name='score[score_string]'][type='text']")
      
    end
    
  end
  
  describe "POST 'create'" do
    
    describe "invalid input" do
      
      before(:each) do
        @attr = { :score_string => '' }
      end
      
      it "should re-render the new page" do
        post :create, :score => @attr
        response.should render_template('new')
      end
      
      it "should have the right title" do
        post :create, :score => @attr
        response.should have_selector("title", :content => "Enter your score" )        
      end
      
      it "should have a flash.now message" do
        post :create, :score => @attr
        flash.now[:error].should =~ /invalid/i
      end
      
    end
    
   
  end

end
