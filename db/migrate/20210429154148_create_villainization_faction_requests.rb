class CreateVillainizationFactionRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :villainization_faction_requests do |t|
      t.integer :faction_request_id
      t.integer :requestor_id
      t.boolean :accepted, default: false
      t.timestamps
    end
  end
end
