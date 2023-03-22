class House < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  has_many :tribes, dependent: :destroy
  has_many :platforms, dependent: :destroy
end
