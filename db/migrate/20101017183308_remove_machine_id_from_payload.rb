class RemoveMachineIdFromPayload < ActiveRecord::Migration
  def self.up
    remove_column :payloads, :machine_id
  end

  def self.down
    add_column :payloads, :machine_id, :string, :null => false
  end
end
