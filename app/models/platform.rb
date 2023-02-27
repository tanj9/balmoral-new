class Platform < ApplicationRecord
  belongs_to :house
  has_many :bookings

  validates :name, presence: true, length: { maximum: 50 }
end
