require 'rails_helper'

RSpec.describe User, type: :model do
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
    User.new(
      email: 'corto@maltese.com',
      password: '000000',
      first_name: 'corto',
      last_name: 'maltese',
      role: 'member',
      tribe:
    )
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'should have an email' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'should have a first name' do
    subject.first_name = nil
    expect(subject).to_not be_valid
  end

  it 'first name should not be too long' do
    subject.first_name = "a" * 51
    expect(subject).to_not be_valid
  end

  it 'should have a last name' do
    subject.last_name = nil
    expect(subject).to_not be_valid
  end

  it 'last name should not be too long' do
    subject.last_name = "a" * 51
    expect(subject).to_not be_valid
  end

  it 'should have a role' do
    subject.role = nil
    expect(subject).to_not be_valid
  end

  it "role should be limited to 'admin' or 'member'" do
    subject.role = 'guitar player'
    expect(subject).to_not be_valid
  end

  it 'should belong to a tribe' do
    subject.tribe = nil
    expect(subject).to_not be_valid
  end
end
