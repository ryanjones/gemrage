class PayloadsController < ApplicationController

  before_filter :authenticate_user!

  def show
    results = Payload.where(:uid => params[:id])
    if results.empty?
      render :nopayload, :status => 404
    elsif results.size == 1
      session[:payload] = params[:id]
      redirect_to profile_url
    else
      render :status => 400
    end
  end

  def update
    
  end
end
