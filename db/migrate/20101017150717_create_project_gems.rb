class CreateProjectGems < ActiveRecord::Migration
  def self.up
    create_table :project_gems do |t|
      t.references :user, :project, :rubygem, :null => false
      t.string :version
      t.timestamps
    end
    add_index :project_gems, :user_id
    add_index :project_gems, :rubygem_id
    add_index :project_gems, :project_id
  end

  def self.down
    remove_index :project_gems, :project_id
    remove_index :project_gems, :rubygem_id
    remove_index :project_gems, :user_id
    drop_table :project_gems
  end
end
