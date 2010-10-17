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

  after_create :update_from_rubygems

  # case-sensitive find/create
  def self.cs_find_or_create_by_name(name)
    cs_find_by_name(name) || create(:name => name, :queue => true)
  end

  def self.cs_find_by_name(name)
    where("BINARY name = :name", :name => name).first
  end

  def to_param
    name
  end

  def update_from_rubygems!
  end

  # Async version
  def update_from_rubygems
    delay.update_from_rubygems!
  end
end
