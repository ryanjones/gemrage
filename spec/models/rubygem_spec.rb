require 'spec_helper'

describe Rubygem do
  subject do
    Rubygem.new(:name => "gemrage")
  end

  it  { should be_valid }
  
  it "should not be valid if name is nil" do
     subject.name = nil
     subject.should_not be_valid
  end
end

describe "case sensitive database" do
  before(:each) do
    @gem1 = Rubygem.create(:name => "BlueCloth")
    @gem2 = Rubygem.create(:name => "bluecloth")
  end

  it "should allow gems with case-unique names" do
    @gem1.should be_valid
    @gem2.should be_valid
  end

  it "should not allow gems with the exact same name" do
    Rubygem.create(:name => "bluecloth").should_not be_valid
  end
  
  it "should consider case sensitive names unique" do
    Rubygem.where("BINARY name = :name", :name => "BlueCloth").count.should == 1
  end
end