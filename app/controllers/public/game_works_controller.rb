class Public::GameWorksController < ApplicationController
  
  def index
    @game_works = GameWork.all
    @game_works = GameWork.page(params[:page])
  end

  def show
    @game_work = GameWork.find(params[:id])
    @review = Review.new
  end
  
end
