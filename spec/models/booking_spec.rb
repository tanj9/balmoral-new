require 'rails_helper'

RSpec.describe Booking, type: :model do
  let(:house) { House.new(name: 'kermaria') }
  let(:tribe) do
    Tribe.new(
      keys: 150,
      color: 'green',
      shareholding: 0.5,
      house:
    )
  end
  let(:user) do
    User.new(
      email: 'corto@maltese.com',
      password: '000000',
      first_name: 'corto',
      last_name: 'maltese',
      role: 'member',
      tribe:
    )
  end
  let(:platform) do
    Platform.new(
      name: 'platform',
      url: 'https://www.platform.com',
      house:
    )
  end

  subject do
    Booking.new(
      start_date: Date.today,
      end_date: Date.today + 1,
      key_price: 1,
      status: "pending",
      user:,
      platform:,
      house:
    )
  end

  describe 'associations' do
    it { should belong_to(:house) }
    describe 'belongs to either a user or a platform' do
      context 'if booking has no user' do
        before { allow(subject).to receive(:user).and_return(nil) }
        it { should validate_presence_of(:platform) }
      end
      context 'if booking has no platform' do
        before { allow(subject).to receive(:platform).and_return(nil) }
        it { should validate_presence_of(:user) }
      end
    end
  end

  describe 'validations' do
    context 'when booking is from platform' do
      before { allow(subject).to receive(:user).and_return(nil) }
      it 'should be valid with valid attributes' do
        expect(subject).to be_valid
      end
    end
    context 'when booking is from user' do
      before { allow(subject).to receive(:platform).and_return(nil) }
      it 'should be valid with valid attributes' do
        expect(subject).to be_valid
      end
    end

    describe 'key_price' do
      it { should validate_presence_of(:key_price) }
      it { should validate_numericality_of(:key_price).only_integer }
      it { should validate_numericality_of(:key_price).is_greater_than(0) }
    end

    describe 'status' do
      it { should validate_presence_of(:status) }
      # next spec to be uncommented when enum is implemented on status
      xit { should define_enum_for(:status).with_values(%i[pending confirmed declined cancelled]) }
    end

    describe 'start_date' do
      it { should validate_presence_of(:start_date) }
      it 'start date should be a date' do
        subject.start_date = "a given date"
        expect(subject).to_not be_valid
      end
    end

    describe 'end_date' do
      it { should validate_presence_of(:end_date) }
      it 'end date should be a date' do
        subject.end_date = "another given date"
        expect(subject).to_not be_valid
      end
    end
  end
end
