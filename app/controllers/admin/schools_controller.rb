class Admin::SchoolsController < Admin::ApplicationController
  def new
    @school = School.new
  end

  def create
    @school = School.new(school_params)
    if @school.save
      redirect_to admin_schools_path, :notice => 'School created!'
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def index
  end

  def show
  end

  def destroy
  end
  private
  def school_params
    params.require(:school).permit(:name, :full_name)
  end
end
