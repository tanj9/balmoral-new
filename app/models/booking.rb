class Booking < ApplicationRecord
  belongs_to :platform
  belongs_to :house, optional: true
  belongs_to :user, optional: true
end
