class MasterConfigurationController < ApplicationController
  def media_asset
  end

def add_channel



end 


  def pricing
  end

  def department

  end

  def adv_channel
  
      is_exists = AdvChannel.where(channel_name: params[:channel][:channel]) && AdvChannel.where(sub_channal_name:params[:channel][:sub_channel])
    if is_exists.present?
        @error = "Cahnnel_is  Already Exists"
      else        
        channel_details= params.require(:channel).permit(:channel_name, :sub_channal_name, :description)
        channel = AdvChannel.create!(channel_details)
        if channel
        @error=" Channel save successfully"
        redirect_to media_asset_path()
        else 
        @error="unable to save channel, something went wrong"
        end 
    end 
  end

  def roles
  end
end
