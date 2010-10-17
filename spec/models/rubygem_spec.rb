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
    Rubygem.where("BINARY name = :name", :name => 'BlueCloth').count.should == 1
  end
  
  it "should find a gem" do
    Rubygem.cs_find_by_name('BlueCloth').id.should == @gem1.id
  end
  
  it "should report nil for missing gems" do
    Rubygem.cs_find_by_name('missing').should be_nil
  end

  context "when creating gems" do
    it "should find existing gems instead of creating" do
      Rubygem.cs_find_or_create_by_name('bluecloth').id.should == @gem2.id
    end
  
    it "should create new gems" do
      gem3 = Rubygem.cs_find_or_create_by_name('bLuEcLoTh')
      gem3.id.should_not == @gem1.id
      gem3.id.should_not == @gem2.id
      Rubygem.count.should == 3
    end
  end
end