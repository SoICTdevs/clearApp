class PasswordResetsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    user.send_password_reset if user
    redirect_to root_path, :notice => 'Password reset has sent to email with instruction'
  end

  def edit
  end

  def update
  end
end
