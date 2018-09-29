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
    if params[:search]
    else 
      @applications = Application.all.order('created_at DESC').paginate(:per_page => 10, :page => params[:page])
    end

  end

  def show
    #@applications = Application.find(params[:id]).order('created_at DESC').paginate(:per_page => 10, :page => params[:page])
    @applications = Application.where(params[:id])       
  end

  def destroy
  end
  
  private
   def applicatin_params
    params.require(:application).permit(:is_dean_approve, :is_hod_approve, :is_warden_approve, :is_finance_approve, :is_librarian_approve, :librarian_comment, :warden_comment, :finance_comment,  :hod_comment, :dean_comment)
   end
  def dashboard
    if current_user
      if current_user.role == 'Dean'
        @apnew = Application.where('is_dean_approve = 2').count
        @apapprov = Application.where('is_dean_approve = 1').count
        @apreject = Application.where('is_dean_approve = 0').count
      elsif current_user.role == 'HOD'
        @apnew = Application.where('is_hod_approve = 2').count
        @apapprov = Application.where('is_hod_approve = 1').count
        @apreject = Application.where('is_hod_approve = 0').count
      elsif current_user.role == 'Warden'
        @apnew = Application.where('is_warden_approve = 2').count
        @apapprov = Application.where('is_warden_approve = 1').count
        @apreject = Application.where('is_warden_approve = 0').count
      elsif current_user.role == 'Finance'
        @apnew = Application.where('is_finance_approve = 2').count
        @apapprov = Application.where('is_finance_approve = 1').count
        @apreject = Application.where('is_finance_approve = 0').count
      elsif current_user.role == 'Librarian'
        @apnew = Application.where('is_librarian_approve = 2').count
        @apapprov = Application.where('is_librarian_approve = 1').count
        @apreject = Application.where('is_librarian_approve = 0').count
      elsif current_user.role == 'Registrar'
        @application = Application.search(params[:search]).all
      else
        flash.now.alert = 'System is not recognize you as one of users!!'
      end
    end
  end

    def show_applicants
      if current_user
        if current_user.role == 'Dean'
          @new = Application.where("is_dean_approve = #{params[:id]}").order('created_at DESC').paginate(:per_page => 10, :page => params[:page])
          @reject = Application.where("is_dean_approve = #{params[:id]}").order('created_at DESC').paginate(:per_page => 10, :page => params[:page])
          @approve = Application.where("is_dean_approve = #{params[:id]}").order('created_at DESC').paginate(:per_page => 10, :page => params[:page])
        elsif current_user.role == 'HOD'
          @new = Application.where("is_hod_approve = #{params[:id]}").order('created_at DESC').paginate(:per_page => 10, :page => params[:page])
          @reject = Application.where("is_hod_approve = #{params[:id]}").order('created_at DESC').paginate(:per_page => 10, :page => params[:page])
          @approve = Application.where("is_hod_approve = #{params[:id]}").order('created_at DESC').paginate(:per_page => 10, :page => params[:page])
        elsif current_user.role == 'Warden'
          @new = Application.where("is_warden_approve = #{params[:id]}").order('created_at DESC').paginate(:per_page => 10, :page => params[:page])
          @reject = Application.where("is_warden_approve = #{params[:id]}").order('created_at DESC').paginate(:per_page => 10, :page => params[:page])
          @approve = Application.where("is_warden_approve = #{params[:id]}").order('created_at DESC').paginate(:per_page => 10, :page => params[:page])
        elsif current_user.role == 'Finance'
          @new = Application.where("is_finance_approve = #{params[:id]}").order('created_at DESC').paginate(:per_page => 10, :page => params[:page])
          @reject = Application.where("is_finance_approve = #{params[:id]}").order('created_at DESC').paginate(:per_page => 10, :page => params[:page])
          @approve = Application.where("is_finance_approve = #{params[:id]}").order('created_at DESC').paginate(:per_page => 10, :page => params[:page])
        elsif current_user.role == 'Librarian'
          @new = Application.where("is_librarian_approve = #{params[:id]}").order('created_at DESC').paginate(:per_page => 10, :page => params[:page])
          @reject = Application.where("is_librarian_approve = #{params[:id]}").order('created_at DESC').paginate(:per_page => 10, :page => params[:page])
          @approve = Application.where("is_librarian_approve = #{params[:id]}").order('created_at DESC').paginate(:per_page => 10, :page => params[:page])
        elsif current_user.role == 'Registrar'
          @application = Application.find(params[:id]) 
        else
          flash.now.alert = 'You are not registered as SoICT Clearance Application User!!'
        end
      end
      
    end
end
