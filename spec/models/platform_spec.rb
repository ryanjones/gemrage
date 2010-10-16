require 'spec_helper'

describe Platform, "validations" do
  subject do
    @valid_attributes = {
      :ruby => 'ruby', 
      :version => '1.8.7',
      :group => 'Ruby 1.8.7'
    }
    Platform.new( @valid_attributes )
  end
  
  it { should be_valid }
  it "should require ruby" do 
    subject.ruby = nil
    subject.should_not be_valid
  end
  it "should require version" do 
    subject.group = nil
    subject.should_not be_valid
  end
  it "should require group" do 
    subject.group = nil
    subject.should_not be_valid
  end
  
  it "should allow two rubies" do
    subject.save
    Platform.create( @valid_attributes.merge(:version => '1.8.6') )
  end
  
  it "should not allow two rubies of the same version" do
    subject.save
    Platform.new( @valid_attributes ).should_not be_valid
  end
end
