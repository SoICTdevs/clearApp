class Admin::PasswordResetsController < Admin::ApplicationController
  layout 'admin/login'
  def new
    @page_title = 'Password reset'
  end

  def create
    user = User.find_by_email(params[:email])
    user.send_password_reset if user
    redirect_to admin_login_path
    flash[:notice] = 'Email sent with password reset instructions.'
  end

  def edit
  end

  def update
  end
end
