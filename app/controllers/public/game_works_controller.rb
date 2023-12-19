class Public::GameWorksController < ApplicationController
  
  def index
    @game_work_s = GameWork.page(params[:page]).per(5)
    Rails.logger.debug "Genre ID: #{params[:genre_id]}"
    if params[:genre_id].present?
      @game_works = GameWork.where(genre_id: params[:genre_id])
    else
      @game_works = GameWork.all
    end
    Rails.logger.debug "PlatformGenre ID: #{params[:platform_genre_id]}"
    if params[:platform_genre_id].present?
      @game_works = GameWork.where(platform_genre_id: params[:platform_genre_id])
    else
      @game_works = GameWork.all
    end
  end

  def show
    @game_work = GameWork.find(params[:id])
    @review = Review.new
  end
  
  private

  def game_work_params
    params.permit(:genre_id, :platform_genre_id)
  end
end
