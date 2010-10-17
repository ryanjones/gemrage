# look up table
class Platform < ActiveRecord::Base
  validates_presence_of :code, :name
  validates_uniqueness_of :code
  
  has_many :installed_gems
  
  def self.id_for_code(code)
    @platforms_by_code ||= all.index_by(&:code)
    @platforms_by_code[code].id
  end
  
end
