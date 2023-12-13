require "test_helper"

class Public::InquiriesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_inquiries_new_url
    assert_response :success
  end

  test "should get index" do
    get public_inquiries_index_url
    assert_response :success
  end

  test "should get complete" do
    get public_inquiries_complete_url
    assert_response :success
  end
end
