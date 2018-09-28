class Admin::UsersController < Admin::ApplicationController
  #before_action :verify_logged_in
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User created successfully"
      redirect_to admin_users_path
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
  def user_params
    params.require(:user).permit(:name, :email, :role, :password, :auth_token)
  end
end
