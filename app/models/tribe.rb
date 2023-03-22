class Tribe < ApplicationRecord
  belongs_to :house
  has_many :spendings, dependent: :destroy
  has_many :users, dependent: :destroy

  validates :keys, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than: 1000 }
  validates :color, presence: true, length: { maximum: 50 }
  validates :shareholding, presence: true, numericality: { greater_than: 0, less_than_or_equal_to: 1 }
end
