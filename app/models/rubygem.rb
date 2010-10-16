# Caches data from RubyGems

# States:
#  new: just name from scan
#  and queued: get data from RubyGems (DJ)
#  error: retries (delayed job can handle)
#  missing: no data for gem name
#  good: got the data
class Rubygem < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name, :case_sensitive => true
  
  has_many :installed_gems
end
