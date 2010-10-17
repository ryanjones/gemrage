class PayloadsController < ApplicationController

  before_filter :authenticate_user!

  def show
    results = Payload.where(:uid => params[:id])
    if results.empty?
      render :nopayload, :status => 404
    elsif results.size == 1
      redirect_to profiles_url(current_user.handle, :payload => params[:id])
    else
      render :status => 400
    end
  end
end
