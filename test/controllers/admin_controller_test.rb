require 'test_helper'

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get add" do
    get admin_add_url
    assert_response :success
  end

  test "should get edit" do
    get admin_edit_url
    assert_response :success
  end

  test "should get bookings" do
    get admin_bookings_url
    assert_response :success
  end

end
