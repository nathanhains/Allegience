class CreateHeroizationFactions < ActiveRecord::Migration[6.1]
  def change
    create_table :heroization_factions do |t|
      t.string :name
      t.integer :owner_id
      t.integer :joiner_id
      t.string :description
      t.timestamps
    end
  end
end
