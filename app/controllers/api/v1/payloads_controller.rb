class Api::V1::PayloadsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def system
    respond_to do |format|
      format.json do
        begin
          payload = Payload.create_from_params(params)
          debugger
          render(:json => { :location => payload_url(payload) })
        rescue
          render(:json => { :error => 'An error has occurred' }, :status => 400)
        end
      end
    end
  end

  def project
  end
end