class Admin::ApplicationsController < Admin::ApplicationController
  before_action :verify_logged_in
  before_action :dashboard
  before_action :show_applicants, only: [:edit, :show]
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
    #@applications = Application.find(params[:id]).order('created_at DESC').paginate(:per_page => 10, :page => params[:page])
    @applications = Application.where(params[:id])    
  end

  def destroy
  end
  
  private
   def applicatin_params
    params.require(:application).permit(:is_dean_approve, :student_id, :is_hod_approve, :is_warden_approve, :is_finance_approve, :is_librarian_approve, :libralian_comment, :warden_comment, :finance_comment,  :hod_comment, :dean_comment)
   end
  def dashboard
    if current_user.role == 'Dean' || 'dean' || 'DEAN'
      @apnew = Application.where('is_dean_approve = 2').count
      @apapprov = Application.where('is_dean_approve = 1').count
      @apreject = Application.where('is_dean_approve = 0').count
    elsif current_user.role == 'Hod' || 'hod' || 'HOD'
      @apnew = Application.where('is_hod_approve = 2').count
      @apapprov = Application.where('is_hod_approve = 1').count
      @apreject = Application.where('is_hod_approve = 0').count
    elsif current_user.role == 'Warden' || 'warden' || 'WARDEN'
      @apnew = Application.where('is_warden_approve = 2').count
      @apapprov = Application.where('is_warden_approve = 1').count
      @apreject = Application.where('is_warden_approve = 0').count
    elsif current_user.role == 'Finance' || 'finance' || 'FINANCE'
      @apnew = Application.where('is_finance_approve = 2').count
      @apapprov = Application.where('is_finance_approve = 1').count
      @apreject = Application.where('is_finance_approve = 0').count
    elsif current_user.role == 'Librarian' || 'librarian' || 'LIBRARIAN'
      @apnew = Application.where('is_librarian_approve = 2').count
      @apapprov = Application.where('is_librarian_approve = 1').count
      @apreject = Application.where('is_librarian_approve = 0').count
    end
  end

    def show_applicants
      if current_user.role == 'Dean' || 'dean' || 'DEAN'
        @new = Application.where('is_dean_approve = 2').order('created_at DESC').paginate(:per_page => 10, :page => params[:page])
        @reject = Application.where('is_dean_approve = 0').order('created_at DESC').paginate(:per_page => 10, :page => params[:page])
        @approve = Application.where('is_dean_approve = 1').order('created_at DESC').paginate(:per_page => 10, :page => params[:page])
      elsif current_user.role == 'Hod' || 'hod' || 'HOD'
        @new = Application.where('is_hod_approve = 2').order('created_at DESC').paginate(:per_page => 10, :page => params[:page])
        @reject = Application.where('is_hod_approve = 0').order('created_at DESC').paginate(:per_page => 10, :page => params[:page])
        @approve = Application.where('is_hod_approve = 1').order('created_at DESC').paginate(:per_page => 10, :page => params[:page])
      elsif current_user.role == 'Warden' || 'warden' || 'WARDEN'
        @new = Application.where('is_warden_approve = 2').order('created_at DESC').paginate(:per_page => 10, :page => params[:page])
        @reject = Application.where('is_warden_approve = 0').order('created_at DESC').paginate(:per_page => 10, :page => params[:page])
        @approve = Application.where('is_warden_approve = 1').order('created_at DESC').paginate(:per_page => 10, :page => params[:page])
      elsif current_user.role == 'Finance' || 'finance' || 'FINANCE'
        @new = Application.where('is_finance_approve = 2').order('created_at DESC').paginate(:per_page => 10, :page => params[:page])
        @reject = Application.where('is_finance_approve = 0').order('created_at DESC').paginate(:per_page => 10, :page => params[:page])
        @approve = Application.where('is_finance_approve = 1').order('created_at DESC').paginate(:per_page => 10, :page => params[:page])
      elsif current_user.role == 'Librarian' || 'librarian' || 'LIBRARIAN'
        @new = Application.where('is_librarian_approve = 2').order('created_at DESC').paginate(:per_page => 10, :page => params[:page])
        @reject = Application.where('is_librarian_approve = 0').order('created_at DESC').paginate(:per_page => 10, :page => params[:page])
        @approve = Application.where('is_librarian_approve = 1').order('created_at DESC').paginate(:per_page => 10, :page => params[:page])
      else
        flash.now.alert = 'You are not registered as SoICT Clearance Application User!!'
      end
      
    end
end
