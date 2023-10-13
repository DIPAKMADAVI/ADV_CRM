module AdvChannelHelper

   def select_all_channel
    if params[:action_name] == nil || params[:action_name].blank? || params[:action_name]== 'removed'
     AdvChannel.where(is_active:true).select(:channel_name).distinct.pluck(:channel_name)
    else 
     AdvChannel.where(is_active:false).select(:channel_name).distinct.pluck(:channel_name)
    end
   end

   def select_sub_channel
     AdvChannel.where(channel_name:select_all_channel).select(:sub_channal_name).select(:sub_channal_name).distinct.pluck(:sub_channal_name)
   end

end
