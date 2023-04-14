require 'rails_helper'

RSpec.describe Tribe, type: :model do
  let(:house) { House.new(name: 'kermaria') }

  subject do
    Tribe.new(
      keys: 150,
      color: 'green',
      shareholding: 0.5,
      house:
    )
  end

  describe 'associations' do
    it { should belong_to(:house) }
    it { should have_many(:users) }
    it { should have_many(:spendings) }
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    describe 'keys' do
      it { should validate_presence_of(:keys) }
      it { should validate_numericality_of(:keys).only_integer }
      it { should validate_numericality_of(:keys).is_greater_than_or_equal_to(0) }
      it { should validate_numericality_of(:keys).is_less_than(1_000) }
    end

    describe 'color' do
      it { should validate_presence_of(:color) }
      it { should validate_length_of(:color).is_at_most(50) }
    end

    describe 'shareholding' do
      it { should validate_presence_of(:shareholding) }
      it { should validate_numericality_of(:shareholding) }
      it { should validate_numericality_of(:shareholding).is_greater_than(0) }
      it { should validate_numericality_of(:shareholding).is_less_than_or_equal_to(1) }
    end
  end
end
