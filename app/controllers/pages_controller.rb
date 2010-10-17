class PagesController < ApplicationController
  def home
    redirect_to(profile_url) if user_signed_in?
  end
end