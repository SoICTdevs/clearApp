class Admin::ApplicationController < ActionController::Base

  layout 'admin/application'
    
    helper_method :current_user

    private
      def current_user
        @current_user ||= User.find_by_auth_token!( cookies[:auth_token]) if cookies[:auth_token]
      end

      def verify_userlogged_in
        unless current_user
            redirect_to login_path
        end 
      end
end
