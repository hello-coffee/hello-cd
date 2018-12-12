require 'test_helper'

class TopControllerTest < ActionDispatch::IntegrationTest
  test "should get contact" do
    get top_contact_url
    assert_response :success
  end

  test "should get guide" do
    get top_guide_url
    assert_response :success
  end

end
