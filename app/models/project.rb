class Project < ActiveRecord::Base
  belongs_to :user
  has_many :gems, :class_name => 'ProjectGem'

  validates_presence_of :name
  validates_presence_of :identifier

  # { :name => '', :identifer => '', :gems => {} }
  def self.process(payload)
    payload.each do |identifier, data|
      if data['gems'].present?
        # only set the name on create (user can edit)
        project = find_by_identifier(identifier) ||
                  create(:name => data['name'],
                         :identifier => identifier,
                         :origin => data['origin'])
        project.gems.process(project, data['gems'])
      end
    end
  end

  def to_param
    "#{id}-#{name.parameterize}"
  end
end
