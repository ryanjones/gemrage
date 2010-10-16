class CreateInstalledGems < ActiveRecord::Migration
  def self.up
    create_table :installed_gems do |t|
      t.references :user, :rubygem, :machine, :platform, :null => false
      t.text :version_list
      t.timestamps
    end
    add_index :installed_gems, :user_id
    add_index :installed_gems, :rubygem_id
    add_index :installed_gems, :machine_id
    add_index :installed_gems, :platform_id
  end

  def self.down
    remove_index :installed_gems, :platform_id
    remove_index :installed_gems, :machine_id
    remove_index :installed_gems, :rubygem_id
    remove_index :installed_gems, :user_id
    drop_table :installed_gems
  end
end
