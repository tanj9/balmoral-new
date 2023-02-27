class Booking < ApplicationRecord
  belongs_to :platform
  belongs_to :house
  belongs_to :user
end
