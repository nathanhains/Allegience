class CreateHeros < ActiveRecord::Migration[6.1]
  def change
    create_table :heros do |t|
      t.string :name
      t.string :avatar
      t.string :allegience, default: "Hero"
      t.timestamps
    end
  end
end
