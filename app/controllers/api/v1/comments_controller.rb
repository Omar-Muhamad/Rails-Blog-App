class Api::V1::CommentsController < ApiController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
    @comments = @user.comments
    respond_to do |format|
      format.json { render :json => @comments.to_json, :status => :ok }
    end
  end
end
