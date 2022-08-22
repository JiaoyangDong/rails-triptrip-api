class AddLatitudeToTrip < ActiveRecord::Migration[7.0]
  def change
    add_column :trips, :latitude, :decimal
  end
end
