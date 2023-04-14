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

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'should have keys' do
    subject.keys = nil
    expect(subject).to_not be_valid
  end

  it 'keys should be an integer' do
    subject.keys = 0.5
    expect(subject).to_not be_valid
  end

  it 'keys should be greater or equal to zero' do
    subject.keys = -1
    expect(subject).to_not be_valid
  end

  it 'keys should be less than 1,000' do
    subject.keys = 1_000
    expect(subject).to_not be_valid
  end

  it 'should have a color' do
    subject.color = nil
    expect(subject).to_not be_valid
  end

  it 'color should not be too long' do
    subject.color = "a" * 51
    expect(subject).to_not be_valid
  end

  it 'should have a shareholding' do
    subject.shareholding = nil
    expect(subject).to_not be_valid
  end

  it 'shareholding should be a number' do
    subject.shareholding = 'string'
    expect(subject).to_not be_valid
  end

  it 'shareholding should be greater than zero' do
    subject.shareholding = -0.00001
    expect(subject).to_not be_valid
  end

  it 'shareholding should be different from zero' do
    subject.shareholding = 0
    expect(subject).to_not be_valid
  end

  it 'shareholding should be less than or equal to 1' do
    subject.shareholding = 1.00001
    expect(subject).to_not be_valid
  end

  it 'should have a house' do
    subject.house = nil
    expect(subject).to_not be_valid
  end
end
