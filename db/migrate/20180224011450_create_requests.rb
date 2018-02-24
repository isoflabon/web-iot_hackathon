class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.integer :request_id
      t.text :sound_name

      t.timestamps
    end
  end
end
