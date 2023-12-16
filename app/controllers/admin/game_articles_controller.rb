class Admin::GameArticlesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_game_article, only: %i[show edit update]
  
  def new
    @game_article = GameArticle.new
  end
  
  def create
    @game_article = GameArticle.new(game_articles_params)
    if @game_article.save
      redirect_to admin_game_article_path(@game_article)
    else
      Rails.logger.info(@game_article.errors.full_messages)
      render :new
    end
  end

  def index
    @game_articles = GameArticle.all
  end

  def show
    @game_article = GameArticle.find(params[:id])
  end

  def edit
    @game_article = GameArticle.find(params[:id])
  end
  
  def update
    if @game_article.update(game_articles_params)
      redirect_to admin_game_article_path(@game_article)
    else
      render :edit
    end
  end
  
  private
  
  def set_game_article
    @game_article = GameArticle.find(params[:id])
  end
  
  def game_articles_params
    params.require(:game_article).permit(:title, :introduction, :game_article_image)
  end
  
end
