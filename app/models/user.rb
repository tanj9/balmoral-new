class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :tribe
  has_many :bookings, dependent: :destroy

  validates :first_name, presence: true, length: { maximum: 30 }
  validates :last_name, presence: true, length: { maximum: 50 }
  validates :role, presence: true, inclusion: { in: %w[admin member], message: "%<value> is not a valid role" }
end
