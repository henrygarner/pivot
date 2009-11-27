require 'spec_helper'

describe BaseDimension do
  before(:each) do
    @valid_attributes = {
      :base => "value for base",
      :connected => "value for connected"
    }
  end

  it "should create a new instance given valid attributes" do
    BaseDimension.create!(@valid_attributes)
  end
end
