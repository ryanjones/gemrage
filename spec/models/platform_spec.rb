require 'spec_helper'

describe Platform do
  before(:each) do
    @mri = Platform.create(:code => 'mri', :name => 'Matz Ruby')
    @ree = Platform.create(:code => 'ree', :name => 'Enterpisey')
  end
  
  it do 
    @mri.should be_valid 
    @ree.should be_valid
  end
  
  it "should return id for a code" do
    Platform.id_for_code('mri').should == @mri.id
    Platform.id_for_code('ree').should == @ree.id
  end
  
  
end
