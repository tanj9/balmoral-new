class Spending < ApplicationRecord
  belongs_to :tribe

  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :date, presence: true, timeliness: { type: :date }
  validates :category, presence: true, length: { maximum: 50 }
  validates :details, presence: true, length: { in: 7..400 }
end
