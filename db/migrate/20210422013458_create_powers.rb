class CreatePowers < ActiveRecord::Migration[6.1]
  def change
    create_table :powers do |t|
      t.string :name
      t.integer :powerable_id
      t.string :powerable_type
      t.integer :heroization_id
      t.integer :villainization_id
      t.integer :hero_id
      t.integer :villain_id
      t.timestamps
    end
  end
end
