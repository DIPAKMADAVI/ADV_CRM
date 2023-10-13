class AdverActionController < ApplicationController
  def index
    if (params[:action_name]=="removed" || params[:action]=="index" ) 
      @q = AdvertisementPlan.ransack(params[:q])
      @advertisement_plan_info = @q.result(distinct: true).where(is_active: true).paginate(page: params[:page], per_page: 10) 
   end  
    if params[:action_name]=="active"
       @q = AdvertisementPlan.ransack(params[:q])
       @advertisement_plan_info = @q.result(distinct: true).where(is_active: false ).paginate(page: params[:page], per_page: 10) 
   end 

    #  all_selected_plan = SelectedPlan.joins(:advertisement_plans).where(advertisement_detail_id:scheme.id)
    # totle_media,totle_media= []
    # all_selected_plan.collect do |scheme|
    #   debugger
    #   plan = scheme.pricings.price_scheme
    #   media = scheme.pricings.media_assets.media_type
    #   totale_plan << plan
    #   totle_media << media
    #   end
    # @selected_scheme =  totale_plan.uniq + totle_media.uniq

  rescue => e
    redirect_to adver_action_index_path, notice: "An error occurred: #{e.message}"

  end

  def update_adver
  end

  def view_adver
  end

  def delete_adver
  end

  def adv_Plan_for_edit
    
    

   end
end
