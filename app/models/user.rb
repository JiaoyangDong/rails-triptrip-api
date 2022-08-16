class User < ApplicationRecord
  has_many :trips
  has_many :bookings
  has_many :bookmarks
  has_many :saved_trips, through: :bookmarks, source: :trip
end
