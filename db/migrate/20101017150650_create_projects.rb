class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.references :user, :null => false
      t.string :name, :identifier, :null => false
      t.timestamps
    end
    add_index :projects, :user_id
    add_index :projects, :identifier
  end

  def self.down
    remove_index :projects, :identifier
    remove_index :projects, :user_id
    drop_table :projects
  end
end
