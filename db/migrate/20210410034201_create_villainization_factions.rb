class CreateVillainizationFactions < ActiveRecord::Migration[6.1]
  def change
    create_table :villainization_factions do |t|
      t.string :name
      t.integer :owner_id
      t.integer :joiner_id

      t.timestamps
    end
  end
end
