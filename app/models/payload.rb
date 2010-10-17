require 'digest/sha1'

class Payload < ActiveRecord::Base
  before_validation :uid!

  validates_presence_of :uid
  validates_presence_of :payload
  validates_uniqueness_of :uid

  def to_param
    uid
  end

  def self.process(user, payload_uid)
    payload = find_by_uid(payload_uid)
    data = JSON.parse(payload.payload)
    
    Payload.transaction do
      machine_identifier = data['header']['machine_id']
      
      # gem credentials
      
      
      # installed gems
      if data.has_key?('installed_gems')
        machine = user.machines.find_or_create_by_identifier(machine_identifier)
        InstalledGem.process(machine, data['installed_gems'])
      end
      
      # project gems
      if data.has_key?('projects')
        user.projects.process( data['projects'] )
      end
      
      # Destroy payload after processing
      payload.destroy
    end
  
  # If anything breaks, this shouldn't happen
  
  #rescue 
    # failed
    # hoptoad?
  end

private

  def uid!
    self.uid = Digest::SHA1.hexdigest(payload)
  end
end