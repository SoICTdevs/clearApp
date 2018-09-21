class Admin::ApplicationsController < Admin::ApplicationController
  before_action :verify_logged_in
  def edit
    @page_title = 'Student Application Details'
    @application = Application.find(params[:id])
  end

  def update
    @application = Application.find(params[:id])
    if @application.update(applicatin_params)
      flash[:notice] = "Application replied successful!"
      redirect_to admin_applications_path
    else
      flash.now.alert = 'You can go with out replying this application!!'
      render 'edit'
  end
end

  def index
    @applications = Application.all.order('created_at DESC').paginate(:per_page => 10, :page => params[:page])
  end

  def show
  end

  def destroy
  end
  
  private
   def applicatin_params
    params.require(:application).permit(:is_dean_approve, :is_hod_approve, :is_warden_approve, :is_finance_approve, :is_librarian_approve, :comments)
   end
end
