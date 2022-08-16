class Booking < ApplicationRecord
  belongs_to :trip
  belongs_to :user
  has_many :answers, dependent: :destroy
end
