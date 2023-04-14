require 'rails_helper'

RSpec.describe House, type: :model do
  subject { House.new(name: "kermaria") }

  describe 'associations' do
    it { should have_many(:tribes) }
    it { should have_many(:platforms) }
    it { should have_many(:users) }
    it { should have_many(:bookings) }
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_most(50) }
  end
end
