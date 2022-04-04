class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = current_user
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.last_three_posts
  end
end
