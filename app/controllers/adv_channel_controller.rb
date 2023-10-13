class AdvChannelController < ApplicationController
  rescue_from StandardError, with: :handle_standard_error
def index
    if (params[:action_name]=="removed" || params[:action]=="index" ) 
        @q = AdvChannel.ransack(params[:q])
        @adv_channel = @q.result(distinct: true).where(is_active: true).paginate(page: params[:page], per_page: 10) 
    end  
    if params[:action_name]=="active"
      @q = AdvChannel.ransack(params[:q])
      @adv_channel = @q.result(distinct: true).where(is_active: false ).paginate(page: params[:page], per_page: 10) 
    end   
end

  def add_channel
    is_exists = AdvChannel.where(channel_name: params[:channel][:channel_name],sub_channal_name:params[:channel][:sub_channal_name])
    if is_exists.present? 
        @error = "AdvChannel Is   Already Exists"
      else        
       
        add_channel_data= params.require(:channel).permit(:channel_name, :sub_channal_name, :description)
        
        add_channel_data[:is_active]=true
        add_channel_data[:is_remove]=false 
        channel = AdvChannel.create!(add_channel_data)
        if channel
         
        redirect_to channel_index_path, notice: " channel save successfully"
        else 
        redirect_to channel_index_path, notice: "unable to save channel, something went wrong"
        end 
        
    end 
  rescue => e
    redirect_to channel_index_path, notice: "An error occurred: #{e.message}"

  end

  def update_channel
    @adv_channel = AdvChannel.find(params[:id])
    params[:channel_name]=params[:update_channel_name]
     update_params = params.permit(:id,:channel_name,:sub_channal_name,:description)
     if @adv_channel.update(update_params)
       redirect_to channel_index_path, notice: 'Record updated successfully.'
     else
       redirect_to channel_index_path, notice: 'Something went wrong, plz try again'
     end
    redirect_to channel_index_path, notice: "An error occurred: #{e.message}"
  rescue => e
    redirect_to channel_index_path, notice: "An error occurred: #{e.message}"


  end

  def remove_channel
      channel = AdvChannel.find(params[:id])
    
      removed_chanel= channel.update(is_active:false, is_remove:true) if params[:channel_action]=="deactivate"
      removed_chanel= channel.update(is_active:true, is_remove:false) if params[:channel_action]=="activate"
      if removed_chanel
      redirect_to channel_index_path, notice: 'records is  successfully ' + params[:channel_action] + '' 
      else 
      redirect_to channel_index_path, alert: 'sowmthing went wrong unable to remove the record plz try again.'
      end 
    rescue => e
      redirect_to channel_index_path, notice: "An error occurred: #{e.message}"
  
  end


  private
  def handle_standard_error(exception)
   
    logger.error "An error occurred: #{exception.message}"
    render plain: "An error occurred, please try again later.", status: :internal_server_error
  end

end
