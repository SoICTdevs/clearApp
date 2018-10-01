class ApplicationController < ActionController::Base

    helper_method :current_student

    private
      def current_student
        @current_student ||= Student.find_by_auth_token!( cookies[:auth_token]) if cookies[:auth_token]
      end

      def verify_student_logged_in
        unless current_student
            redirect_to login_path
        end 
      end
end
