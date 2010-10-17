class Project < ActiveRecord::Base
  belongs_to :user
  has_many :gems, :class_name => 'ProjectGem'
  
  validates_presence_of :name
  validates_presence_of :identifier
  
  # [ :name => '', :identifer => '', :gems => {} ]
  def self.process(payload)
    payload.each do |p|
      # only set the name on create (user can edit)
      debugger
      project = find_by_identifier(p['identifier']) || 
                create(:name => p['name'], :identifier => p['identifier'])
      project.gems.process(p['gems'])
    end
  end
  
end
