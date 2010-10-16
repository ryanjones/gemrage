class Machine < ActiveRecord::Base
  validates_presence_of :identifier
  validates_uniqueness_of [:user_id, :identifier]
  
  belongs_to :user
  has_many :installed_gems
end
