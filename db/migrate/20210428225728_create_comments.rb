class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :civilian_id
      t.integer :civilian_faction_id
      t.timestamps
    end
  end
end
