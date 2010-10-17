require 'spec_helper'

describe InstalledGem do
end

describe "process payload" do
  before(:each) do
    @payload = {
      'bluecloth' => { 'ree' => '2.0.9,2.0.7,2.0.6.pre120',
                       'mri_19' => '2.0.9' },
      'BlueCloth' => { 'mri_186' => '1.0.1' }
    }
    
  end
  
  it "should work" do
    Platform.should_receive(:id_for_code).with('ree').and_return(1)
    Platform.should_receive(:id_for_code).with('mri_19').and_return(2)
    Platform.should_receive(:id_for_code).with('mri_186').and_return(3)
    
    # @user = User.create(@valid_user)  # actually not valid
    @machine = mock_model Machine, :id => 1, :user_id => 1
    InstalledGem.process(@machine, @payload)

    #@machine = @user.machines.find_or_create_by_identifier('mac address')
    #@machine.installed_gems.process(@machine, @payload)
    
    # should
  end
  
end

describe "process gem" do
  
  it "should mash the rubygem id in with the platform attributes" do
    @id = 1
    @name = 'gemrage'
    rubygem = stub_model Rubygem, :id => @id
    Platform.should_receive(:id_for_code).with('ree').and_return(1)
    Platform.should_receive(:id_for_code).with('mri_19').and_return(2)
Rubygem.should_receive(:cs_find_or_create_by_name).with(@name).and_return(rubygem)

    result = InstalledGem.process_gem(@name, { 'ree' => '2.0.7', 'mri_19' => '2.0.9' })
    result.length.should == 2
    result.map do |r|
      r.should have_key(:rubygem_id)
      r[:rubygem_id].should == @id
    end
  end
end



describe "Given a gem on a single platform" do
  before(:each) do
    @hash = { 'mri_186' => '1.0.1' }
  end

  it "should convert to model attribtues" do
    Platform.should_receive(:id_for_code).with('mri_186').and_return(1)
  
    result = InstalledGem.process_platforms( @hash )
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
    
    result = InstalledGem.process_platforms( @hash )
    result.should =~ [
      { :platform_id => 1, :version_list => '2.0.9,2.0.7,2.0.6.pre120' },
      { :platform_id => 2, :version_list => '2.0.9' },
    ]
  end
end
