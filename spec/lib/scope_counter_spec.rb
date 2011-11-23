require 'spec_helper'

describe "scope_counter" do
  before(:each) do
    @advice = Advice.create(:text => "Some advice") 
  end

  it "should increase usefull count after usefull utility creation" do
    @advice.utilities.create(:usefull => true)
    @advice.reload
    @advice.usefull_count.should == 1
    @advice.useless_count.should == 0
  end
  
  it "should increase useless count after useless utility creation" do
    @advice.utilities.create(:usefull => false)
    @advice.reload
    @advice.useless_count.should == 1
    @advice.usefull_count.should == 0
  end

end
