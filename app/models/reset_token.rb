class ResetToken < ActiveRecord::Base
  attr_accessible :reset_token, :user_id

  validates :reset_token, :user_id, :presence => true, :uniqueness => true

  def self.create_reset_token(user)
    token = ResetToken.find_by_user_id(user.id)
    if !token
      token = SecureRandom::urlsafe_base64
      ResetToken.create(:user_id => user.id, :reset_token => token).save
    end
    token.reset_token
  end
end
