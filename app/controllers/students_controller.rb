class StudentsController < ApplicationController
  before_action :verify_logged_in, only: [:edit, :update, :show, :destory, :index]
  layout 'login', only: [:new, :create]
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
    
    if params[:student][:image].blank?
      @student.image = nil
    end

    if @student.update(student_params)
      flash[:notice] = 'You have updated successfully!'
      redirect_to student_path(current_user)
    else
      render 'edit'
    end
  end

  def index
    #@students = Student.all
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
    params.require(:student).permit(:reg_number, :first_name, :last_name, :email, :level, :academic_year, :sponsor, :sex, :department, :telephone, :image)
  end
end
