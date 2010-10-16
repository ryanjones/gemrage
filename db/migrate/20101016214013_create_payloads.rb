class CreatePayloads < ActiveRecord::Migration
  def self.up
    create_table :payloads do |t|
      t.string :uid
      t.string :machine_id
      t.text :payload

      t.timestamps
    end

    add_index :payloads, :uid, :unique => true
  end

  def self.down
    drop_table :payloads
  end
end
