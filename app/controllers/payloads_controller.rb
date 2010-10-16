class PayloadsController < ApplicationController
  def show
    render(:text => Payload.where(:uid => params[:id]).first.payload)
  end
end