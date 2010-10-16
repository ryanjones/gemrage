class CreateMachines < ActiveRecord::Migration
  def self.up
    create_table :machines do |t|
      t.references :user, :null => false
      t.string :identifier, :null => false
    end
    add_index :machines, [:user_id, :identifier], :unique => true
  end

  def self.down
    remove_index :machines, :name => :index_name
    drop_table :machines
  end
end
