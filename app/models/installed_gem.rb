class InstalledGem < ActiveRecord::Base
  belongs_to :user
  belongs_to :machine
  
  belongs_to :rubygem
  belongs_to :platform
  
  # { name => { platform => version_list, ... }, ... }
  def self.create_from_hash(payload)
    
  end

private
  # { platform => version_list, ... }
  def self.attributes_from_gem_hash(data)
    data.map do |platform, versions|
      { :platform_id => Platform.id_for_code(platform), :version_list => versions }
    end
  end
  
  def self.purge

  end
  
end
