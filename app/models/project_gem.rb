class ProjectGem < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  belongs_to :rubygem
  
  # { :name => :version }
  def self.process(project, data)
    rows = data.map do |name, version|
      rubygem = Rubygem.cs_find_or_create_by_name(name)
      { :user_id => project.user.id, 
        :rubygem_id => rubygem.id,
        :version => version }
    end
    
    # create/update/delete
    gem_ids = []
    
    rows.each do |g|
      # find by user, gem, project
      pg = where(g.reject {|k,v| k == :version}).first
      if pg.present?
        pg.update_attributes(:version => g[:version]) # update version
      else
        create(g)
      end
      gem_ids << g[:rubygem_id]
    end
    
    # delete gems that were removed from the projects
    unless gem_ids.empty?
      ProjectGem.delete_all([ 
        "user_id = :user_id AND project_id = :project_id AND rubygem_id NOT IN (:rubygem_id)", {
        :user_id => project.user.id, 
        :project_id => project.id, 
        :rubygem_id => gem_ids } ])
    end
  end
  
end
