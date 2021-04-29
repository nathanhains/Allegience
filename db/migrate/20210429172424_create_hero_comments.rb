class CreateHeroComments < ActiveRecord::Migration[6.1]
  def change
    create_table :hero_comments do |t|
      t.text :body
      t.integer :heroization_id
      t.integer :heroization_faction_id
      t.timestamps
    end
  end
end
