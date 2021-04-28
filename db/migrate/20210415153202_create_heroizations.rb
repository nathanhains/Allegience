class CreateHeroizations < ActiveRecord::Migration[6.1]
  def change
    create_table :heroizations do |t|
      t.integer :hero_id
      t.integer :user_id
      t.string :avatar
      t.integer :hero_rank, default: 0
      t.integer :hero_level, default: 0
      t.timestamps
    end
  end
end
