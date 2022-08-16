class Trip < ApplicationRecord
  belongs_to :user
  has_many :questions, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :attendees, through: :bookings, source: :user

end
