class CreatePlatforms < ActiveRecord::Migration
  def self.up
    create_table :platforms do |t|
      t.string :ruby, :version, :group, :limit => 20, :null => false
    end
    add_index :platforms, [:ruby, :version], :name => :platforms_ruby_version, :unique => true
    add_index :platforms, :group
  end

  def self.down
    remove_index :platforms, :name => :group
    remove_index :platforms, :name => :platforms_ruby_version
    drop_table :platforms
  end
end
