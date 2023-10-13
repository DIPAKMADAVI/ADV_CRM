class SessionsController < ApplicationController
  # before_action :require_login

  def new
  end
  

  def create

    user = User.find_by(email:params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      session[:last_activity] = Time.current
      session[:expires_at] = 2.hours.from_now
      puts session
      redirect_to index_path, notice: 'Logged in successfully'
    else
      flash[:alert] = 'Invalid email or password'
       redirect_to root_path
      flash[:alert] = 'Invalid email or password'
    end
  rescue => e
    
    redirect_to root_path, notice: "An error occurred: #{e.message}"
  end



  def destroy
    # reset_session
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logged out successfully!'

  rescue => e
    redirect_to root_path, notice: "An error occurred: #{e.message}"
  end


 
  

  private
  
  def require_login
    unless current_user
      redirect_to login_path, alert: "Please log in to access this page."
    end
  end

end
