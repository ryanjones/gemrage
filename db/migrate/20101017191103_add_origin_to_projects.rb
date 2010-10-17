class AddOriginToProjects < ActiveRecord::Migration
  def self.up
    add_column :projects, :origin, :string, :null => true
    add_index :projects, [:origin, :user_id], :name => :projects_origin_user
  end

  def self.down
    remove_index :projects, :name => :projects_origin_user
    remove_column :projects, :origin
  end
end
