class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :description
      t.integer :requirement
      t.integer :reward
      t.string :power_reward
      t.integer :requestor_user_id
      t.integer :responder_user_id
      t.timestamps
    end
  end
end
