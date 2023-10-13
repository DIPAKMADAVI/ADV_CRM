class UserController < ApplicationController
  def index
    if (params[:action_name]=="removed" || params[:action]=="index" ) 
      @q = User.ransack(params[:q])
      @user_detail = @q.result(distinct: true).where(is_active: true).paginate(page: params[:page], per_page: 10) 
   end  
    if params[:action_name]=="active"
       @q = User.ransack(params[:q])
       @user_detail = @q.result(distinct: true).where(is_active: false ).paginate(page: params[:page], per_page: 10) 
   end 
  rescue => e
    redirect_to user_index_path, notice: "An error occurred: #{e.message}"
      

  end

  def create_user
    filtered_params = remove_prefix(params, "Add_")
    is_exist =User.where(email:filtered_params[:email],phone_no:filtered_params[:phone_no])
    
     if is_exist.present?
      redirect_to user_index_path, notice: "Already exist"
    else   
    user_params =  filtered_params.permit(:firstname, :lastname, :department_id, :role_id, :date_of_birth,:gender, :email, :phone_no, :state, :district, :city, :password, :user_address)
      @user = User.new(user_params)
      if @user.save
        redirect_to user_index_path, notice: 'Record updated successfully.'
      else
        redirect_to user_index_path, notice: 'Something went wrong, plz try again'
      end
    end
    rescue => e
    redirect_to user_index_path, notice: "An error occurred: #{e.message}"
    
  end

  def remove_user
    user = User.find(params[:id])
    removed_user= user.update(is_active:false, is_remove:true) if params[:user_action]=="deactivate"
    removed_user= user.update(is_active:true, is_remove:false) if params[:user_action]=="activate"
    if removed_user
    redirect_to user_index_path, notice: 'records is  successfully  ' + params[:user_action] + ''  
    else 
    redirect_to user_index_path, alert: 'sowmthing went wrong unable to remove the record plz try again.'
    end 

    rescue => e
    redirect_to user_index_path, notice: "An error occurred: #{e.message}"

  end




  def update_user

    @user = User.find(params[:id])
    update_params = params.permit(email:"a",role_id:"a", adv_department:"a")
   saved_user =  @user.update(update_params)
    if saved_user
      redirect_to user_index_path, notice: 'Record Save successfully.'
    else
      redirect_to user_index_path, notice: 'Something went wrong, plz try again'
    end
  rescue => e
    redirect_to user_index_path, notice: "An error occurred: #{e.message}"

  end





  private

  def remove_prefix(hash, prefix)
    hash.transform_keys { |key| key.sub(prefix, "") }
  end
end
