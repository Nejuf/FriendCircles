class FriendCircleMembership < ActiveRecord::Base
  attr_accessible :user_id, :friend_circle_id

  belongs_to :user
  belongs_to :friend_circle
end
