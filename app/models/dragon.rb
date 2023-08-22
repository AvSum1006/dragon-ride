class Dragon < ApplicationRecord
  CATEGORY = %w[Wyvern Wyrm Quetzalcoatl Hydra Drake]

  has_many :bookings
  belongs_to :user

  validates :name, :category, :location, :price_per_day, :description, :seats, :age, presence: true
  validates :category, inclusion: { in: CATEGORY }
end
