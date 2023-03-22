require "test_helper"

class SpendingTest < ActiveSupport::TestCase
  def setup
    @house = houses(:one)
    @red_tribe = tribes(:red)
    @green_tribe = tribes(:green)
    @spending = @green_tribe.spendings.build(
      amount: 1,
      date: Date.new(2023, 2, 1),
      category: "gardening",
      details: "3 hours of gardening in January"
    )
  end

  test "should be valid" do
    assert @spending.valid?
  end

  test "amount should be present" do
    @spending.amount = nil
    assert_not @spending.valid?
  end

  test "amount should be a number" do
    @spending.amount = "word"
    assert_not @spending.valid?
  end

  test "amount should be greater than 0" do
    @spending.amount = -1
    assert_not @spending.valid?
  end

  test "amount should not be zero" do
    @spending.amount = 0
    assert_not @spending.valid?
  end

  test "date should be present" do
    @spending.date = nil
    assert_not @spending.valid?
  end

  test "category should be present" do
    @spending.category = ""
    assert_not @spending.valid?
  end

  test "category should not be too long" do
    @spending.category = "a" * 51
    assert_not @spending.valid?
  end

  test "details should be present" do
    @spending.details = ""
    assert_not @spending.valid?
  end

  test "details should have minimum length" do
    @spending.details = "123456"
    assert_not @spending.valid?
  end

  test "details should not be too long" do
    @spending.details = "a" * 401
    assert_not @spending.valid?
  end

  test "tribe should be present" do
    @spending.tribe_id = nil
    assert_not @spending.valid?
  end
end
