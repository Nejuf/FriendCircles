class UserMailer < ActionMailer::Base
  default from: "evil_admin@our_website.com"

  def forgot_password_email(user)
    token = ResetToken.create_reset_token(user)
    @url = "#{user_activate_url(user.id)}?reset_token=#{token}"
    mail(to: user.email, subject: "Link to reset your password")
  end
end
