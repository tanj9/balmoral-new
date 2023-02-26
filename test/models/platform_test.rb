require "test_helper"

class PlatformTest < ActiveSupport::TestCase
  def setup
    @house = houses(:one)
    @platform = @house.platforms.build(name: "booking platform", url: "https://www.booking-platform.com")
  end

  test "should be valid" do
    assert @platform.valid?
  end

  test "name should be present" do
    @platform.name = "     "
    assert_not @platform.valid?
  end

  test "name should not be too long" do
    @platform.name = "a" * 51
    assert_not @platform.valid?
  end

  test "house should be present" do
    @platform.house_id = nil
    assert_not @platform.valid?
  end
end
