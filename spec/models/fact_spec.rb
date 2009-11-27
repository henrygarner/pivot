require 'spec_helper'

describe Fact do
  before(:each) do
    @valid_attributes = {
      :value => 9.99
    }
  end

  it "should create a new instance given valid attributes" do
    Fact.create!(@valid_attributes)
  end
end
