require 'spec_helper'

describe Dimension do
  before(:each) do
    @valid_attributes = {
      :metric_id => 1,
      :type => "value for type",
      :additive => false
    }
  end

  it "should create a new instance given valid attributes" do
    Dimension.create!(@valid_attributes)
  end
end
