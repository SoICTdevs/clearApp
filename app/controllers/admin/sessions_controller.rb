class Admin::SessionsController < Admin::ApplicationController
  layout 'login'
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      if params[:remember_me]
        cookies.permanent[:auth_token] = user.auth_token
      else
        cookies[:auth_token] = user.auth_token
      end
      redirect_to admin_applications_path, :notice => 'You have successfully logged in!!!'
    else
      flash.now.alert = 'Invalid email or password!!'
      render 'new'
    end
  end

  def destroy
    cookies.delete(:auth_token)
    redirect_to root_path, :notice => 'You have logged out!!'
  end
end

