class PricingController < ApplicationController
  def index
 if (params[:action_name]=="removed" || params[:action]=="index" ) 
      @q = Pricing.ransack(params[:q])
      @Pricing_data = @q.result(distinct: true).where(is_active: true).paginate(page: params[:page], per_page: 10) 
 end  
  if params[:action_name]=="active"
     @q = Pricing.ransack(params[:q])
     @Pricing_data = @q.result(distinct: true).where(is_active: false ).paginate(page: params[:page], per_page: 10) 
 end 

rescue => e
  redirect_to pricing_index_path, notice: "An error occurred: #{e.message}"

  end

  def create
    begin 
    if params[:set_price].present?
        add_priceing = params.require(:set_price).permit(:sub_media_id, :price_scheme, :price)
        is_exist = Pricing.where(add_priceing)
    
        if is_exist.blank?
          @pricing= Pricing.create(add_priceing) 
          redirect_to pricing_index_path, notice: 'Price save successfully '
        else 
          redirect_to pricing_index_path, notice: 'Price already added in databasetray anaother'
        end 
      end
    rescue ActiveRecord::RecordInvalid => e
      redirect_to pricing_index_path, notice:"Error: #{e.message}"
    end 
  rescue => e
    redirect_to pricing_index_path, notice: "An error occurred: #{e.message}"
  end

  def update
  end

  def remove
    pricing = Pricing.find(params[:id])
    removed_pricing = pricing.update(is_active:false, is_remove:true) if params[:pricing_action]=="deactivate"
    removed_pricing = pricing.update(is_active:true, is_remove:false) if params[:pricing_action]=="activate"
    if removed_pricing
    redirect_to pricing_index_path, notice: 'records is  successfully  ' + params[:pricing_action] + ''  
    else 
    redirect_to pricing_index_path, alert: 'sowmthing went wrong unable to remove the record plz try again.'
    end 

  rescue => e
  redirect_to pricing_index_path, notice: "An error occurred: #{e.message}"

  end


    def submedia_for_pricing
      if  params[:search_action] == "customer_form"
        sub_media1 = MediaAsset.where(media_type:params[:selected_option])
        sub_media=[]
          sub_media1.each do |a|
            data =[[a.adv_channel.sub_channal_name],[a.id]]
            sub_media << data
          sub_media << data
          end 
      end
        if  params[:search_action] == nil
        sub_media1 = MediaAsset.where(media_type:params[:selected_option])
        sub_media=[]
          sub_media1.each do |a|
          data =[[a.media_type,a.adv_channel.sub_channal_name,a.state,a.district,a.area_location,a.dimentions,a.number_of_count],[a.id]]
          sub_media << data
          end
        end 
      render json: sub_media

    rescue => e
      redirect_to pricing_index_path, notice: "An error occurred: #{e.message}"
    end 
end
