class PasswordResetsController < ApplicationController
  layout 'login'
  def new
    @page_title = 'Student Password reset'
  end

  def create
    user = Student.find_by_email(params[:email])
    user.send_password_reset if user
    redirect_to login_path
    flash[:notice] = 'Email sent with password reset instructions.'
  end

  def edit
    @page_title = 'Reset Password'
    @student = Student.find_by_password_reset_token!(params[:id])
  end

  def update
    @student = Student.find_by_password_reset_token!(params[:id])
    if @student.password_reset_sent_at < 2.hours.ago
      redirect_to new_password_reset_path, :alert => 'Password reset link have been expired!'
    elsif @student.update(student_params)
      redirect_to login_path, :notice => 'Password have changed '
    else
      render 'edit', :alert => 'try again!'
    end
  end

  private

    def student_params
      params.require(:student).permit(:password, :password_confirmation)
    end

end
