require 'spec_helper'

describe InstalledGem do
end

# @payload = {
#   'bluecloth' => { 'ree' => '2.0.9,2.0.7,2.0.6.pre120',
#                    'mri_19' => '2.0.9' },
#   'BlueCloth' => { 'mri_186' => '1.0.1' }
# }  
  
describe "Given a gem on a single platform" do
  before(:each) do
    @hash = { 'mri_186' => '1.0.1' }
  end

  it "should convert to model attribtues" do
    Platform.should_receive(:id_for_code).with('mri_186').and_return(1)
  
    result = InstalledGem.attributes_from_gem_hash( @hash )
    result.should == [
      { :platform_id => 1, :version_list => '1.0.1' }
    ]
  end
end

describe "Given a gem on multiple platforms" do
  before(:each) do
    @hash = { 'ree' => '2.0.9,2.0.7,2.0.6.pre120',
              'mri_19' => '2.0.9' }
  end

  it "should convert to model attribtues" do
    Platform.should_receive(:id_for_code).with('ree').and_return(1)
    Platform.should_receive(:id_for_code).with('mri_19').and_return(2)
    
    result = InstalledGem.attributes_from_gem_hash( @hash )
    result.should =~ [
      { :platform_id => 1, :version_list => '2.0.9,2.0.7,2.0.6.pre120' },
      { :platform_id => 2, :version_list => '2.0.9' },
    ]
  end
end
