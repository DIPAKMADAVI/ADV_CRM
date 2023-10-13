class MediaAssetController < ApplicationController

  def index
      if (params[:action_name]=="removed" || params[:action]=="index" ) 
          @q = MediaAsset.ransack(params[:q])
          @media_asset = @q.result(distinct: true).where(is_active: true).paginate(page: params[:page], per_page: 10) 
    end  
      if params[:action_name]=="active"
        @q = MediaAsset.ransack(params[:q])
        @media_asset = @q.result(distinct: true).where(is_active: false ).paginate(page: params[:page], per_page: 10) 
    end 

  rescue => e
    redirect_to media_asset_path, notice: "An error occurred: #{e.message}"
  end

  def add_asset

        if params[:media_type]=="Redio"
        params[:sub_media_id]=params[:sub_media_type_1]
        media_asset_details= params.permit(:media_type,:state,:district,:sub_media_id)  
        is_exists= MediaAsset.where(media_asset_details)
        # is_exists = MediaAsset.where(media_type:media_asset_details[:media_type], sub_media_id:media_asset_details[:sub_media_id], state:media_asset_details[:state], district:media_asset_details[:district])
        end

       if params[:media_type]=="Newspaper"
        params[:sub_media_id]=params[:sub_media_type_2]
        params[:dimentions]=params[:news_dimentions]   
        params[:town_city]=params[:news_twon]
        media_asset_details= params.permit(:media_type,:state,:district,:sub_media_id,:dimentions,:town_citys) 
        is_exists= MediaAsset.where(media_asset_details)
         
        # is_exists = MediaAsset.where(media_type:media_asset_details[:media_type], sub_media_id:media_asset_details[:sub_media_id], state:media_asset_details[:state], district:media_asset_details[:district],town_city:media_asset_details[:town_city],dimentions:media_asset_details[:dimentions])
      end

      if params[:media_type]=="Hoarding"
      
        params[:sub_media_id]=params[:sub_media_type_3]
        params[:dimentions]=params[:hording_dimentions]   
        params[:town_city]=params[:news_twon]
        params[:area_location]=params[:area]
        media_asset_details= params.permit(:media_type,:state,:district,:sub_media_id,:dimentions,:town_citys,:area_location,:number_of_count)  
        is_exists= MediaAsset.where(media_asset_details)
        # is_exists = MediaAsset.where(media_type:media_asset_details[:media_type], sub_media_id:media_asset_details[:sub_media_id], state:media_asset_details[:state], district:media_asset_details[:district],town_city:media_asset_details[:town_city],dimentions:media_asset_details[:dimentions],area_location:media_asset_details[:area_location],number_of_count:media_asset_details[:number_of_count])
      end
        
        
        if is_exists.present? 
        redirect_to media_asset_path, notice: "Media aseet is  Already Exists"
         else 
        media = MediaAsset.create(media_asset_details) 


          if media
            # @error=" media asset  save successfully"
            redirect_to media_asset_path, notice:" media asset  save successfully"
            else 
            redirect_to media_asset_path, notice:" nat save... unable to save media_asset, something went wrong"
            # @error="unable to save media_asset, something went wrong"
           end 
        end

      rescue => e
        redirect_to media_asset_path, notice: "An error occurred: #{e.message}"
 
  end



  def remove_asset
    
    media = MediaAsset.find(params[:id])
    removed_media= media.update(is_active:false, is_remove:true) if params[:media_action]=="deactivate"
    removed_media= media.update(is_active:true, is_remove:false) if params[:media_action]=="activate"
    if removed_media
    redirect_to media_asset_path, notice: 'records is  successfully ' + params[:media_action] + '' 
    else 
    redirect_to media_asset_path, alert: 'sowmthing went wrong unable to remove the record plz try again.'
    end 

  rescue => e
    redirect_to media_asset_path, notice: "An error occurred: #{e.message}"

  end

  def update_asset
    #
    @media_asset = MediaAsset.find(params[:id])
    if @media_asset.update(update_params)
      redirect_to media_asset_path, notice: 'Record updated successfully.'
    else
      redirect_to media_asset_path, notice: 'Something went wrong'
    end

  rescue => e
    redirect_to media_asset_path, notice: "An error occurred: #{e.message}"

    end
end
