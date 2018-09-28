class Admin::SessionsController < Admin::ApplicationController
  layout 'admin/login'
  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      #session[:user_id] = user.id
      #cookies.permanent[:auth_token] = user.auth_token
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
    #session[:user_id] = nil
    cookies.delete(:auth_token)
    redirect_to admin_login_path, :notice => 'You have logged out!!'
  end
end

