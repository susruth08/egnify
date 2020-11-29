class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.string :method
      t.integer :response_in_seconds
      t.string :server_session_id

      t.timestamps
    end
  end
end
