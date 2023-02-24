class House < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  has_many :tribes
end
