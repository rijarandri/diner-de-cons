class User < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :cons

  validates :first_name, presence: true
  validates :last_name, presence: true
end
