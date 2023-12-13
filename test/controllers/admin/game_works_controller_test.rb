require "test_helper"

class Admin::GameWorksControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_game_works_new_url
    assert_response :success
  end

  test "should get index" do
    get admin_game_works_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_game_works_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_game_works_edit_url
    assert_response :success
  end
end
