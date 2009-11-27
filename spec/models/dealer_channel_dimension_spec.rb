require 'spec_helper'

describe DealerChannelDimension do
  before(:each) do
    @valid_attributes = {
      :name => "value for name"
    }
  end

  it "should create a new instance given valid attributes" do
    DealerChannelDimension.create!(@valid_attributes)
  end
end
