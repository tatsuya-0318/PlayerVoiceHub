class Public::GameArticlesController < ApplicationController


  def index
    @game_articles = GameArticle.all
    @game_articles = GameArticle.page(params[:page])
    @genres = Genre.all
    @platform_genres = PlatformGenre.all
  end

  def show
    @game_article = GameArticle.find(params[:id])
    @genres = Genre.all
    @platform_genres = PlatformGenre.all
  end
  
end
