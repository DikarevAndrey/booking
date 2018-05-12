require 'test_helper'

class SearchControllerTest < ActionDispatch::IntegrationTest
  test "should get list" do
    get search_list_url
    assert_response :success
  end

end
