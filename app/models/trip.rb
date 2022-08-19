class Trip < ApplicationRecord
  belongs_to :user
  has_many :questions, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :attendees, through: :bookings, source: :user
  has_many :trip_tags, dependent: :destroy
  has_many :tags, through: :trip_tags
  has_many :bookmarks

  has_one_attached :image
  # validates :start_date < :end_date
  # validates :start_date > Date.today
  validates :start_date, presence: true
  validates :end_date, presence: true
end
