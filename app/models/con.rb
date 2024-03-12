class Con < ApplicationRecord
  CATEGORY = ["con de droite", "chroniqueur france inter", "mysogine", "beauf", "supporter de foot", "zadiste", "influenceur", "avocat fiscaliste", "conspirationniste", "Pascal Praud"]

  has_many :bookings, dependent: :destroy
  belongs_to :user
  has_many_attached :photos

  validates :name, presence: true
  validates :description, length: { minimum: 15 }
  validates :price, presence: true, numericality: { only_integer: true }
  validates :category, inclusion: { in: CATEGORY }
end
