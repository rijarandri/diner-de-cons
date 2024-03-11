class Con < ApplicationRecord
  CATEGORY = ["con de droite", "collectionneur", "hobbie bizarre", "con de gauche", "fanatique", "mysogine", "beauf"]
  has_many :bookings, dependent: :destroy
  belongs_to :user
  has_many_attached :photos

  validates :name, presence: true
  validates :description, length: { minimum: 15 }
  validates :price, presence: true, numericality: { only_integer: true }
  validates :category, inclusion: { in: CATEGORY }
end
