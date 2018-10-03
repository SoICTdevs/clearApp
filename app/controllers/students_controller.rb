class StudentsController < ApplicationController
  layout 'login', only: [:new, :create]
  before_action :verify_student_logged_in, only: [:edit, :update, :show, :destory, :index]
  def new
    @student = Student.new
  end

  def create
    @student = Student.new(registration_params)
    if @student.save
      flash[:notice] = "Student successfully registered!"
      redirect_to root_path
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
      flash[:notice] = 'You have updated successfully!'
      redirect_to student_path(current_student)
    else
      render 'edit'
    end
  end

  def index
    @students = Student.all
  end

  def show
    @students = Student.find(params[:id])
  end

  def destroy
  end
  private 
  def registration_params
    params.require(:student).permit(:reg_number, :first_name, :last_name, :email, :password, :auth_token)
  end
  private 
  def student_params
    params.require(:student).permit(:reg_number, :first_name, :last_name, :email, :level, :school, :academic_year, :profile_picture, :confirm_password, :sponsor, :sex, :department, :telephone)
  end
end
