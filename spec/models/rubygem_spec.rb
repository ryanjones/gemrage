require 'spec_helper'

describe Rubygem do
  subject do
    Rubygem.new(:name => "gemrage")
  end

  it  { should be_valid }
  
  it "should not be valid if name is nil" do
     subject.name = nil
     should_not be_valid
  end
end
