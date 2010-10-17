class ProfilesController < ApplicationController
  def show
    if session[:payload]
      @payload = Payload.find_by_uid(session[:payload])
    end
  end
end
