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
      create(:machine_id => pay[:header][:machine_id], :payload => (pay[:installed_gems] || pay[:projects]).to_json)
    end
  end

  def to_param
    uid
  end

  def self.process(user, payload_uid)
    payload = find_by_uid(payload_uid)

    Payload.transaction do
      machine = user.machines.find_or_create_by_identifier(payload.machine_id)
      InstalledGem.process(machine, JSON.parse(payload.payload))
      # ProjectGem.process
    end
  end

private

  def uid!
    self.uid = Digest::SHA1.hexdigest(payload)
  end
end