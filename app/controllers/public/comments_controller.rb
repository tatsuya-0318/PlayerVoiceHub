class Public::CommentsController < ApplicationController
  
  def create
    @comment = Comment.create(comment_params)
    redirect_to "/reviews/#{@comment.review.id}"
  end
  
  def index
    @review = Review.find_by(id: params[:review_id])
    if @review
      @comments = @review.comments
    else
      redirect_to game_work_review_comments_path# エラーメッセージを表示または別のページにリダイレクト
    end
  end
  
  def show
  end
  
  def destroy
    @comment = Comment.find(params[:id]).destroy
    redirect_to "public/reviews/#{@comment.review.id}"
  end
  
   private
   
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, review_id: params[:review_id])
  end
end
