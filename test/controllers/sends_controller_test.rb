require 'test_helper'

class SendsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get sends_new_url
    assert_response :success
  end

  test "should get create" do
    get sends_create_url
    assert_response :success
  end

end
