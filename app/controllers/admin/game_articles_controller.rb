class Admin::GameArticlesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_game_article, only: %i[show edit update]
  
  def new
    @game_articles = GameArticle.new
  end
  
  def create
    @game_article = GameArticle.new(game_articles_params)
    if @game_article.save
      redirect_to admin_game_article_path(@game_article)
    else
      render :show
    end
  end

  def index
    @game_articles = GameArticle.all
  end

  def show
    @game_article = GameArticle.find(params[:id])
  end

  def edit
  end
  
  def update
    if @game_articles.update(game_articles_params)
      redirect_to admin_game_article_path(@game_articles)
    else
      render :edit
    end
  end
  
  private
  
  def set_game_article
    @game_article = Game_article.find(params[:id])
  end
  
  def game_articles_params
    params.require(:game_article).permit(:title, :introduction, :get_game_article_image)
  end
  
end
