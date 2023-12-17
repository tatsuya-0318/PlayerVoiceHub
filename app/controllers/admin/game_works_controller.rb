class Admin::GameWorksController < ApplicationController
  
  before_action :authenticate_admin!
  before_action :set_game_work, only: %i[show edit update]
  
  def new
    @game_work = GameWork.new
    @genres = Genre.all
    @platform_genres = PlatformGenre.all
  end
  
  def create
    @game_work = GameWork.new(game_works_params)
    if @game_work.save
      redirect_to admin_game_work_path(@game_work)
    else
      Rails.logger.info(@game_work.errors.full_messages)
      @genres = Genre.all
      @platform_genres = PlatformGenre.all
      render :new
    end
  end

  def index
    @game_works = GameWork.all
  end

  def show
    @game_work = GameWork.find(params[:id])
  end

  def edit
    @game_work = GameWork.find(params[:id])
    @genres = Genre.all
    @platform_genres = PlatformGenre.all
  end
  
  def update
    if @game_work.update(game_works_params)
      redirect_to admin_game_work_path(@game_work)
    else
      render :edit
    end
  end
  
  private
  
  def set_game_work
    @game_work = GameWork.find(params[:id])
  end
  
  def game_works_params
    params.require(:game_work).permit(:title, :introduction, :game_work_image, :genre_id, :platform_genre_id)
  end
  
end
