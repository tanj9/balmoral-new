class Platform < ApplicationRecord
  belongs_to :house

  validates :name, presence: true, length: { maximum: 50 }
end
