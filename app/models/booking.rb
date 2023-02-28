class Booking < ApplicationRecord
  belongs_to :house
  belongs_to :user, optional: true
  belongs_to :platform, optional: true

  validates :key_price, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :start_date, presence: true, timeliness: { type: :date }
  validates :end_date, presence: true, timeliness: { type: :date }
  validates :status, presence: true

  validates :user, presence: true, unless: :platform?
  validates :platform, presence: true, unless: :user?

  def platform?
    platform.present?
  end

  def user?
    user.present?
  end
end
