class CreateAcceptances < ActiveRecord::Migration[6.1]
  def change
    create_table :acceptances do |t|
      t.integer :job_response_id
      t.integer :responder_id

      t.timestamps
    end
  end
end
