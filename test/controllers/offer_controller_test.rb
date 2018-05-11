require 'test_helper'

class OfferControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get offer_new_url
    assert_response :success
  end

  test "should get edit" do
    get offer_edit_url
    assert_response :success
  end

end
