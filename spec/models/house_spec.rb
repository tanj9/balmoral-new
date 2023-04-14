require 'rails_helper'

RSpec.describe House, type: :model do
  subject { House.new(name: "kermaria") }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'should have a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should have a name which is not too long' do
    subject.name = "a" * 51
    expect(subject).to_not be_valid
  end
end
