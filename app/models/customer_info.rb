class CustomerInfo < ApplicationRecord

     def self.ransackable_attributes(auth_object = nil)
          ["created_at", "cust_address", "cust_email", "customer_district", "customer_state", "customer_status", "first_name", "gender", "id", "is_active", "is_remove", "last_name", "phone_number", "profile_pic", "updated_at"]
        end

        def self.ransackable_associations(auth_object = nil)
          ["business_details"]
        end
      

     enum customer_type: {"Existing" => 1, "Potential" => 2, "Temporory" =>3}  
     has_many :advertisement_plans, foreign_key: :customer_id
    #  has_many :advertisement_plans,foreign_kes: 
end 
