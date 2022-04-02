class LikesController < ApplicationController
  def create
    like = Like.new
    like.post_id = params[:post_id]

    if @like.save
      redirect_to root_path notice: 'like added successfully'
    else
      redirect_to user_post_path(params[:id]), notice: 'Failed to add a like'
    end
  end
end
