class Admin::PasswordResetsController < Admin::ApplicationController
  layout 'admin/login'
  def new
    @page_title = 'Password reset'
  end

  def create
    user = User.find_by_email(params[:email])
    user.send_password_reset if user
    redirect_to admin_userlogin_path
    flash[:notice] = 'Email sent with password reset instructions.'
  end

  def edit
    @page_title = 'Reset Password'
    @user = User.find_by_password_reset_token!(params[:id])
  end

  def update
    @user = User.find_by_password_reset_token!(params[:id])
    if @user.password_reset_sent_at < 2.hours.ago
      redirect_to new_admin_password_reset_path, :alert => 'Password reset link have been expired!'
    elsif @user.update(user_params)
      redirect_to admin_userlogin_path, :notice => 'Password have changed '
    else
      render 'edit', :alert => 'try again!'
    end
  end

  private

    def user_params
      params.require(:user).permit(:password, :password_confirmation)
    end
end
