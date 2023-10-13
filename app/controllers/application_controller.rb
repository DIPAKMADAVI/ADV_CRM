class ApplicationController < ActionController::Base
  
  include ActionController::Flash
     protect_from_forgery with: :exception
     helper_method :current_user
     before_action :check_session_expiration
     
     def current_user  
          @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
     end



      
        private
        
        # def handle_custom_error(exception)
        #   # Custom error handling logic
        #   render json: { error: exception.message }, status: :unprocessable_entity
        # end
        
        def check_session_expiration
          if (session[:expires_at] && session[:expires_at] < Time.now) 
            redirect_to root_path, notice: 'Your session has expired. Please log in again.'
            reset_session 
          end

        end

end
