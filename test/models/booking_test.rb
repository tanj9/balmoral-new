require "test_helper"

class BookingTest < ActiveSupport::TestCase
  def setup
    @house = houses(:one)
    @user = users(:one)
    @platform = platforms(:one)
    @booking = @user.bookings.build(
      start_date: Date.today,
      end_date: Date.today + 1,
      key_price: 2,
      status: "pending",
      house: @house
    )
    @platform_booking = @platform.bookings.build(
      start_date: Date.today,
      end_date: Date.today + 1,
      key_price: 2,
      status: "pending",
      house: @house
    )
  end

  test "booking with platform should be valid" do
    assert @platform_booking.valid?
  end

  test "booking with user should be valid" do
    assert @booking.valid?
  end

  test "house should be present" do
    @booking.house_id = nil
    assert_not @booking.valid?
  end

  test "either platform or user should be present" do
    @booking.user_id = nil
    assert_not @booking.valid?
  end

  test "key_price should be present" do
    @booking.key_price = nil
    assert_not @booking.valid?
  end

  test "status should be present" do
    @booking.status = ""
    assert_not @booking.valid?
  end

  test "start_date should be present" do
    @booking.start_date = nil
    assert_not @booking.valid?
  end

  test "end_date should be present" do
    @booking.end_date = nil
    assert_not @booking.valid?
  end

  test "key price should be an integer" do
    @booking.key_price = 0.5
    assert_not @booking.valid?
  end

  test "key price should be positive" do
    @booking.key_price = -1
    assert_not @booking.valid?
  end

  test "key price should be different from 0" do
    @booking.key_price = 0
    assert_not @booking.valid?
  end
end
