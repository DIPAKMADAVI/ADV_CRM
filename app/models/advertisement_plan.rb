class AdvertisementPlan < ApplicationRecord
    enum advertisement_status: ["Register", "Creativity", "Active", "Inactive", "Progress",]

     def self.ransackable_attributes(auth_object = nil)
         [ "title_of_adv", "customer_id", "adv_media_id","customer_name", "selected_media" ,"business_detail_id", "placement", "budget_plan", "est_start_date", "est_end_date", "adv_plan_status", "description"]
       end
       
       def self.ransackable_associations(auth_object = nil)
        []
      end
  


      has_many :users, class_name: 'User' 
      has_and_belongs_to_many :adv_channels
      has_many :selected_Plans, class_name: 'SelectedPlan', foreign_key:'advertisement_detail_id'
      belongs_to :customer_infos, class_name: 'CustomerInfo', foreign_key:'customer_id'
      belongs_to :business_details, class_name: 'BusinessDetail', foreign_key:'business_detail_id'

    end 
    