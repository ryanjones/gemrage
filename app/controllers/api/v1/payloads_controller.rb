class Api::V1::PayloadsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def system
    # Payload.create_from_params
    respond_to do |format|
      format.json do
        begin
          render(:json => { :location => payload_url(Payload.create_from_params(params)) })
        rescue
          render(:json => { :error => 'An error has occurred' }, :status => 500)
        end
      end
    end
  end

  def project
  end
end