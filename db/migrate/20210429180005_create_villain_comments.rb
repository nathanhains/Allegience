class CreateVillainComments < ActiveRecord::Migration[6.1]
  def change
    create_table :villain_comments do |t|
      t.text :body
      t.integer :villainization_id
      t.integer :villainization_faction_id
      t.timestamps
    end
  end
end
