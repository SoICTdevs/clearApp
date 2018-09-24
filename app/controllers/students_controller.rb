class StudentsController < ApplicationController
  #before_action :verify_logged_in
  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      flash[:notice] = "Student successfully registered!"
      redirect_to login_path
    else
      render 'new'
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])

    if @student.update(student_params)
      flash[:notice] = 'Student Details updated'

      redirect_to student_path(current_user)
      else
        render 'new'
      end
  end

  def index
    @students = Student.all
    #@students = Student.find(params[:id])
  end

  def show
    @students = Student.find(params[:id])
  end

  def destroy
  end
  private 
  def student_params
    params.require(:student).permit(:reg_number, :first_name, :last_name, :email, :password, :telephone, :sex, :department, :level, :academic_year, :sponsor, :auth_token)
  end
end
