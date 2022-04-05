class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @user = User.includes(:posts, :comments).find(params[:user_id])
    @posts = @user.posts
    @comment = Comment.new
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find_by_id(params[:id])
    @comments = @post.comments
    @like = Like.new
  end

  def new
    @user = User.find(params[:user_id])
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    @post.comments_counter = 0
    @post.likes_counter = 0
    
    if @post.save
      redirect_to root_path notice: 'Post created successfully'
    else
      render :new
    end
  end

  def delete
    @user = User.find(params[:user_id])
    @post = Post.find(params[:user_id])
    @user.likes.find(@post.id).destroy
    @user.comments.find(@post.id).destroy
    Post.find(@post.id).destroy
    # respond_to do |format|
    #   format.html do 
    #     flash[:success] = "Post was successfully deleted"
    #     redirect_to user_posts_path
    #   end
    # end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
