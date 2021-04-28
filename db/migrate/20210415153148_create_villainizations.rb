class CreateVillainizations < ActiveRecord::Migration[6.1]
  def change
    create_table :villainizations do |t|
      t.integer :villain_id
      t.integer :user_id
      t.string :avatar
      t.integer :villain_rank, default: 0
      t.integer :villain_level, default: 0
      t.timestamps
    end
  end
end
