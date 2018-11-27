class Admin::DepartmentsController < Admin::ApplicationController
  def new
    @department = Department.new
  end

  def create
    @department = Department.new(department_params)
    if @department.save
      redirect_to admin_departments_path, :notice => 'Department created!'
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
  def department_params
    params.require(:department).permit(:name, :full_name, :school_id)
  end
end
