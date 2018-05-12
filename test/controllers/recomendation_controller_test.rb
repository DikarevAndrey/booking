require 'test_helper'

class RecomendationControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get recomendation_show_url
    assert_response :success
  end

end
