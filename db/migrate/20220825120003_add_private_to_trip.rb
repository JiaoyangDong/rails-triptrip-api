class AddPrivateToTrip < ActiveRecord::Migration[7.0]
  def change
    add_column :trips, :public, :boolean, default: false, null: false
  end
end
