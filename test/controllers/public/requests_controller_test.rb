require "test_helper"

class Public::RequestsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_requests_new_url
    assert_response :success
  end

  test "should get complete" do
    get public_requests_complete_url
    assert_response :success
  end
end
