require "test_helper"

class Admin::GameArticlesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_game_articles_new_url
    assert_response :success
  end

  test "should get index" do
    get admin_game_articles_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_game_articles_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_game_articles_edit_url
    assert_response :success
  end
end
