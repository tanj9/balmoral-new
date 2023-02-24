require "test_helper"

class HouseTest < ActiveSupport::TestCase
  def setup
    @house = House.new(name: "test house")
  end

  test "should be valid" do
    assert @house.valid?
  end

  test "name should be present" do
    @house.name = "     "
    assert_not @house.valid?
  end

  test "name should not be too long" do
    @house.name = "a" * 51
    assert_not @house.valid?
  end

  test "house_count" do
    assert_equal 2, House.count
  end
end
