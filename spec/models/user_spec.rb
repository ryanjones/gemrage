require 'spec_helper'

describe User do

  before(:each) do
    @valid_attrs = {
      :email => "bawls@soup.com",
      :handle => "bawls",
      :password => "b4w1ss",
      :password_confirmation => "b4w1ss",
    }
    @user = User.new(@valid_attrs)
  end

  it "should be valid with valid attributes" do
    @user.should be_valid
  end
end
