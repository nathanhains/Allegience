class CreateVillains < ActiveRecord::Migration[6.1]
  def change
    create_table :villains do |t|
      t.integer :user_id
      t.string :name
      t.string :avatar
      t.string :allegience, default: "Villain"
      t.timestamps
    end
  end
end
