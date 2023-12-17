class Public::GameArticlesController < ApplicationController


  def index
    @game_articles = GameArticle.all
    @game_articles = GameArticle.page(params[:page])
  end

  def show
    @game_article = GameArticle.find(params[:id])
  end
  
end
