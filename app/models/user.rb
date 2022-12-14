class User < ApplicationRecord
  has_many :trips
  has_many :bookings
  has_many :booked_trips, through: :bookings, source: :trip
  has_many :bookmarks
  has_many :saved_trips, through: :bookmarks, source: :trip

  # has_one_attached :image
end
