class InstalledGem < ActiveRecord::Base
  belongs_to :user
  belongs_to :machine

  belongs_to :rubygem
  belongs_to :platform

  # Process installed_gems payload from gem scanner
  # { name => { platform => version_list, ... }, ... }
  def self.process(machine, payload)
    rows = payload.map do |name, platform_data|
      process_gem(name, platform_data)
    end.flatten
    
    # delete all
    purge!(machine)
    
    # create
    rows.each do |attributes|
      create!(attributes.merge!(
        {:user_id => machine.user_id, :machine_id => machine.id}
      ))
    end
    
  end

private
  # Pair payload gem name to our gems table
  def self.process_gem(name, platform_data)
    rubygem = Rubygem.cs_find_or_create_by_name(name)
    result = process_platforms(platform_data)
    result.each do |e|
      e.merge!({:rubygem_id => rubygem.id})
    end
    result
  end

  # Convert platform data into an array of create(attributions)
  # { platform => version_list, ... }
  def self.process_platforms(data)
    data.map do |platform, versions|
      { :platform_id => Platform.id_for_code(platform), :version_list => versions }
    end
  end
 
  def self.purge!(machine)
    InstalledGem.delete_all(:user_id => machine.user_id,
                            :machine_id => machine.id)
  end
  
end
