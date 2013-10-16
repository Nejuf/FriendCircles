class UsersController < ApplicationController
  def create
    @user = User.new(params[:user])
    if @user.save
      login!(@user)
      render :text => "Logged in"
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def reset
    msg = UserMailer.forgot_password_email(User.find(params[:user_id]))
    msg.deliver!
    redirect_to new_session_url
  end

  def activate
    reset_token = ResetToken.find_by_reset_token(params[:reset_token])
    if reset_token.nil?
      redirect_to new_session_url
    else
      user = User.find(reset_token.user_id)
      login!(user)
      redirect_to edit_user_url(user)
    end
  end
end
