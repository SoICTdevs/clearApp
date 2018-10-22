class SessionsController <ApplicationController
  layout 'login'
  def new
  end

  def create
    student = Student.find_by(email: params[:email])
    if student && student.authenticate(params[:password])
      if params[:remember_me]
        cookies.permanent[:auth_token] = student.auth_token
      else
        cookies[:auth_token] = student.auth_token
      end
      redirect_to student_path(current_student), notice: 'You have successfully logged in!!!'
    else
      flash.now.alert = 'Invalid email or password!!'
      render 'new'
    end
  end

  def destroy
    cookies.delete(:auth_token)
    redirect_to login_path, :notice => 'You have logged out!!'
  end
end
