class Public::GameWorksController < ApplicationController
  
  def index

    if params[:genre_id].present?
      @game_works = GameWork.where(genre_id: params[:genre_id])
    elsif params[:platform_genre_id].present?
      @game_works = GameWork.where(platform_genre_id: params[:platform_genre_id])
    else
      @game_works = GameWork.all
    end
    @game_works = @game_works.page(params[:page]).per(5)
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
