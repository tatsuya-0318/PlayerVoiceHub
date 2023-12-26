class Public::ReviewsController < ApplicationController
   before_action :ensure_guest_user, only: [:create]
  
  def create
    @genres = Genre.all
    @platform_genres = PlatformGenre.all
    @user = current_user
    @game_work = GameWork.find(params[:game_work_id])
    @review = current_user.reviews.new(review_params)
    @review.game_work_id = @game_work.id
    if @review.save
      redirect_to game_work_path(@game_work)
    else
      render 'public/game_works/show' # エラーメッセージを含むフォームを再表示
    end
  end
  
  def index
    @game_work = GameWork.find_by(id: params[:game_work_id])
    if @game_work
      @reviews = @game_work.reviews
    else
      redirect_to review_path# エラーメッセージを表示または別のページにリダイレクト
    end
    @genres = Genre.all
    @platform_genres = PlatformGenre.all
  end

  def show
    @review = Review.find(params[:id])
    @new_comments = Comment.new
    @genres = Genre.all
    @platform_genres = PlatformGenre.all
  end
  
  def destroy
    Review.find(params[:id]).destroy
    redirect_to game_work_path(params[:game_work_id])
  end 
  
  private

  def review_params
     params.require(:review).permit(:title, :content, :star)
  end
  
  def ensure_guest_user
    if current_user&.email == "guest@example.com"
      redirect_to game_works_path(current_user), notice: "ゲストユーザーはレビュー投稿できません。"
    end
  end  
end
