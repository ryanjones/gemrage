class ProfilesController < ApplicationController

  def show
    if session[:payload]
      @payload = Payload.find_by_uid(session[:payload])
    end
  end

  def public_profile
    @user = User.where(:handle => params[:handle]).first
    render(:action => 'user_not_found', :status => :not_found) unless @user
  end

  def public_gems
    @user = User.where(:handle => params[:handle]).first
    render(:action => 'user_not_found', :status => :not_found) and return unless @user
    @gems = @user.installed_gems.ranked
  end
end