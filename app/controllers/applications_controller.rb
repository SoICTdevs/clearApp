class ApplicationsController < ApplicationController
  before_action :verify_student_logged_in, only: [:new]
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
    @application = Application.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        pdf = CertificatePdf.new(@application)
        send_data pdf.render, filename: "My_application.pdf",
                             type: "application/pdf",
                             disposition: "inline"
      end
    end
  end
  def index
    if current_student
      @applications = Application.where("student_id = #{current_student.id}")
    end
   
  end
  private 
  def application_params
    params.require(:application).permit(:reg_number, :first_name, :student_id, :last_name, :profile_picture, :email, :level, :academic_year, :school_id, :sponsor, :sex, :department_id, :telephone)
  end

  public
  def catch_404
    raise ActionController::RoutingError.new(params[:path])
  end
end
