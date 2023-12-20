class Public::HomesController < ApplicationController
  def top
    @new_game_works = GameWork.order(created_at: :desc).limit(3)
    @new_game_articles = GameArticle.order(created_at: :desc).limit(3)
    @genres = Genre.all
    @platform_genres = PlatformGenre.all
  end

  def about
  end
  
  def coice
  end
end
