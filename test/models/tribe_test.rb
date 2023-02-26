require "test_helper"

class TribeTest < ActiveSupport::TestCase
  def setup
    @house = houses(:one)
    @tribe = @house.tribes.build(keys: 10, color: "blue", shareholding: 1)
  end

  test "should be valid" do
    assert @tribe.valid?
  end

  test "keys should be present" do
    @tribe.keys = nil
    assert_not @tribe.valid?
  end

  test "keys should be an integer" do
    @tribe.keys = 0.5
    assert_not @tribe.valid?
  end

  test "keys should be greater or equal to zero" do
    @tribe.keys = -1
    assert_not @tribe.valid?
  end

  test "keys should be less than 1,000" do
    @tribe.keys = 1_000
    assert_not @tribe.valid?
  end

  test "color should be present" do
    @tribe.color = "     "
    assert_not @tribe.valid?
  end

  test "color should not be less than 50 characters" do
    @tribe.color = "a" * 51
    assert_not @tribe.valid?
  end

  test "shareholding should be present" do
    @tribe.shareholding = nil
    assert_not @tribe.valid?
  end

  test "shareholding should be greater than zero" do
    @tribe.shareholding = -0.00001
    assert_not @tribe.valid?
  end

  test "shareholding should be different from zero" do
    @tribe.shareholding = 0
    assert_not @tribe.valid?
  end

  test "shareholding should be less than or equal to 1" do
    @tribe.shareholding = 1.0001
    assert_not @tribe.valid?
  end

  test "house should be present" do
    @tribe.house_id = nil
    assert_not @tribe.valid?
  end
end
