require 'spec_helper'
require 'digest/sha1'

describe Payload do
  it 'should generate a uid when created' do
    Payload.create(:machine_id => 'foo', :payload => 'bar').uid.should == Digest::SHA1.hexdigest('bar')
  end
end
