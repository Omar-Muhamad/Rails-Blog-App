class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
    @comments = @user.comments
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find_by_id(params[:id])
    @comments = @post.last_five_comments
  end
end
