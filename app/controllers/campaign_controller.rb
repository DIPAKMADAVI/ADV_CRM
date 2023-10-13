class CampaignController < ApplicationController
  def index
    if (params[:action_name]=="removed" || params[:action]=="index" ) 
        @q = CustomerInfo.ransack(params[:q])
        @customer_info = @q.result(distinct: true).where(is_active: true).paginate(page: params[:page], per_page: 10) 
     end  
      if params[:action_name]=="active"
         @q = CustomerInfo.ransack(params[:q])
         @customer_info = @q.result(distinct: true).where(is_active: false ).paginate(page: params[:page], per_page: 10) 
     end 
    rescue => e
      redirect_to customer_index_path, notice: "An error occurred: #{e.message}"
  end

  def create_campaigin
    if (params[:action_name]=="removed" || params[:action]=="create_campaigin" ) 
      @q = AdvertisementPlan.ransack(params[:q])
      @advertisement_plan_info = @q.result(distinct: true).where(is_active: true, adv_plan_status: "Register").paginate(page: params[:page], per_page: 10) 
   end  
    if params[:action_name]=="create_campaigin"
       @q = AdvertisementPlan.ransack(params[:q])
       @advertisement_plan_info = @q.result(distinct: true).where(is_active: false,adv_plan_status: "Register").paginate(page: params[:page], per_page: 10) 
   end 
  end

  def campaign_Progress
  end

  def capmaign_analytics
  end
  
  def test
  end 

  def fetch_records_for_camp
   
    params[:id]= 58
    adv_details = []
    advertisement_plan = AdvertisementPlan.find(params[:id])
    selected_plan_id =  SelectedPlan.where(advertisement_detail_id:params[:id]).pluck(:price_plan_id)
    available_plan = Pricing.where(id:[selected_plan_id])
    all_plan = []
    all_plan =  available_plan.collect do |plan|
      [
        ["#{plan.media_assets.media_type} --> #{plan.media_assets.adv_channel.sub_channal_name} --> #{plan.price_scheme}"],[plan.id]
      ]
    end 
    debugger
    adv_details << [advertisement_plan]
    adv_details << all_plan
    puts adv_details
  end 


end


