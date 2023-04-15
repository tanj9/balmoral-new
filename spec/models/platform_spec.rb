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

  describe 'associations' do
    it { should belong_to(:house) }
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_most(50) }
  end
end
