class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :description
      t.integer :requirement
      t.integer :reward
      t.integer :requestor_id
      t.integer :responder_id

      t.timestamps
    end
  end
end
