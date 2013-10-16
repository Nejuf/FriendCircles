class User < ActiveRecord::Base
  attr_accessible :email, :password, :session_token
  validates :email, presence: true
  validates :email, uniqueness: true

  has_many :friend_circle_memberships
  has_many :friend_circles, through: :friend_circle_memberships

  has_many :posts


  before_validation(on: :create) do
    self.session_token ||= SecureRandom.urlsafe_base64
  end

  def self.find_by_credentials(email, password)
    user = User.find_by_email(email)
    return user if user && user.is_password?(password)
  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64
    self.save!
    self.session_token
  end

  def reset_password!
    pass = SecureRandom.urlsafe_base64
    password = pass
    self.save!
    pass
  end

  def password=(pass)
    self.password_digest = BCrypt::Password.create(pass)
  end

  def is_password?(pass)
    BCrypt::Password.new(self.password_digest) == pass
  end
end
