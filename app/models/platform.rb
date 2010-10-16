# look up table
class Platform < ActiveRecord::Base
  validates_presence_of :code, :name
  validates_uniqueness_of :code
  
  has_many :installed_gems
end
