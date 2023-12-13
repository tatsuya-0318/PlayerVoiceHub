require "test_helper"

class Public::GameArticlesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_game_articles_index_url
    assert_response :success
  end

  test "should get show" do
    get public_game_articles_show_url
    assert_response :success
  end
end
