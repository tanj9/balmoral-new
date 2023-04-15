require 'rails_helper'

RSpec.describe Spending, type: :model do
  let(:house) { House.new(name: 'kermaria') }
  let(:tribe) do
    Tribe.new(
      keys: 150,
      color: 'green',
      shareholding: 0.5,
      house:
    )
  end

  subject do
    Spending.new(
      amount: 1,
      date: Date.new(2023, 2, 1),
      category: "gardening",
      details: "3 hours of gardening in January",
      tribe:
    )
  end

  describe 'associations' do
    it { should belong_to(:tribe) }
  end

  describe 'validations' do
    it 'should be valid with valid attributes' do
      expect(subject).to be_valid
    end
    describe 'amount' do
      it { should validate_presence_of(:amount) }
      it { should validate_numericality_of(:amount).is_greater_than(0) }
    end
    describe 'date' do
      it { should validate_presence_of(:date) }
      it 'date should be of type date' do
        subject.date = "a given date"
        expect(subject).to_not be_valid
      end
    end
    describe 'category' do
      it { should validate_presence_of(:category) }
      it { should validate_length_of(:category).is_at_most(50) }
    end
    describe 'details' do
      it { should validate_presence_of(:details) }
      it { should validate_length_of(:details).is_at_least(7) }
      it { should validate_length_of(:details).is_at_most(400) }
    end
  end
end
