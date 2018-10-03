class ApplicationsController < ApplicationController
  def new
    @application =Application.new
  end

  def create
    @application = Application.new(application_params)
    if @application.save
      flash[:notice] = 'Your application sent!'
      redirect_to student_path(current_student)
    else
      render 'new'
    end
  end

  def show
    @pplications = Application.where('student_id = current_student.id')
  end
  def index
    if current_student
      @applications = Application.where("student_id = #{current_student.id}")
    end
   
  end
  private 
  def application_params
    params.require(:application).permit(:reg_number, :first_name, :student_id, :last_name, :profile_picture, :email, :level, :academic_year, :school, :sponsor, :sex, :department, :telephone)
  end
end
