class InstalledGem < ActiveRecord::Base
  belongs_to :user
  belongs_to :rubygem
  belongs_to :machine
  belongs_to :platform
end
