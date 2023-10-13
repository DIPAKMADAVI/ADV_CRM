class CustomerController < ApplicationController
  def index
   puts  params 
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




  def add_customer 
    
    filtered_params = remove_prefix(params, "Add_")  if params[:commit] =="Add_Detail"
    is_exist_customer =CustomerInfo.where(phone_number: filtered_params[:phone_number],cust_email: filtered_params[:cust_email],customer_status: "Existing") 
    

      if params[:customer_type_details]=="Existing"
            is_exist_business =BusinessDetail.where(customer_id:[is_exist_customer.id] ,business_name: filtered_params[:business_name],business_mobile: filtered_params[:business_mobile])
              if is_exist_business.present?
                @message = "Record already exists with phone number: #{filtered_params[:contact]}, email: #{filtered_params[:email]}" 
              else 
                permitted_business = permitted_business.permit(:business_name,:business_mobile,:customer_id,:business_sector,:business_state,:business_district,:business_address,:business_website,:company_mail)
                permitted_business[customer_id]= is_exist_customer.id
                business_detail = BusinessDetail.create!(permitted_business)
                # redirect_to customer_index_path, notice: 'Record Save successfully.'
              end
        else (params[:Add_customer_type_details]=="new")
            if is_exist_customer.present?
              @message = "Record already exists with phone number: #{filtered_params[:contact]}, email: #{filtered_params[:email]}" 
            else 
                filtered_params[:customer_status] = :Existing
                permitted_data = filtered_params.permit(:first_name,:customer_status,:last_name,:cust_email,:phone_number,:customer_state,:customer_district,:cust_address)
                saved_customer= CustomerInfo.create!(permitted_data)
                  if saved_customer.present? 
                    permitted_business = filtered_params.permit(:business_name,:customer_id,:business_sector,:business_mobile_number,:business_state,:business_district,:business_address,:business_website,:company_mail)
                    is_exist_business =BusinessDetail.where(customer_id:[saved_customer.id] ,business_name: filtered_params[:business_name])
                      if is_exist_business.present?
                        # redirect_to customer_index_path, notice: 'Record already exist .'
                      else 
                        permitted_business[:customer_id]= saved_customer.id
                        permitted_business = permitted_business.permit(:business_name,:customer_id,:business_sector,:business_mobile_number,:business_state,:business_district,:business_address,:business_website,:company_mail)
                        business_detail = BusinessDetail.create!(permitted_business)
                        # redirect_to customer_index_path, notice: 'Record Save successfully.'
                      end 
                end
            end
        end 
        respond_to do |format|
          format.js   # Handle JavaScript format
          # format.html # Handle HTML format (if needed)
        end
       
     rescue ActiveRecord::RecordInvalid => e
      flash[:notice] = "Error saving customer or business details: #{e.message}"
      redirect_to customer_index_path
  end

    
  def update_customer
    filtered_params = remove_prefix(params, "Update_")  if params[:commit] =="Update_Detail"
        exits_customer_records =CustomerInfo.find_by_id(filtered_params[:cust_id])
        updated_cust_attributes = filtered_params.permit(:first_name,:customer_status,:last_name,:cust_email,:phone_number,:customer_state,:customer_district,:cust_address)
       
        # exits_customer_records.each do |cust_record|
        exits_customer_records.assign_attributes(updated_cust_attributes)
        if exits_customer_records.changed?
          @save_existing_customer = exits_customer_records.save
        end 
      # end

        filtered_params = remove_prefix(params, "Update_")  if params[:commit] =="Update_Detail"
        filtered_params[:customer_id]= params[:Update_cust_id]
        updated_buss_attributes =  filtered_params.permit(:business_name,:customer_id,:business_sector,:business_mobile_number,:business_state,:business_district,:business_address,:business_mail)
        business_records_to_update  = BusinessDetail.where(customer_id:params[:Update_cust_id], id: params[:busi_id])

          # save_business = business_records_to_update.update(updated_buss_attributes)
          
          business_records_to_update.each do |business_record|
            business_record.assign_attributes(updated_buss_attributes)
            if business_record.changed?
              @save_existings_business = business_record.save
            end
          end
          
          redirect_to customer_index_path, notice: 'Customer and Business Record updated successfully.'  if ( @save_existings_business.present? || @save_existing_customer.present? )
          redirect_to customer_index_path, notice: "You have not made any change in records " if (!@save_existings_business.present? && !@save_existing_customer.present?)
       
        rescue ActiveRecord::RecordInvalid => e
          flash[:notice] = "Error saving customer or business details: #{e.message}"
          redirect_to customer_index_path
      # end 
  end

  def remove_customer
    customer_info = CustomerInfo.find(params[:id])
    removed_customer= customer_info.update(is_active:false, is_remove:true) if params[:cust_action]=="deactivate"
    removed_customer= customer_info.update(is_active:true, is_remove:false) if params[:cust_action]=="activate"
    if removed_customer
    redirect_to customer_index_path, notice: 'records is  successfully  ' + params[:cust_action] + ''  
    else 
    redirect_to customer_index_path, alert: 'sowmthing went wrong unable to remove the record plz try again.'
    end 

    rescue => e
    redirect_to customer_index_path, notice: "An error occurred: #{e.message}"

  end


  def details_for_edit
    customer_info = CustomerInfo.find(params[:id])
    business_details = BusinessDetail.where(customer_id: params[:id])
    business_details_id = business_details.pluck(:business_name ,:id)
    @customer = [customer_info] + [business_details_id]
    render json: @customer
  end 
   
  def fetch_specific_business_data
    @business_details = BusinessDetail.find(params[:selectedValue])
    render json: @business_details
  end 

  def customer_by_state_dist
      if params[:ajax_action] =="cust_by_id"
        cust = CustomerInfo.find(params[:id])
        render json: cust
      end 

    if params[:ajax_action] =="cust_by_dist"
        customer = CustomerInfo.where(customer_state: params[:state], customer_district: params[:district], is_active: true)
        customer_list = customer.map do |cust|
          ["#{cust.first_name} #{cust.last_name} --> #{cust.customer_state}-#{cust.customer_district}", cust.id]
        end
        puts customer_list;
        render json: customer_list
      end
  end




  def add_advertisement

          filtered_params = remove_prefix(params, "Adver_")  if params[:action] == "add_advertisement"
          filtered_params[:customer_id] =  BusinessDetail.find(filtered_params[:business_detail_id]).customer_id
          permitted_params = filtered_params.permit(:customer_id,:title_of_adv,:business_detail_id,:est_start_date,:est_end_date,:adv_plan_status)
          @data_to_save = AdvertisementPlan.new(permitted_params)

        if @data_to_save.valid?
            @data_to_save.save
   
                if @data_to_save.errors.any?
                  # flash[:error] = "Error saving ADVERTISEMT  details: #{e.message}"
                  # redirect_to customer_index_path
                  @error = "error ouccur"
                else
                      selected_plan = {}
                      plan_and_quantity = params[:selectedPlans].map do |string|
                      string.split(',').map(&:to_i)
                      end
                      count = 0
                  plan_and_quantity.each do |plan|
                    selected_plan = {
                                      advertisement_detail_id: @data_to_save.id,
                                      business_detail_id: filtered_params[:business_detail_id].to_i,
                                      price_plan_id: plan[0],
                                      scheme_count: plan[1]
                                    }
                    permitted_plans_params = SelectedPlan.create(selected_plan)
                      count = count+1  if permitted_plans_params.present? && permitted_plans_params.errors.blank?
                  end
                  @message = "sucessfull"
                  # if (plan_and_quantity.length == count)
                  # flash[:notice] ="data  save succesfully"
                  #   redirect_to customer_index_path
                 
                    # @error = "error ouccur"
                    # flash[:error] ="plan not saved completly. something went wrong "
                    # redirect_to customer_index_path
                end 

           
        else
          @error = "error ouccur"
          # flash[:error] = "Error saving ADVERTISEMT  details: #{e.message}"
          # redirect_to customer_index_path
        end 
        # rescue ActiveRecord::RecordInvalid => e
        #   flash[:error] = "Error saving ADVERTISEMT  details: #{e.message}"
        #   redirect_to customer_index_path

        # rescue ActiveRecord::RecordNotSaved => e
        #   @error = "An unexpected error occurred: #{e.message}"
        # rescue => e
        #   @error = "An unexpected error occurred: #{e.message}"
        # selected_price_scheme = Pricing.where(price_scheme:converted_plans)
        # request.format = :js 
        # respond_to do |format|
        # request.format = :js 
        # format.js
        # end 
  end


  def get_scheme_data_plan
    if params[:sub_types].present?
       available_plan = Pricing.joins(:media_assets).where(price_scheme:params[:selected_scheme],sub_media_id:params[:sub_types])
    else 
       available_plan = Pricing.joins(:media_assets).where(price_scheme: params[:selected_scheme]).where(media_assets: { media_type: params[:type_of_adv] })
    end 
      all_plan = []
      all_plan =  available_plan.collect do |plan|
        [
          ["#{plan.media_assets.media_type} --> #{plan.media_assets.adv_channel.sub_channal_name} --> #{plan.price_scheme}"],[plan.id]
        ]
      end 
      render json: all_plan
  end 







  private

  def remove_prefix(hash, prefix)
    hash.transform_keys { |key| key.sub(prefix, "") }
  end

end




# elsif  filtered_params[:customer_type_details] == "Existing" 
#   exits_customer_records =CustomerInfo.find_by_id(filtered_params[customer_id])
#   updated_cust_attributes = filtered_params.permit(:first_name,:customer_status,:last_name,:cust_email,:phone_number,:customer_state,:customer_district,:cust_address)
#   exits_customer_records.assign_attributes(updated_cust_attributes)
#     if exits_customer_records.changed?
#       save_existing_customer = exits_customer_records.save

#         exist_business_record  = BusinessDetail.where(customer_id: [save_existing_customer.id ], business_name: filtered_params[:business_name])
#         updated_buss_attributes =  params.permit(:business_name,:customer_id,:business_sector,:business_mobile,:business_state,:business_district,:business_address,:business_website,:business_mail)
#         exist_business_record.assign_attributes(updated_buss_attributes)
#         if exist_business_record.changed?
#           save_business = exist_business_record.save
#           redirect_to customer_index_path, notice: 'customer and Business Record updated successfully.'  if save_business.present?
#         end
#     end 
# end