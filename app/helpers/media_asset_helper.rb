module MediaAssetHelper
  require 'httparty'
  require 'geonames'
  require 'net/http'
require 'json'

     def select_media_asset    
          if params[:action_name] == nil || params[:action_name].blank? || params[:action_name]== 'removed'
           MediaAsset.where(is_active:true).select(:media_type).distinct.pluck(:media_type)
          else 
           MediaAsset.where(is_active:false).select(:media_type).distinct.pluck(:media_type)
          end
         end  
      
         def select_sub_media_asset
           sub_media = MediaAsset.where(media_type:select_media_asset).select(:sub_media_id).distinct.pluck(:sub_media_id,)
           AdvChannel.where(id:[sub_media]).pluck(:sub_channal_name)
          end

         def select_district
          MediaAsset.where(sub_media_id:select_sub_media_asset).select(:district).distinct.pluck(:district)
        end

        def type_of_adv_channel 
          AdvChannel.all.distinct.pluck(:channel_name)
        end
        def type_of_sub_adv_channel
          AdvChannel.where(channel_name:type_of_adv_channel).select(:district).pluck(:sub_channal_name)
        end
        

        def select_district_ddd
      
          # country = Carmen::Country.coded('in')
          # subregions= country.subregions
          # subdivisions.each do |subdivision|
          #   puts subdivision.name
          # end


       
            # geonames_username = 'dipakmmadavi' # Replace with your actual GeoNames API username
            # country_code = 'IN' # ISO 3166-1 alpha-2 country code for India
        
            # # Make the HTTP request to the GeoNames API
            # uri = URI("http://api.geonames.org/childrenJSON?geonameId=#{country_code}&username=#{geonames_username}")
            # response = Net::HTTP.get(uri)
        
            # # Parse the JSON response
            # data = JSON.parse(response)
        
            # # Extract states and their districts from the JSON data
            # states_and_districts = {}
            # data['geonames'].each do |item|
            #   debugger
            #   if item['fcode'] == 'ADM1' # 'ADM1' represents a state-level subdivision
            #     state_name = item['name']
            #     districts = item['adminName2'] # Assuming districts are available as 'adminName2'
            #     states_and_districts[state_name] = districts
            #   end
            # end 
    
        

        end
      
end
