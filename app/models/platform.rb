class Platform < ActiveRecord::Base
  validates_presence_of :ruby, :version, :group
  validates_uniqueness_of [:ruby, :version]
end
