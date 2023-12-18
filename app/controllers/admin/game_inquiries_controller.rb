class Admin::GameInquiriesController < ApplicationController
  def index
    @game_inquiry = GameInquiry.all
  end

  def show
    @game_inquiry = GameInquiry.find(params[:id])
  end
end
