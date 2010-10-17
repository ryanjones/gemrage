class Project < ActiveRecord::Base
  belongs_to :user
  has_many :project_gems
  
  validates_presence_of :name
  validates_presence_of :identifier
end
