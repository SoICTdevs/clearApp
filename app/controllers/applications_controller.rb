class ApplicationsController < ApplicationController
  def new
    #@application = current_user.build_application
    @application =Application.new
  end

  def create
    #@application = current_user.build_application(application_params)
    @application = Application.new(application_params)
    if @application.save
      flash[:notice] = 'Your application sent!'
      redirect_to student_path(current_user)
    else
      render 'new'
    end
  end

  def show
    @pplications = Application.where('student_id = current_user.id')
  end
  def index
    if current_user
      #@applications = Application.all
      @applications = Application.where("student_id = #{current_user.id}")
    end
   
  end
  private 
  def application_params
    params.require(:application).permit(:reg_number, :first_name, :student_id, :last_name, :profile_picture, :email, :level, :academic_year, :sponsor, :sex, :department, :telephone)
  end
end
