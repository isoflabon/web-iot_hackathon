class AddUseCountToSounds < ActiveRecord::Migration[5.0]
  def change
    add_column :sounds, :use_count, :integer
  end
end
