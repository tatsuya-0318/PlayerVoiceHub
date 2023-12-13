require "test_helper"

class Admin::PlatformGenresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_platform_genres_index_url
    assert_response :success
  end

  test "should get edit" do
    get admin_platform_genres_edit_url
    assert_response :success
  end
end
