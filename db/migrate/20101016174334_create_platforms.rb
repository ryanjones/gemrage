class CreatePlatforms < ActiveRecord::Migration
  def self.up
    create_table :platforms do |t|
      t.string :code, :name, :null => false, :limit => 20
    end
    add_index :platforms, :code, :unique => true
  end

  def self.down
    remove_index :platforms, :column => :code
    drop_table :platforms
  end
end
