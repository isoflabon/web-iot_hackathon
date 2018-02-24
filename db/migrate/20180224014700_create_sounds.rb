class CreateSounds < ActiveRecord::Migration[5.0]
  def change
    create_table :sounds do |t|
      t.text :name
      t.integer :effect_count

      t.timestamps
    end
  end
end
