class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :con

  validates :date, presence: true
end
