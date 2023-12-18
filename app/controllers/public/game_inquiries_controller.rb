class Public::GameInquiriesController < ApplicationController
  def new
    @game_inquiry = GameInquiry.new
  end
  
  def create
    @game_inquiry = current_user.game_inquiries.build(game_inquiries_params)
    if @game_inquiry.save
      session[:game_inquiry_details] = @game_inquiry.attributes
      redirect_to game_inquiry_game_inquiries_complete_path(@game_inquiry)
    else
      @game_inquiry.errors.full_messages
      render :new
    end
  end

  def index
    
  end

  def complete
    @game_inquiry = session[:game_inquiry_details]
    session.delete(:game_inquiry_details)
  end
  
  def choice
  end
  
  private
  
  def game_inquiries_params
    params.require(:game_inquiry).permit(:title, :introduction, :platform, :production_company)
  end
  
end
