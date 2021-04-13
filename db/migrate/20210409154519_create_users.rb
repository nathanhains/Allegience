class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :allegience, default: "Civilian"
      t.string :alter_ego, default: "N/A"
      t.string :power, default: "N/A"
      t.integer :civilian_rank, default: 0
      t.integer :powered_rank, default: 0 

      t.timestamps
    end
  end
end
