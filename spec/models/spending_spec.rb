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

  it 'should be valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'should have an amount' do
    subject.amount = nil
    expect(subject).to_not be_valid
  end

  it 'amount should be a number' do
    subject.amount = 'word'
    expect(subject).to_not be_valid
  end

  it 'amount should be greater than zero' do
    subject.amount = -1
    expect(subject).to_not be_valid
  end

  it 'amount should be different from zero' do
    subject.amount = 0
    expect(subject).to_not be_valid
  end

  it 'should have a date' do
    subject.date = nil
    expect(subject).to_not be_valid
  end

  it 'date should be of type date' do
    subject.date = "a given date"
    expect(subject).to_not be_valid
  end

  it 'should have a category' do
    subject.category = nil
    expect(subject).to_not be_valid
  end

  it 'category should not be too long' do
    subject.category = "a" * 51
    expect(subject).to_not be_valid
  end

  it 'should have details' do
    subject.details = nil
    expect(subject).to_not be_valid
  end

  it 'details should have minimum length (more than 7 chars)' do
    subject.details = "123456"
    expect(subject).to_not be_valid
  end

  it 'details should not be too long (less than 400 chars)' do
    subject.details = "a" * 401
    expect(subject).to_not be_valid
  end

  it 'should have a tribe' do
    subject.tribe = nil
    expect(subject).to_not be_valid
  end
end
