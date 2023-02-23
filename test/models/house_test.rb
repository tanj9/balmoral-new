require "test_helper"

class HouseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @house = House.new(name: "Example house")
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
end
