class Booking < ApplicationRecord
  belongs_to :house
  belongs_to :user, optional: true
  belongs_to :platform, optional: true
end
