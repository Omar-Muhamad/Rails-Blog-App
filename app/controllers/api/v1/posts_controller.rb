class Api::V1::PostsController < ApplicationController
  def index
    @posts = Post.all
    respond_to do |format|
      format.json { render :json => @posts.to_json, :status => :ok }
    end
  end
end
