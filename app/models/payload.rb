require 'digest/sha1'

class Payload < ActiveRecord::Base
  before_validation :uid!

  validates_presence_of :uid
  validates_presence_of :machine_id
  validates_presence_of :payload
  validates_uniqueness_of :uid

  class << self
    def create_from_params(params)
      pay = params[:payload]
      create(:machine_id => pay[:header][:machine_id], :payload => pay[:installed_gems].to_json)
    end
  end

  def to_param
    uid
  end

private

  def uid!
    self.uid = Digest::SHA1.hexdigest(payload)
  end
end