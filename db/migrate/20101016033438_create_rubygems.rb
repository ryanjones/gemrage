class CreateRubygems < ActiveRecord::Migration
  def self.up
    # utf_bin for case sensitive compares for name (BlueCloth, bluecloth)
    create_table :rubygems, :options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin' do |t|
      t.string :name, :null => false
      t.string :latest_version
      t.text :info
      t.integer :downloads, :null => false, :default => 0
      t.timestamps
      
      # true: need to get data from RubyGems
      t.boolean :queue, :null => false, :default => false 
    end
    
    add_index :rubygems, :name, :unique => false
  end

  def self.down
    remove_index :rubygems, :column => :name
    drop_table :rubygems
  end
end
