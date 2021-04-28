class CreateCivilianFactions < ActiveRecord::Migration[6.1]
  def change
    create_table :civilian_factions do |t|
      t.string :name
      t.integer :owner_id
      t.integer :requestor_id
      t.timestamps
    end
  end
end
