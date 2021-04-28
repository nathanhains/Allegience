class CreateCivilians < ActiveRecord::Migration[6.1]
  def change
    create_table :civilians do |t|
      t.string :name
      t.string :allegience, default: "Civilian"
      t.string :avatar
      t.integer :civilian_rank, default: 0
      t.integer :civilian_level, default: 0
      t.integer :user_id
      t.timestamps
    end
  end
end
