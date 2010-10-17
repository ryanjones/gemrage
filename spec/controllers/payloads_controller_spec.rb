require 'spec_helper'

describe PayloadsController do

  context "with user login" do
  
    before(:each) do
      user_logged_in
      @controller.stub(:current_user).and_return(mock_user(:handle => "bawls"))
    end

    describe "GET show" do

      def do_get
        get :show, :id => 42
      end

      context "with valid payload" do

        before(:each) do
          Payload.stub(:where).with({:uid => 42}).and_return([mock_payload])
        end

        it "should redirect to the profile page" do
          do_get
          response.should redirect_to(profiles_url("bawls", :payload => 42))
        end
      end

      context "with nonexistant payload" do
      
        before(:each) do
          Payload.stub(:where).with({:uid => 42}).and_return([])
        end
        
        it "should return HTTP 404" do
          do_get
          response.status.should == 404
        end

        it "should render a payload not found page" do
          do_get
          response.should render_template("nopayload")
        end
      end
    end
  end

  context "without user login" do

    describe "GET show" do
      
      it "should redirect to the login page" do
        get :show, :id => 42
        response.should redirect_to(new_user_session_url)
      end
    end
  end
  
end
