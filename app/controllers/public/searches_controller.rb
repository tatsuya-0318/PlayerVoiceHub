class Public::SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @range = params[:range]
    @word = params[:word]

    if @range == "投稿されたゲーム"
      @game_works = GameWork.looks(params[:search], params[:word])
    else
      @game_articles = GameArticle.looks(params[:search], params[:word])
    end
  end
end
