class Public::HomesController < ApplicationController
  def top
    @new_game_works = GameWork.order(created_at: :desc).limit(3)
    @new_game_articles = GameArticle.order(created_at: :desc).limit(3)
  end

  def about
  end
end
