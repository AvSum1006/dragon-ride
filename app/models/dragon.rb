class Dragon < ApplicationRecord
  CATEGORY = %w[Wyvern Wyrm Quetzalcoatl Hydra Drake]

  has_one_attached :image
  has_many :bookings
  belongs_to :user

  validates :name, :category, :location, :price_per_day, :description, :seats, :age, :image, presence: true
  validates :category, inclusion: { in: CATEGORY }
  validates :seats, :price_per_day, :age, comparison: { greater_than: 0 }
end
