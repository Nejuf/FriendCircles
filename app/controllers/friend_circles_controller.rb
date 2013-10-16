class FriendCirclesController < ApplicationController
  def create
    @friend_circle = FriendCircle.new(params[:friend_circle])
    @friend_circle.save
    redirect_to friend_circle_url(@friend_circle.id)
  end

  def show
    @friend_circle = FriendCircle.find(params[:id])
  end
end
