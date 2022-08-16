class Question < ApplicationRecord
  belongs_to :trip
  has_many :answers, dependent: :destroy
end
