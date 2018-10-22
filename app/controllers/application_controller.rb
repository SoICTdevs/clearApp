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

     #to handle routing errors
      rescue_from ActionController::RoutingError do |exception|
        logger.error 'Routing error occurred'
        render plain: '404 Not found', status: 404 
       end

      
       rescue_from ActionView::MissingTemplate do |exception|
        logger.error exception.message
        render plain: '404 Not found', status: 404 

      end
end
