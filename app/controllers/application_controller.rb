class ApplicationController < ActionController::Base

    helper_method :current_user

    private
      def current_user
        #@current_user ||=Student.find(session[:user_id]) if session[:user_id]
        #@current_user ||=User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
        @current_user ||= Student.find_by_auth_token!( cookies[:auth_token]) if cookies[:auth_token]
      end

      def verify_logged_in
        unless current_user
            redirect_to login_path
        end 
      end
end
