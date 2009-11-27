require 'spec_helper'

describe Axis do
  before(:each) do
    @valid_attributes = {
      :fact_id => 1,
      :dimension_id => 1,
      :dimension_type => "value for dimension_type"
    }
  end

  it "should create a new instance given valid attributes" do
    Axis.create!(@valid_attributes)
  end
end
