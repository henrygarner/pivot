require 'spec_helper'

describe DateDimension do
  before(:each) do
    @valid_attributes = {
      :day => "value for day",
      :month => "value for month"
    }
  end

  it "should create a new instance given valid attributes" do
    DateDimension.create!(@valid_attributes)
  end
end
