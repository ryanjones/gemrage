class ApplicationController < ActionController::Base
  protect_from_forgery

protected

  def redirect_back_or_default(default)
    redirect_to(request.referer || default)
  end
end
