class Admin::ApplicationsController < Admin::ApplicationController
  before_action :verify_logged_in
  def edit
    @page_title = 'Student Application Details'
    @application = Application.find(params[:id])
  end

  def update
  end

  def index
    @applications = Application.all.order('created_at DESC').paginate(:per_page => 10, :page => params[:page])
  end

  def show
  end

  def destroy
  end
end
