class House < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  has_many :tribes, dependent: :destroy
  has_many :users, through: :tribes
  has_many :platforms, dependent: :destroy
  has_many :bookings, dependent: :destroy
end
