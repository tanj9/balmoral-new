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

  describe 'associations' do
    it { should belong_to(:tribe) }
    it { should have_many(:bookings) }
    # it { should have_many(:messages) }
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    describe 'email' do
      it { should validate_presence_of(:email) }
    end

    describe 'first_name' do
      it { should validate_presence_of(:first_name) }
      it { should validate_length_of(:first_name).is_at_most(30) }
    end

    describe 'last_name' do
      it { should validate_presence_of(:last_name) }
      it { should validate_length_of(:last_name).is_at_most(50) }
    end

    describe 'role' do
      # following shoulda-matcher (validate_presence_of) generates an error
      # `ArgumentError: invalid value for Integer(): ""`
      # it { should validate_presence_of(:role) }

      it 'should have a role' do
        subject.role = nil
        expect(subject).to_not be_valid
      end

      # following shoulda-matcher (validate_inclusion_of) generates an error
      # `ArgumentError: invalid value for Integer(): ""`
      # it do
      #   should validate_inclusion_of(:role)
      #     .in_array(%w[admin member])
      #     .with_message(/is not a valid role/)
      # end

      it "role should be limited to 'admin' or 'member'" do
        subject.role = 'guitar player'
        expect(subject).to_not be_valid
      end
    end
  end
end
