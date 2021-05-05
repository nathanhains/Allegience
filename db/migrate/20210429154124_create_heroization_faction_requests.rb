class CreateHeroizationFactionRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :heroization_faction_requests do |t|
      t.integer :faction_request_id
      t.integer :requestor_id
      t.boolean :accepted, default: false
      t.string :description
      t.timestamps
    end
  end
end
