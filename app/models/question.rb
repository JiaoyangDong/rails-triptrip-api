class Question < ApplicationRecord
  belongs_to :trip
  has_many :answers, dependent: :destroy
  has_many :options, dependent: :destroy
end
