class Post < ActiveRecord::Base
  attr_accessible :title, :body, :user_id, :friend_circle_ids

  validates :title, :body, :user, :presence => true

  belongs_to :user
  has_many :links, :inverse_of => :post

  has_many :post_shares
  has_many :friend_circles, :through => :post_shares
end
