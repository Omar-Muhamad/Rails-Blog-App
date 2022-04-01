class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find_by_id(params[:id])
    @comments = @post.comments
  end

  def new
    @user = User.find(params[:user_id])
    @post = Post.new
  end

  def create
    p params
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path notice: "Post created successfully"
    else
      render :new
    end
  end

  private

  def post_params
    data = params.require(:post).permit(:user_id, :title, :text)
    data[:author_id] = params[:user_id]
    data
  end
end
