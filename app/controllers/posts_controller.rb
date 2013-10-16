class PostsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @post = Post.new
    3.times do
      @post.links.build
    end
  end

  def create
    @post = User.find(params[:user_id]).posts.new(params[:post])
    @post.links.new(params[:links].values)
    @post.save!
    redirect_to post_url(@post.id)
  end

  def show
    @post = Post.find(params[:id])
  end
end
