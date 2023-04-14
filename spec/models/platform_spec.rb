require 'rails_helper'

RSpec.describe Platform, type: :model do
  let(:house) { House.new(name: 'kermaria') }

  subject do
    Platform.new(
      name: 'platform',
      url: 'https://www.platform.com',
      house:
    )
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'should have a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'name should not be too long' do
    subject.name= "a" * 51
    expect(subject).to_not be_valid
  end

  it 'should have a house' do
    subject.house = nil
    expect(subject).to_not be_valid
  end
end
