require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @house = houses(:one)
    @green_tribe = tribes(:green)
    @user = @green_tribe.users.build(email: "corto@maltese.com", password: "123456", first_name: "corto", last_name: "maltese", role: "member")
  end

  test "first_name should be present" do
    @user.first_name = ""
    assert_not @user.valid?
  end

  test "first_name should not be too long" do
    @user.first_name = "a" * 31
    assert_not @user.valid?
  end

  test "last_name should be present" do
    @user.last_name = ""
    assert_not @user.valid?
  end

  test "last_name should not be too long" do
    @user.last_name = "a" * 51
    assert_not @user.valid?
  end

  test "role should be present" do
    @user.role = ""
    assert_not @user.valid?
  end

  test "role should be limited to 'admin' or 'member'" do
    @user.role = "rider"
    assert_not @user.valid?
  end

  test "tribe should be present" do
    @user.tribe_id = nil
    assert_not @user.valid?
  end
end
