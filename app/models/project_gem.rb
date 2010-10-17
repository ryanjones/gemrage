class ProjectGem < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  belongs_to :rubygem
  
  # { :name => :version }
  def self.process(gems)
    gems.map do |name, version|
      rubygem = Rubygem.cs_find_or_create_by_name(name)
      {:rubygem_id => rubygem.id, :version => version}
    end
    # create/update/delete
    gems.each do |g|
      create(g)
    end
  end
  
end
