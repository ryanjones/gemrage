class ProjectGem < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  belongs_to :rubygem
  
  # { :name => :version }
  def self.process(user, data)
    rows = data.map do |name, version|
      rubygem = Rubygem.cs_find_or_create_by_name(name)
      { :user_id => user.id, 
        :rubygem_id => rubygem.id,
        :version => version }
    end
    # create/update/delete
    rows.each do |g|
      create(g)
    end
  end
  
end
