class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.author_id = current_user.id
    @comment.post_id = params[:id]
    if @comment.save
      redirect_to root_path notice: "comment created successfully"
    else
      redirect_to user_post_path(params[:id]), notice: "comment created successfully"
    end
  end
  private
  def comment_params
    params.require(:comment).permit(:text)
  end
end