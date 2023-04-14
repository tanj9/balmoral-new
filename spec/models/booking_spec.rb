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

  let(:user_booking) do
    Booking.new(
      start_date: Date.today,
      end_date: Date.today + 1,
      key_price: 1,
      status: "pending",
      user:,
      house:
    )
  end

  let(:platform_booking) do
    Booking.new(
      start_date: Date.today + 1,
      end_date: Date.today + 2,
      key_price: 1,
      status: "pending",
      platform:,
      house:
    )
  end

  context 'with platform' do
    it 'should be valid with valid attributes' do
      expect(platform_booking).to be_valid
    end
  end

  context 'with user' do
    it 'should be valid with valid attributes' do
      expect(user_booking).to be_valid
    end

    it 'should have a house' do
      user_booking.house = nil
      expect(user_booking).to_not be_valid
    end

    it 'should have a price in keys' do
      user_booking.key_price = nil
      expect(user_booking).to_not be_valid
    end

    it 'key price should be an integer' do
      user_booking.key_price = 0.5
      expect(user_booking).to_not be_valid
    end

    it 'key price should be an positive' do
      user_booking.key_price = -1
      expect(user_booking).to_not be_valid
    end

    it 'key price should be different from zero' do
      user_booking.key_price = 0
      expect(user_booking).to_not be_valid
    end

    it 'should have a status (not empty)' do
      user_booking.status = ''
      expect(user_booking).to_not be_valid
    end

    it 'should have a start_date' do
      user_booking.start_date = nil
      expect(user_booking).to_not be_valid
    end

    it 'start date should be a date' do
      user_booking.start_date = "a given date"
      expect(user_booking).to_not be_valid
    end

    it 'should have an end_date' do
      user_booking.end_date = nil
      expect(user_booking).to_not be_valid
    end

    it 'end date should be a date' do
      user_booking.end_date = "another given date"
      expect(user_booking).to_not be_valid
    end
  end

  context 'whoever booked (platform or user)' do
    it 'should have either a platform or a user' do
      user_booking.user = nil
      expect(user_booking).to_not be_valid
    end
  end
end
