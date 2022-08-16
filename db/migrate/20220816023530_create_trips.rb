class CreateTrips < ActiveRecord::Migration[7.0]
  def change
    create_table :trips do |t|
      t.string :title
      t.string :location
      t.string :image
      t.date :start_date
      t.date :end_date
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.string :status
      t.integer :capacity

      t.timestamps
    end
  end
end
